# etally-counter
Electronic solution to a standard mechanical tally counter.
======

## About
This project started as an automatic basketball shot counter to record
free throws made by Perry Dissmore. There is a working prototype using
an IR breakbeam, but there was not enough time to very installation,
so we chose to create an electronic tally counter.

## How It Works

### Overview
There are three parts to this project: the eCounter, the program that
communicates with the eCounter, and the node js web server. The eCounter
is a simple device built using an Arduino and an nrf2401+ 2.4 GHz RF
transceiver. The program that communicates with the eCounter and the
server are all ran on the Raspberry Pi. Note that the RF24 libraries
need to be installed. Sockiet.io must also be installed on the Pi.

The eCounter and the Pi communicate through RF. If the button is pressed,
then the eCounter sends a signal to the Pi. When the Pi receives this
signal, it sends a request to the WebServer to increment the score.


### To Run
I will expand on this in the near future. You can test the server on
any computer with node installed. Naviage to server/ and type
'node server2.js', then naviage to localhost:8000#controls in your
browser. '8000' is the port the server runs on, and #controls will
allow you to use your arrow keys to change the score and spacebar
to start the time.

## Requirements
Coming soon

