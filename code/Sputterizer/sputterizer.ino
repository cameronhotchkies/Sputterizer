// https://github.com/shannon-greenlight/Arduino-Libs
#include <TerminalVT100.h>

#include <RotaryEncoder.h>

#include <LED_Driver_5916.h>

#include <TimerOne.h>

// vt-100 row positions
#define FXN_ROW "6"
#define PULSE_LEN_ROW "7"
#define DECAY_ROW "8"
#define RANDOM_ROW "9"
#define DEBUG_ROW "15"
#define TRIGGER_ROW "11"

int lenPin = A0;
int rndPin = A4;
int decayPin = A5;
int gatePin = 13;
int inPin = 4;    
int dirPin = 8;
int pwmPin = 11;   
int val = 0;      // variable to store the read pushbutton value
boolean tog = false; // for toggle
boolean trig = false;

volatile int pulseLen;
volatile float rndVal;
volatile int rptCount=0;
volatile float theDecay;
volatile int theDelay=0;
int fxn = 0;
String theFxn = "";
const int num_fxns=12;
String theFunctions[] = {
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
  "Boom"
};

// useful objects
TerminalVT100 t;
LED_Driver_5916 d = LED_Driver_5916();
RotaryEncoder e = RotaryEncoder(num_fxns);

void intFxnA(void) {
  e.aChanInt();
}

void intFxnB(void) {
  e.bChanInt();
}

void setup() {
  analogRead(lenPin);
  pinMode(gatePin, OUTPUT);
  pinMode(pwmPin, OUTPUT);
  pinMode(inPin, INPUT);
  pinMode(dirPin, INPUT);
  digitalWrite(gatePin,LOW);
  analogWrite(pwmPin,255);

  t = TerminalVT100();
  e.t = t;
  //e.debug = true;
  
  attachInterrupt(0, intFxnB, RISING);
  attachInterrupt(1, intFxnA, RISING);
  Timer1.initialize(200000);
  Timer1.attachInterrupt(heartbeat);

// Use Putty to communicate (VT100 terminal)
  t.clrScreen();
  t.setCursor("1","1");
  t.println("**************************");
  t.println("*     GREENFACE LABS     *");
  t.println("*      Sputterizer       *");
  t.println("**************************");
  setFxn();

}

void printDebug(String s) {
  t.setCursor(DEBUG_ROW,"1");
  t.clrToEOL();
  t.print(s);
}

boolean isDifferent(float a, float b) {
  int ai = int(100*a);
  int bi = int(100*b);
  return (ai!=bi);
}

void printVal(String row, String label, String val) {
  t.setRow(row);
  t.print(label);
  t.clrToEOL();
  t.println(val);
}

void setFxn() {
  fxn = e.getEncoderValue();
  theFxn = theFunctions[fxn];
  printVal(FXN_ROW,"Fxn: ",theFxn);
  d.set_LED(fxn);
}

void setLen() {
  int d = readVal(lenPin);
  d /= 10;
  d *= 10;
  d = max(10,d);
  if(theFxn=="Stretch" || theFxn=="Maytag") {
    d *= 10;
  }
  //printDebug("PL: "+String(pulseLen)+"d: "+String(d));
  if(pulseLen!=d) {
    pulseLen = d;
    printVal(PULSE_LEN_ROW,"Pulse Length: ",String(d));
  }  
  
}

void setDecay() {
  float decay;
  int val = readVal(decayPin);
  decay = .001*val;
  decay = min(decay,.9);
  decay = max(.1,decay);
  if(isDifferent(decay,theDecay)) {
    theDecay = decay;
    printVal(DECAY_ROW,"Decay: ",String(decay));
  }
}

void setRnd() {
  int r = readVal(rndPin);
  r /= 10;
  r *= 10;
  if(isDifferent(rndVal,r)) {
    rndVal = r;
    printVal(RANDOM_ROW,"Randomness: ",String(rndVal));
  }
}

// stretch variables
void setDelay() {
  int d = readVal(decayPin);
  d /= 10;
  d *= 100;
  if(d!=theDelay) {
    theDelay = d;
    printVal(DECAY_ROW,"Delay: ",String(theDelay));
  }  
}
void setRepeat() {
  int rpt = 0;
  float rv = readVal(rndPin);
  float q = rv / 1024;
  q *= 100;
  rpt = int(q);
  rpt += 1;
  if(rpt!=rptCount) {
    rptCount = rpt;
    printVal(RANDOM_ROW,"Repeat: ",String(rptCount));
  }
}


void heartbeat() 
{
  //unsigned long currentMillis = millis();
  if (Serial.available() > 0) {
    int cmd = Serial.read();
    switch(cmd) {
      case 32:
        trig = !trig;
        break;
      case 48:
        e.setEncoderValue(9);
        break;
      case 49:
        e.setEncoderValue(0);
        break;
      case 50:
        e.setEncoderValue(1);
        break;
      case 51:
        e.setEncoderValue(2);
        break;
      case 52:
        e.setEncoderValue(3);
        break;
      case 53:
        e.setEncoderValue(4);
        break;
      case 54:
        e.setEncoderValue(5);
        break;
      case 55:
        e.setEncoderValue(6);
        break;
      case 56:
        e.setEncoderValue(7);
        break;
      case 57:
        e.setEncoderValue(8);
        break;
      case 45:
        e.setEncoderValue(10);
        break;
      case 61:
        e.setEncoderValue(11);
        break;
      case 44:
        e.decEncoder();
        break;
      case 46:
        e.incEncoder();
        break;
      case 33:
        t.setRow("10");
        t.clrBelowCursor();
        break;
    }
    //t.setCursor(DEBUG_ROW,"1");
    //t.print(cmd);
  }
  if(true) {
    switch(fxn) {
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
        t.setCursor(PULSE_LEN_ROW,"1");
        t.setCursor(RANDOM_ROW,"1");
        setDelay();
        break;
      case 10:
        setLen();
        setRepeat();
        setDelay();
        break;
    }
  }
}

void wait_button_up() {
  while(digitalRead(inPin)) {}
}

int readVal(int pin) {
  int val = analogRead(pin);
  delay(1);
  return analogRead(pin);
}

void aWrite(int val) {
  int aVal = val / 7;
  //aVal -= 128;
  aVal = max(0,aVal);
  aVal = min(255,aVal);
  printDebug("Val: " + String(val) + " aVal: " + String(aVal));
  //t.setCursor(DEBUG_ROW,"1");
  //t.println(val);
  //t.println(aVal);
  analogWrite(pwmPin,aVal);  
}

int doDelay(int del) {
  float rnd = float(rndVal);
  //t.println(rnd);
  rnd *= .001;
  rnd = min(rndVal,.9);
  //t.print("rndVal: ");
  //rndVal = 0.0;
  //t.println(rndVal);
  int rndRange = del*rnd;
  int rndm = random(-rndRange,rndRange);
  int delVal = max(0,del+rndm);
  //t.print("\nRand val: ");
  //t.println(delVal);
  aWrite(delVal);
  delay(delVal);
  return delVal;
}

void sputterUp() {
  //t.println("");
  //t.println(pulseLen);
  //setDecay();
  int pulse_len = pulseLen;
  while(pulse_len>0) {
    //t.println("raw: ");
    digitalWrite(gatePin,HIGH);
    int d = doDelay(pulse_len);
    //t.println(d);
    digitalWrite(gatePin,LOW);
    pulse_len *= theDecay;
    doDelay(pulse_len);
  }
}

void sputterDown() {
  //setDecay();
  float the_delay=1;
  while(the_delay<pulseLen) {
    //t.println("raw: ");
    digitalWrite(gatePin,HIGH);
    int d = doDelay(the_delay);
    //t.println(the_delay);
    digitalWrite(gatePin,LOW);
    the_delay /= theDecay;
    doDelay(the_delay);
  }
}

void pulse(int pulse_length) {
  digitalWrite(gatePin,HIGH);
  delay(pulse_length);  
  digitalWrite(gatePin,LOW);  
}

void stretch() {
  int rpt = rptCount;
  while(rpt && fxn==e.getEncoderValue() && trig) {
    delay(theDelay);
    pulse(pulseLen);
    rpt--;
  }  
}

void toggle() {
  delay(theDelay);
  tog = !tog;
  digitalWrite(gatePin,tog ? HIGH : LOW);
}

void maytag() {
  //delay(theDelay);
  int sum=0;
  int rndm;
  int rpt = rptCount;
  //printDebug("RptCnt: " + String(rptCount));
  while(rpt && fxn==e.getEncoderValue() && trig) {
    delay(theDelay);
    sum=0;
    while(sum<=pulseLen && fxn==e.getEncoderValue() && trig) {
      int val = analogRead(lenPin);
      //printDebug("val: " + String(val));
      rndm = random(10,100);
      sum += rndm;
      digitalWrite(gatePin,HIGH);
      analogWrite(pwmPin,sum%254);
      delay(rndm);  
      digitalWrite(gatePin,LOW);  
      rndm = random(10,100);
      sum += rndm;
      delay(rndm);  
    }
    rpt--;
  }
}

void boom() {
  while(fxn==e.getEncoderValue() && trig) {
    int rndm = random(1,100);
    if(rndm>50) {
      //sputterUp();
    } else {
      //sputterDown();
    }
    int val = analogRead(lenPin);
    analogWrite(pwmPin,val/4);
    printDebug("val: " + String(val/4));  
  }
}

void loop() {
  //pulseLen = analogRead(lenPin);
  //pulseLen = max(10,pulseLen);
  val = digitalRead(inPin);   // read the input pin
  if(val || trig) {
   trig = true;
   wait_button_up();
   //pinMode(pwmPin, OUTPUT);
   t.setCursor(TRIGGER_ROW,"1");
   t.blinkOn();
   t.print("TRIGGERED");
   t.blinkOff();
   switch(fxn) {
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
         while(fxn==e.getEncoderValue() && !digitalRead(inPin) && trig) {
          sputterUp();
        }
        break;
      case 5:
        while(fxn==e.getEncoderValue() && !digitalRead(inPin) && trig) {
          sputterDown();
        }
        break;
      case 6:
        while(fxn==e.getEncoderValue() && !digitalRead(inPin) && trig) {
          sputterUp();
          sputterDown();
        }
        break;
      case 7:
        while(fxn==e.getEncoderValue() && !digitalRead(inPin) && trig) {
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
        boom();
        break;
    }
    wait_button_up();
    trig = false;
    wait_button_up();
    t.setCursor(TRIGGER_ROW,"1");
    t.clrToEOL();
    //pinMode(pwmPin, INPUT);
    //digitalWrite(pwmPin, HIGH); //turn pullup resistor off
   //t.print("");
   //analogWrite(pwmPin,255);
  }
  if(fxn!=e.getEncoderValue()) {
    setFxn();
  }
  //heartbeat();
}
