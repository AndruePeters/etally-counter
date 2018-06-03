
#include <RF24.h>


/*
 * Andrue Peters
 * 5/14/18
 * 
 * This is a handheld electronic counter.
 * The Arduino communicates with a Raspberry Pi remotely
 * through the nrf2401+ 2.4Ghz RF transceiver. If the button is
 * pressed then a signal is sent to the Raspberry Pi to increment
 * the number of shots.
 * 
 * This was tested and worked well at 50 feet. We didn't test beyond
 * that range. 
 */

#include <SPI.h>

// set up nrf2501 on pins 8 and 9
RF24 radio(8,9); // ce and csn respectively

const int BUTTON = 2;     // the pin for the IR receiver
const uint8_t BUTTON_PRESSED = 0; // if the beam is broken, then it reports 0
const uint8_t increment = 1;

const uint8_t pipes[][6] = {"ANode", "PNode"};

uint8_t buttonStatus = 0;
uint8_t buttonState = 0;
uint8_t lastButtonState = 0;

unsigned long lastDebounceTime = 0;
unsigned long debounceDelay = 25;

 
void setup() {
  // put your setup code here, to run once:
  pinMode(BUTTON, INPUT);
  Serial.begin(9600);

  /*    Configure Radio */
  radio.begin();
  radio.setChannel(1);
  radio.setPALevel(RF24_PA_MAX);
  radio.setDataRate(RF24_250KBPS);
  radio.setAutoAck(1);
  radio.setRetries(2, 15);
  radio.setCRCLength(RF24_CRC_8);

  radio.printDetails();
  
  radio.openWritingPipe(pipes[0]);
  radio.openReadingPipe(1,pipes[1]);

 
  
  
}

void loop() {
  //buttonStatus is the current value of the button
  buttonStatus = digitalRead(BUTTON);

  // if the switch changed then set time
  if(buttonStatus != lastButtonState)
  {
    lastDebounceTime = millis();
  }


  // if it's been longer than 25ms then enter loop
  if ((millis() - lastDebounceTime) > debounceDelay)
  {
    // if button state has changed
    if (buttonStatus != buttonState)
    {
      buttonState = buttonStatus;
      if (buttonState == HIGH)
      {
        // write the information
        if(!radio.write(&increment, sizeof(uint8_t)))
        {
          //Serial.println("Transmission Failed.");
        }
      }
    }
  }
  // update lastButtonState with the current status of the pushbutton
  lastButtonState = buttonStatus;
}
