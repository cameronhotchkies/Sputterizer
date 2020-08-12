// https://github.com/shannon-greenlight/Arduino-Libs
#include <TerminalVT100.h>
#include <stdlib.h>
#include <EEPROM.h>
#include <TimerOne.h>
#include <Selector.h>

// vt-100 row positions
#define FXN_ROW "6"
#define PULSE_LEN_ROW "7"
#define DECAY_ROW "8"
#define RANDOM_ROW "9"
#define SEQUENCE_ROW "8"
#define SEQ_INDEX_ROW "9"
#define USER_VAR_ROW 10
#define TRIGGER_ROW "20"
#define DEBUG_ROW "21"
#define INPUT_ROW "21"
#define MSG_ROW "21"

#define lenPin A0
#define rndPin A5
#define decayPin A4
#define gatePin 13
#define inPin 4
#define dirPin 8
#define reset_trigPin 10
#define pwmPin 11

int cmd = 0;	// terminal input command
boolean tog = false; // for toggle
boolean trig = false;
boolean triggered = false;
boolean in_user = false;
boolean esc_mode = false;
boolean repeat_mode = false;

volatile unsigned int pulseLen;
volatile float rndVal;
volatile int rptCount = 0;
volatile float theDecay;
volatile int theDelay = 0;

// User variables
const int sl = 10;
unsigned int init_delay[sl];
unsigned int longest_pulse[sl];
unsigned int shortest_pulse[sl];
unsigned int random_factor[sl];
unsigned int decay_factor[sl];
unsigned int repeat_count[sl];

String sequence = "";
int sequence_index = 0;

unsigned int* user_var;
String sval = "00000";
String label = "unset";

// maybe move these to fxn args someday
int num_digs = 5;
unsigned int user_min = 0;
unsigned int user_max = 99999;

// device function defs
unsigned int fxn = 0;
boolean newFxn = true;	// true when we have changed function
String theFxn = "";
const int num_fxns = 12;
Selector s = Selector(num_fxns);

void intFxnA(void) {
	s.e.aChanInt();
}

void intFxnB(void) {
	s.e.bChanInt();
}
void reset_trigger() {
	// pulse reset_trigPin
	digitalWrite(reset_trigPin, LOW);
	delay(1);
	digitalWrite(reset_trigPin, HIGH);
	delay(1);
	digitalWrite(reset_trigPin, LOW);
}

const String theFunctions[] = {
  "Up",
  "Down",
  "Up/Down",
  "Down/Up",
  "Up Repeat",
  "Down Repeat",
  "Up/Down Repeat",
  "Down/Up Repeat",
  "Stretch",
  "Toggle",
  "Maytag",
  "User"
};

// EEPROM defs
const unsigned int data_available_offset = 0;
const unsigned int cell_size = sizeof(init_delay);
const unsigned int fxn_offset = 5;
const unsigned int init_delay_offset = sizeof(fxn) + fxn_offset;
const unsigned int longest_pulse_offset = init_delay_offset + cell_size;
const unsigned int shortest_pulse_offset = init_delay_offset + 2 * cell_size;
const unsigned int random_factor_offset = init_delay_offset + 3 * cell_size;
const unsigned int decay_factor_offset = init_delay_offset + 4 * cell_size;
const unsigned int repeat_count_offset = init_delay_offset + 5 * cell_size;
const unsigned int sequence_offset = init_delay_offset + 6 * cell_size;
const int sequence_index_offset = sequence_offset + sl + 1;
const int repeat_mode_offset = sequence_index_offset + sizeof(int);

// useful objects
TerminalVT100 t;

void setup() {
	String data_available = "Data";
	analogRead(lenPin);
	pinMode(gatePin, OUTPUT);
	pinMode(reset_trigPin, OUTPUT);
	pinMode(pwmPin, OUTPUT);
	pinMode(inPin, INPUT);
	pinMode(dirPin, INPUT);
	digitalWrite(gatePin, LOW);
	analogWrite(pwmPin, 255);
	reset_trigger();

	// Wait for PuTTY port to get out of bed. Otherwise we pick up garbage.
	t.begin();
	delay(2000);

	//t = TerminalVT100();
	s.set_terminal(t);

	//e.debug = true;
	// Use Putty to communicate (VT100 terminal)
	t.clrScreen();
	t.setCursor("1", "1");
	const int stars = 76;
	
	t.printChars(stars, "*");
	t.println("");
	t.printTitle(stars, F("The Sputterizer  by  GREENFACE LABS "));
	t.printTitle(stars, F("v3.0"));
	t.printChars(stars, "*");

	set_default_user_vars();


	// retrieve stored data or store init data
	String data_avail = "";
	eep_get_string(data_available_offset, data_avail);
	//t.println("Data avail: " + data_avail);
	if (data_avail == data_available && !digitalRead(inPin)) {
		retrieve_data();
	}
	else {
		store_data();
		// mark data is stored and available
		eep_update_string(data_available_offset, data_available);
	}

	//debug();
	setFxn();

	// interrupts
	attachInterrupt(0, intFxnB, RISING);
	attachInterrupt(1, intFxnA, RISING);
	Timer1.initialize(50000);
	Timer1.attachInterrupt(watch_trig);	// heartbeat every 50ms

	//do_delay(1000);

}

void set_default_user_vars() {
	for (sequence_index = 0; sequence_index < sl; sequence_index++) {
		init_delay[sequence_index] = 0;
		longest_pulse[sequence_index] = 500;
		shortest_pulse[sequence_index] = 20;
		random_factor[sequence_index] = 0;
		decay_factor[sequence_index] = 500;
		repeat_count[sequence_index] = 1;
	}
	sequence = "";
	sequence_index = 0;
	repeat_mode = false;
}

char c_toupper(char c) {
	if (c > 95 && c != 127) c -= 32;
	return c;
}

/*
Saved just in case
void shift(String* s, char c, int ndigs) {
	*s += c;
	if (s->length() > ndigs)* s = s->substring(1);
}

void shift(String* s, char c) {
	*s += c;
	if (s->length() > num_digs)* s = s->substring(1);
}

void printDebug(String s) {
	t.setCursor(DEBUG_ROW, "1");
	t.clrToEOL();
	t.print(s);
}
*/


boolean isDifferent(float a, float b) {
	int ai = int(100 * a);
	int bi = int(100 * b);
	return (ai != bi);
}

void printVal(String row, String label, String val) {
	t.setRow(row);
	t.print(label);
	t.clrToEOL();
	t.println(val);
}

void printStr(String row, String s) {
	t.setRow(row);
	t.clrToEOL();
	t.println(s);
}

void print_triggered() {
	t.setCursor(TRIGGER_ROW, "1");
	if (trig) {
		t.blinkOn();
		t.println(F("TRIGGERED"));
		t.blinkOff();
	}
	else {
		t.blinkOff();
		t.clrToEOL();
	}
}

void print_sequence_index() {
	int base_pos = 11;
	String pos = String(sequence_index + base_pos);
	t.setCursor(SEQ_INDEX_ROW, String(base_pos));
	t.clrToEOL();
	t.setCursor(SEQ_INDEX_ROW, pos);
	t.print("^");
}

void print_sequence() {
	t.setRow(SEQUENCE_ROW);
	t.clrToEOL();
	t.print("Sequence: " + sequence);
	if (repeat_mode) {
		t.blinkOn();
		t.print(F("\tRepeat Mode On"));
		t.blinkOff();
	}
	print_sequence_index();
}

int print_user_vars() {
	int row = USER_VAR_ROW;
	printStr(String(row++), "I. Initial Delay: " + String(init_delay[sequence_index]) + "\tL. Longest Pulse: " + String(longest_pulse[sequence_index]) + "\tH. sHortest Pulse: " + String(shortest_pulse[sequence_index]));
	printStr(String(row++), "F. Decay Factor: " + String(decay_factor[sequence_index]) + "\tR. Random Factor: " + String(random_factor[sequence_index]) + "\tN. Repeat Number: " + String(repeat_count[sequence_index]));
	print_sequence();
	print_sequence_index();
	return row;
}

void help() {
	printStr(String(MSG_ROW), F("RTFM at https://www.greenfacelabs.com/user-mode/"));
}

void user_fxn() {
	int row = print_user_vars();
	row++;
	printStr(String(row++), F("X. Exit User mode\t!. Trigger Sequence\t*. Toggle Repeat Mode"));
	printStr(String(row++), F("U. Add Up\t\tD. Add Down\t\tS. Add Strange"));
	printStr(String(row++), F("T. Add Top\t\tB. Add Bottom\t\tC. Add Charm"));
	printStr(String(row++), F("BSP. Delete Sput\tSP. Clear Entry\t\tENT. Accept entry"));
	printStr(String(row++), F("@. Set Factory Defaults\t#. Comment\t\t?. Help"));
	print_triggered();
	print_sequence();
}

void setFxn() {
	fxn = s.get();
	theFxn = theFunctions[fxn];
	t.clrDown("5");
	printVal(FXN_ROW, "Fxn: ", theFxn);
	s.set(fxn);
	newFxn = true;	// force printing of config data
	switch (fxn) {
	case 11:
		in_user = true;
		user_fxn();
		break;
	default:
		in_user = false;
		pulseLen = 0;
		theDecay = 0.1;
		rndVal = 0;
		theDelay = 0;
		rptCount = 0;
	}
	EEPROM.update(fxn_offset, fxn);
}

void setLen() {
	int d = readVal(lenPin);
	d /= 10;
	d *= 10;
	d = max(10, d);
	if (theFxn == "Stretch" || theFxn == "Maytag") {
		d *= 10;
	}
	//printDebug("PL: "+String(pulseLen)+"d: "+String(d));
	if (pulseLen != d || newFxn) {
		pulseLen = d;
		printVal(PULSE_LEN_ROW, "Pulse Length: ", String(d));
	}

}

void setDecay() {
	float decay;
	int val = readVal(decayPin);
	decay = .001 * val;
	decay = min(decay, .9);
	decay = max(.1, decay);
	if (isDifferent(decay, theDecay) || newFxn) {
		theDecay = decay;
		printVal(DECAY_ROW, "Decay: ", String(decay));
	}
}

void setRnd() {
	int r = readVal(rndPin);
	r /= 10;
	r *= 10;
	if (isDifferent(rndVal, r) || newFxn) {
		rndVal = r;
		printVal(RANDOM_ROW, "Randomness: ", String(rndVal));
	}
}

// stretch variables
void setDelay() {
	int d = readVal(decayPin);
	d /= 10;
	d *= 100;
	if (d != theDelay || newFxn) {
		theDelay = d;
		printVal(DECAY_ROW, "Delay: ", String(theDelay));
	}
}
void setRepeat() {
	int rpt = 0;
	float rv = readVal(rndPin);
	float q = rv / 1024;
	q *= 100;
	rpt = int(q);
	rpt += 1;
	if (rpt != rptCount || newFxn) {
		rptCount = rpt;
		printVal(RANDOM_ROW, "Repeat: ", String(rptCount));
	}
}

// eeprom stuff
void eep_get_string(unsigned int base_offset, String& s) {
	int i = 0;
	int c;
	s.remove(0, s.length());
	do {
		c = EEPROM.read(i + base_offset);
		i++;
		if (c) s.concat(char(c));
	} while (c && i < 100);
}

bool eep_update_string(unsigned int base_offset, String& s) {
	bool updated = false;
	//printDebug("Get String: " + String(s));
	String temp;
	eep_get_string(base_offset, temp);
	if (temp != s) {
		updated = true;
		// also writes 0 terminator
		for (int i = 0; i <= s.length(); i++) {
			EEPROM.write(i + base_offset, s.charAt(i));
		}
	}
	return updated;
}
/*
*/

bool eep_update_array(unsigned int base_offset, unsigned int arr[]) {
	bool updated = false;
	unsigned int la[sl];
	EEPROM.get(base_offset, la);
	for (int i = 0; i < sl; i++) {
		if (la[i] != arr[i]) {
			int offset = i * sizeof(int) + base_offset;
			EEPROM.put(offset, arr[i]);
			updated = true;
			//t.println("Updating: " + String(la[i]));
		}
	}
	return updated;
}

bool eep_update_int(unsigned int base_offset, unsigned int val) {
	int existing_val;
	bool updated = false;
	EEPROM.get(base_offset, existing_val);
	//t.println("Existing Value: " + String(existing_val));
	if (existing_val != val) {
		EEPROM.write(base_offset, val & 255);
		EEPROM.write(base_offset + 1, val >> 8);
		updated = true;
	}
	return updated;
}

bool store_data() {
	bool updated = false;
	//EEPROM.update(fxn_offset, fxn);
	//EEPROM.write(fxn_offset + 1, 0);
	updated |= eep_update_int(fxn_offset, fxn);
	updated |= eep_update_array(init_delay_offset, init_delay);
	updated |= eep_update_array(longest_pulse_offset, longest_pulse);
	updated |= eep_update_array(shortest_pulse_offset, shortest_pulse);
	updated |= eep_update_array(decay_factor_offset, decay_factor);
	updated |= eep_update_array(random_factor_offset, random_factor);
	updated |= eep_update_array(repeat_count_offset, repeat_count);
	updated |= eep_update_string(sequence_offset, sequence);
	updated |= eep_update_int(sequence_index_offset, sequence_index);
	updated |= eep_update_int(repeat_mode_offset, repeat_mode);
	//EEPROM.update(sequence_index_offset, sequence_index);

	return updated;
}

void retrieve_data() {
	EEPROM.get(fxn_offset, fxn);
	//t.print("Fxn: " + String(fxn) + " Offset: " + String(fxn_offset));
	//fxn = 1;
	s.set(fxn);
	EEPROM.get(init_delay_offset, init_delay);
	EEPROM.get(longest_pulse_offset, longest_pulse);
	EEPROM.get(shortest_pulse_offset, shortest_pulse);
	EEPROM.get(decay_factor_offset, decay_factor);
	EEPROM.get(random_factor_offset, random_factor);
	EEPROM.get(repeat_count_offset, repeat_count);
	eep_get_string(sequence_offset, sequence);
	EEPROM.get(sequence_index_offset, sequence_index);
	EEPROM.get(repeat_mode_offset, repeat_mode);
}

void edump(int adr, int len) {
	char* ptr = (char*)adr;
	for (; len > 0; len -= 0x10, ptr += 0x10) {
		byte i;
		for (i = 0; i < 16; i++) {
			if (i < len) {
				Serial.write(' ');
				pHex(EEPROM.read(ptr + i));
			}
		}
		Serial.print(F(" '"));
		for (i = 0; i < 16; i++) {
			if (i < len) {
				byte val = EEPROM.read(ptr + i);
				Serial.write(val < 0x20 ? '.' : val);
			}
			else {
				break;
			}
		}
		Serial.println('\'');
	}
}

void pHex(byte val) {
	if (val < 16) {
		Serial.write('0');
	}
	Serial.print(val, HEX);
}

void edump_array(String name, unsigned int base_offset, unsigned int* arr) {
	EEPROM.get(base_offset, *arr);
	for (int i = 0; i < sl; i++) {
		t.println(name + String(i) + "\t" + String(arr[i]));
	}
}

void debug() {
	t.println("");
	t.println("Howdy!");
	edump(0, 255);
	t.println("Repeat Mode: " + String(repeat_mode));
	//t.println("Repeat Mode offset: " + String(repeat_mode_offset));

	/*
	eep_update_int(sequence_index_offset, 128);
	sequence_index = 0;

	EEPROM.put(sequence_index_offset, sequence_index);
	EEPROM.get(sequence_index_offset, sequence_index);
	t.println("Sequence Index: " + String(sequence_index));

	t.println("");
	t.println("fxn_offset? " + String(fxn_offset));
	t.println("init_delay_offset? " + String(init_delay_offset));
	t.println("longest_pulse_offset? " + String(longest_pulse_offset));
	t.println("shortest_pulse_offset? " + String(shortest_pulse_offset));
	t.println("random_factor_offset? " + String(random_factor_offset));
	t.println("decay_factor_offset? " + String(decay_factor_offset));
	t.println("sequence_offset? " + String(sequence_offset));
	t.println("sequence_index_offset? " + String(sequence_index_offset));
	t.println("");
	t.println("");


	user_program = user_program.substring(0, sequence_index ) + "X" + user_program.substring(sequence_index, user_program.length());
	if (user_program.length() > sl) user_program.remove(user_program.length() - 1);
	t.println("User program: " + user_program);

	int cmd;
	Timer1.detachInterrupt();
	do {
		if (true || Serial.available() > 0) {
			cmd = Serial.read();
			t.print("Hoses! " + String(cmd));
		}
	} while (cmd != 10 && cmd != 13);
	Timer1.attachInterrupt(heartbeat);


	//user_program = "";
	//eep_update_string(sequence_offset, user_program);
	eep_get_string(sequence_offset, user_program);
	t.println("User program: " + user_program);

	String tmp="      ";
	String s = "Killer";
	bool updated = false;

	//retrieve_data();
	user_fxn();

	s.remove(0, s.length());
	t.println("!"+s+"!");
	s.concat(char(65));
	t.println("!" + s + "!");

	s = "";
	eep_get_string(sequence_offset, s);
	t.println("!" + s + "5");


	user_program = "DUDDU";
	decay_factor[0] = 888;
	updated = store_data();

	if(updated) t.println("Data was updated!");
*/
//edump_array("Decay Factor: ", decay_factor_offset, decay_factor);

/*
//EEPROM.get(decay_factor_offset, decay_factor);
for (int i = 0; i < sl; i++) {
	t.println("Decay Factor: " + String(i) + "\t" + String(decay_factor[i]));
}

t.println("decay_factor_offset? " + String(decay_factor_offset));



for (int i = 0; i < 512; i++) {
	int c = EEPROM.read(i);
	t.print(String(i));
	t.print("\t");
	t.print(String(c));
	t.println("");
}

//eep_update_string(220, test);
eep_get_string(sequence_offset, tmp);
t.println("is killer sequence? " + tmp);

EEPROM.update(fxn_offset, fxn);
EEPROM.get(fxn_offset, fxn);
t.println("fxn: " + String(fxn));

longest_pulse[3] = 9234;
//eep_update_array(longest_pulse_offset, longest_pulse);
EEPROM.get(longest_pulse_offset, longest_pulse);
for (int i = 0; i < sl; i++) {
	t.println("Longest Pulse: " + String(i) + "\t" + String(longest_pulse[i]));
}

t.println("");
t.println("Debug Done");
t.println("");
*/
}

void set_sequnce_index(int indx) {
	sequence_index = indx;
	EEPROM.update(sequence_index_offset, sequence_index);
	esc_mode = false;
	print_user_vars();
}

void inc_sequence_index() {
	int len = sequence.length();
	sequence_index++;
	if (sequence_index > len) sequence_index = len;
	label = "unset";
	print_user_vars();
	EEPROM.update(sequence_index_offset, sequence_index);
}

void dec_sequence_index() {
	sequence_index--;
	if (sequence_index < 0) sequence_index = 0;
	label = "unset";
	print_user_vars();
	EEPROM.update(sequence_index_offset, sequence_index);
}

void print_sval() {
	t.setCursor(INPUT_ROW, "1");
	t.clrToEOL();
	t.print(label + ": " + sval);
}

void user_serv(int cmd) {
	cmd = int(c_toupper(cmd));
	//t.setCursor("22", "1");
	//t.clrToEOL();
	//t.print(" CMD: " + String(cmd));
	t.setRow(MSG_ROW);
	t.clrToEOL();	// clear old message
	switch (cmd) {
	case 64:	// @ set factory defaults
		printStr(MSG_ROW, F("Set Factory Defaults? (y/n)"));
		do {
			if (Serial.available() > 0) {
				cmd = c_toupper(Serial.read());
				//t.print("Hoses! " + String(cmd));
			}
		} while (cmd != 89 && cmd != 78);
		if (cmd == 89) {
			set_default_user_vars();
			store_data();
			print_user_vars();
			printStr(MSG_ROW, F("Factory Defaults Set"));
		}
		else {
			printStr(MSG_ROW, F("Cancelled"));
		}
		break;
	case 35:	// # comment
		t.setRow(MSG_ROW);
		do {
			if (Serial.available() > 0) {
				cmd = Serial.read();
				t.print(String(char(cmd)));
			}
		} while (cmd != 10 && cmd != 13);
		break;
	case 32:	// space CLR
		if (label == "unset") {
			sequence = "";
			sequence_index = 0;
		}
		else {
			for (int i = 0; i < sval.length(); i++) {
				sval.setCharAt(i, 32);
			}
		}
		store_data();
		print_user_vars();
		break;
	case 88:	// X Exit
		in_user = false;
		t.setRow("10");
		t.clrToEOL();
		t.print(F("In User Mode OFF"));
		fxn = 0;
		s.set(0);
		setFxn();
		break;
	case 73:	// I
		user_var = &init_delay[sequence_index];
		sval = String(init_delay[sequence_index]);
		label = "Init Delay";
		num_digs = 5;
		user_min = 0;
		user_max = 99999;
		break;
	case 76:	// L
		user_var = &longest_pulse[sequence_index];
		sval = String(longest_pulse[sequence_index]);
		label = "Longest Pulse";
		num_digs = 5;
		user_min = shortest_pulse[sequence_index];
		user_max = 99999;
		break;
		//case 83:	// S
	case 72:	// H
		user_var = &shortest_pulse[sequence_index];
		sval = String(shortest_pulse[sequence_index]);
		label = "sHortest Pulse";
		num_digs = 5;
		user_min = 1;
		user_max = longest_pulse[sequence_index];
		break;
	case 70:	// F
		user_var = &decay_factor[sequence_index];
		sval = String(decay_factor[sequence_index]);
		label = "Decay Factor";
		num_digs = 3;
		user_min = 1;
		user_max = 999;
		break;
	case 82:	// R
		user_var = &random_factor[sequence_index];
		sval = String(random_factor[sequence_index]);
		label = "Random Factor";
		num_digs = 3;
		user_min = 0;
		user_max = 999;
		break;
	case 78:	// N
		user_var = &repeat_count[sequence_index];
		sval = String(repeat_count[sequence_index]);
		label = "Repeat Number";
		num_digs = 3;
		user_min = 1;
		user_max = 999;
		break;
	case 48:	// 0
	case 49:
	case 50:
	case 51:
	case 52:
	case 53:
	case 54:
	case 55:
	case 56:
	case 57:	// 9
		if (label != "unset") {
			sval += char(cmd);
			if (sval.length() > num_digs) sval = sval.substring(1);
			print_sval();
			//t.setCursor(INPUT_ROW, "1");
			//t.clrToEOL();
			//t.print(label + ": " + sval);
		}
		else {
			// could be esc sequence
			if (esc_mode) {
				switch (cmd) {
				case 49:
					set_sequnce_index(0);
					break;
				case 52:
					set_sequnce_index(sequence.length());
					break;
				}
			}
		}
		break;
	case 66:	// B (possibly down arrow)
	case 67:	// C (possibly right arrow)
	case 68:	// D (possibly left arrow)
	case 85:	// U
	case 83:	// S
	case 84:	// T
		//printDebug("Shifting? " + String(cmd)+ " esc: " + String(esc_mode));
		if (esc_mode) {
			switch (cmd) {
			case 66:
				set_sequnce_index(sequence.length());
				break;
			case 67:
				inc_sequence_index();
				break;
			case 68:
				dec_sequence_index();
				break;
			}
			esc_mode = false;
		}
		else {
			sequence = sequence.substring(0, sequence_index) + char(cmd) + sequence.substring(sequence_index, sequence.length());
			if (sequence.length() > sl) sequence.remove(sequence.length() - 1);
			eep_update_string(sequence_offset, sequence);
			inc_sequence_index();
		}
		break;
	case 127:	// BSP
		if (label == "unset") {
			sequence.remove(sequence_index - 1, 1);
			eep_update_string(sequence_offset, sequence);
			dec_sequence_index();
		}
		else {
			sval = sval.substring(0, sval.length() - 1);
			print_sval();
		}
		break;
	case 42:	// *
		repeat_mode = !repeat_mode;
		EEPROM.update(repeat_mode_offset, repeat_mode);
		user_fxn();
		break;
	case 44:	// ,
		dec_sequence_index();
		break;
	case 46:	// .
		inc_sequence_index();
		break;
	case 65:	// A (up arrow)
		if (esc_mode) {
			set_sequnce_index(0);
		}
		break;
	case 63:	// ? Help
		esc_mode = false;
		help();
		break;
	case 38:	// & Debug
		esc_mode = false;
		debug();
		break;
	case 10:
	case 13:
		if (label != "unset") {
			unsigned int sv = sval.toInt();
			if (sv >= user_min && sv <= user_max) {
				*user_var = sv;
				print_user_vars();
				store_data();
				label = "unset";
				t.setCursor(INPUT_ROW, "1");
				t.clrToEOL();
			}
			else {
				t.setCursor(INPUT_ROW, "1");
				t.clrToEOL();
				if (sv <= user_max) {
					t.print(label + F(": Please enter a value greater than or equal to ") + String(user_min));
				}
				else {
					t.print(label + F(": Please enter a value less than or equal to ") + String(user_max));
				}
			}
		}
		break;
	}
	if ((cmd > 57 || cmd == 32) && cmd != 68 && cmd != 85 && cmd != 127 && cmd != 63 && label != "unset") {
		t.setCursor(INPUT_ROW, "1");
		t.clrToEOL();
		t.print(label + ": " + sval);
	}
}

void process_command(int cmd) {
	switch (cmd) {
	case 32:	// space
		//trig = !trig;
		break;
	case 48:	// 0
		s.set(9);
		break;
	case 49:	// 1
		s.set(0);
		break;
	case 50:	// 2
		s.set(1);
		break;
	case 51:	// 3
		s.set(2);
		break;
	case 52:	// 4
		s.set(3);
		break;
	case 53:	// 5
		s.set(4);
		break;
	case 54:	// 6
		s.set(5);
		break;
	case 55:	// 7
		s.set(6);
		break;
	case 56:	// 8
		s.set(7);
		break;
	case 57:	// 9
		s.set(8);
		break;
	case 45:	// -
		s.set(10);
		break;
	case 61:	// =
		s.set(11);
		break;
	case 44:	// ,
		s.dec();
		break;
	case 46:	// .
		s.inc();
		break;
	case 68:	// D left arrow
		if (esc_mode) {
			s.dec();
			esc_mode = false;
		}
		break;
	case 67:	// C right arrow
		if (esc_mode) {
			s.inc();
			esc_mode = false;
		}
		break;
	case 33:	// !
		t.setRow("10");
		t.clrBelowCursor();
		break;
	}
}

void heartbeat()
{
	if (cmd > 0) {
		if (in_user) {
			user_serv(cmd);
		}
		else {
			process_command(cmd);
		}
		cmd = 0;
	}
	if (true) {
		switch (fxn) {
		case 0:
		case 1:
		case 2:
		case 3:
		case 4:
		case 5:
		case 6:
		case 7:
			setLen();
			setDecay();
			setRnd();
			break;
		case 8:
			setLen();
			setRepeat();
			setDelay();
			break;
		case 9:
			t.setCursor(PULSE_LEN_ROW, "1");
			t.clrToEOL();
			t.setCursor(RANDOM_ROW, "1");
			t.clrToEOL();
			setDelay();
			break;
		case 10:
			setLen();
			setRepeat();
			setDelay();
			break;
		}
		newFxn = false;
	}
}

void do_delay(unsigned int d) {	
	if(d<200) {
		delay(d);
	} else {
		boolean ser_avail;
		unsigned long targetMillis = millis() + d;
		do {
			ser_avail = Serial.available() > 0;
			t.println("Trig: " + String(trig));
		} while(millis()<targetMillis && !ser_avail);
	}
	
}

void wait_button_up() {
	//int i = 0;
	while (digitalRead(inPin)) {
		reset_trigger();
		//printDebug("Waiting for button up" + String(i++));
	}
	//printDebug("");
}

int readVal(int pin) {
	int val = analogRead(pin);
	delay(1);
	return analogRead(pin);
}

void aWrite(int val) {
	int aVal = val / 7;
	aVal += 64;
	aVal = max(0, aVal);
	aVal = min(255, aVal);
	//printDebug("Val: " + String(val) + " aVal: " + String(aVal));
	//t.setCursor(DEBUG_ROW,"1");
	//t.println(val);
	//t.println(aVal);
	analogWrite(pwmPin, aVal);
}

int doDelay(int del) {
	float rnd = float(rndVal);
	//t.println(rnd);
	rnd *= .001;
	rnd = min(rndVal, .9);
	//t.print("rndVal: ");
	//rndVal = 0.0;
	//t.println(rndVal);
	int rndRange = del * rnd;
	int rndm = random(-rndRange, rndRange);
	int delVal = max(0, del + rndm);
	//t.print("\nRand val: ");
	//t.println(delVal);
	aWrite(delVal);
	delay(delVal);
	return delVal;
}

void sputterDown() {
	//t.println("");
	//t.println(pulseLen);
	//setDecay();
	int pulse_len = pulseLen;
	float the_min = (fxn == 11) ? shortest_pulse[sequence_index] : 1;
	while (pulse_len > the_min && trig) {
		//t.println("raw: ");
		digitalWrite(gatePin, HIGH);
		int d = doDelay(pulse_len);
		//t.println(d);
		digitalWrite(gatePin, LOW);
		pulse_len *= theDecay;
		doDelay(pulse_len);
	}
}

void sputterUp() {
	//setDecay();
	float the_delay = (fxn == 11) ? shortest_pulse[sequence_index] : 1;
	do {
		//t.println("raw: ");
		digitalWrite(gatePin, HIGH);
		int d = doDelay(the_delay);
		//t.println(the_delay);
		digitalWrite(gatePin, LOW);
		the_delay /= theDecay;
		doDelay(the_delay);
	} while (the_delay < pulseLen&& trig);
}

void pulse(int pulse_length) {
	digitalWrite(gatePin, HIGH);
	delay(pulse_length);
	digitalWrite(gatePin, LOW);
}

void stretch() {
	//printDebug("Stretch: " + String(pulseLen));
	int rpt = rptCount;
	while (rpt && fxn == s.get() && trig) {
		//analogWrite(pwmPin, pulseLen % 254);
		delay(theDelay);
		pulse(pulseLen);
		//analogWrite(pwmPin, 128);
		rpt--;
	}
}

void toggle() {
	delay(theDelay);
	tog = !tog;
	digitalWrite(gatePin, tog ? HIGH : LOW);
}

void sputterStrange() {
	//printDebug("Strange: ");
	int sum = 0;
	int rndm;
	while (sum <= pulseLen && fxn == s.get() && trig) {
		int val = analogRead(lenPin);
		//printDebug("val: " + String(val));
		rndm = random(10, 100);
		sum += rndm;
		digitalWrite(gatePin, HIGH);
		analogWrite(pwmPin, sum % 254);
		delay(rndm);
		digitalWrite(gatePin, LOW);
		rndm = random(10, 100);
		sum += rndm;
		delay(rndm);
	}
}

void maytag() {
	int rpt = rptCount;
	//printDebug("RptCnt: " + String(rptCount));
	while (rpt && fxn == s.get() && trig) {
		delay(theDelay);
		sputterStrange();
		rpt--;
	}
}

void user() {
	do {
		for (sequence_index = 0; sequence_index < sequence.length(); sequence_index++) {
			int cmd = int(sequence.charAt(sequence_index));

			// print this set of vars
			print_user_vars();

			// Set sputter vars
			pulseLen = longest_pulse[sequence_index];
			theDecay = float(decay_factor[sequence_index]) / 1000;
			rndVal = float(random_factor[sequence_index]);
			theDelay = init_delay[sequence_index];
			rptCount = 1;	//  repeat_count[sequence_index];

			for (int i = 0; i < repeat_count[sequence_index]; i++) {
				//printDebug("cmd: " + String(cmd));
				if (theDelay > 0) delay(theDelay);
				switch (cmd) {
				case 66: // B
					digitalWrite(gatePin, LOW);
					break;
				case 67: // C
					stretch();
					break;
				case 68: // D
					sputterDown();
					break;
				case 83: // S
					sputterStrange();
					break;
				case 84: // T
					digitalWrite(gatePin, HIGH);
					break;
				case 85: // U
					sputterUp();
					break;
				}
			}

		}
	} while (repeat_mode && trig);
	print_sequence_index();
}

void do_trigger() {
	//wait_button_up();
	//triggered = false;
	reset_trigger();
	print_triggered();
	/*
	t.setCursor(TRIGGER_ROW, "1");
	t.blinkOn();
	t.print("TRIGGERED");
	t.blinkOff();
	*/
	switch (fxn) {
	case 0:
		sputterUp();
		break;
	case 1:
		sputterDown();
		break;
	case 2:
		sputterUp();
		sputterDown();
		break;
	case 3:
		sputterDown();
		sputterUp();
		break;
	case 4:
		while (fxn == s.get() && trig) {
			sputterUp();
		}
		break;
	case 5:
		while (fxn == s.get() && trig) {
			sputterDown();
		}
		break;
	case 6:
		while (fxn == s.get() && trig) {
			sputterUp();
			sputterDown();
		}
		break;
	case 7:
		while (fxn == s.get() && trig) {
			sputterDown();
			sputterUp();
		}
		break;
	case 8:
		stretch();
		break;
	case 9:
		toggle();
		break;
	case 10:
		maytag();
		break;
	case 11:
		user();
		break;
	}
	wait_button_up();
	trig = false;
	triggered = false;
	wait_button_up();
	print_triggered();
	//t.setCursor(TRIGGER_ROW, "1");
	//t.clrToEOL();
}

void watch_trig() {
	if (fxn == s.get()) {
		int val = digitalRead(inPin);   // read the input pin
		//printDebug(String(triggered));
		if (val && !triggered) {
			trig = !trig;
			triggered = true;
			//t.setCursor(DEBUG_ROW, "1");
			//t.print("Trig: " + String(trig));
			//printDebug("Trig: " + String(trig));
		}
		if (Serial.available() > 0) {
			cmd = Serial.read();
			switch (cmd) {
			case 27:	// ESC
			case 91:	// [
				esc_mode = true;
				break;
			case 33:	// !
				esc_mode = false;
				trig = !trig;
				break;
			}
		}
	}
	else {
		trig = false;
		triggered = false;
	}
	heartbeat();
}

void loop() {
	if (trig) {
		do_trigger();
	}
	if (fxn != s.get()) {
		setFxn();
	}
	// heartbeat();
}
