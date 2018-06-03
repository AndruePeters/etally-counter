#include "sio_client.h"
#include "sio_socket.h"

#include <cstdlib>
#include <iostream>
#include <sstream>
#include <string>
#include <unistd.h>
#include <wiringPi>
#include <RF24/RF24.h>
using namespace sio;

// Setup for GPIO 15 CE and CE0 CSN with SPI Speed @ 8Mhz
//RF24 radio(RPI_V2_GPIO_P1_15, RPI_V2_GPIO_P1_24, BCM2835_SPI_SPEED_8MHZ);
RF24 radio(22,0);


// stands for Pi Node and Arduino Node
const uint8_t pipes[][6] = {"PNode", "ANode"};

// unique radio identifier for node
bool radioNumber = 0;
int main()
{

  sio::client h;
  h.connect("http://127.0.0.1:8000");

  std::string count_control = "count control";
  std::string incr = "incr";

  // setup and configure rf radio
  radio.begin();

  // optionallly, increase the delay between retries and num of setRetries
  radio.setRetries(15, 15);

  // Debugging information
  radio.printDetails();

  // Open pipes for communication
  // Check this when you check the code
  radio.openWritingPipe(pipes[0]);
  radio.openReadingPip(1, pipes[1]);

  // start listening for data
  radio.startListening();

  // stores the data transmitted to the Raspberry Pi
  uint8_t countSig = 0;
  // infinite loop
  while(true)
  {
    // If data is ready
    if (radio.available() )
    {
      while(radio.available())
      {
        // read the data
        radio.read( &countSig, sizeof(countSig))
      }

      // reset countSig and  transmit data to server if countSig == 1
      if(countSig == 1)
      {
        h.socket()->emit(count_control.c_str(), incr);
        countSig = 0;
      }
    }
  }

  return 0;
}
