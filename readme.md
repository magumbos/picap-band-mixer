# Pi Cap Band Mixer
WAV Looper

Red light will show on Picap when ready to use

Single Click to change sample bank

Double click PiCap button to change play back modes
1- all 12 sensors load and play samples
2-alternate sensors have samples and touch volume controls, eg sensor 0 plays sample, sensor 1 on touch lowers volume
3- three sesnor in groups for variable volume, eg sensor 0 plays sample, sesnor 1 decrease volume, sesnor 2 increase volume

Press and Hold to Shutdown

To add more samples, add 12 .wav files to the samples folder to make a new sample bank. Edit the touch-mp3.cpp file and change line 15 to the total number of banks.
Even when using second and thiord programme, you must have 12 samples ready to load.

## Requirements

#* Requires [WiringPi](http://wiringpi.com/) (`apt-get install wiringpi`)
#* Requires [Bare Conductive's MPR121 libary for WiringPi](https://github.com/BareConductive/wiringpi-mpr121)

## Install / Build

* Clone this repository with `git clone https://github.com/magumbos/picap-band-mixer.git`

N.B. must be run as root    

To run at start-up
"sudo nano /etc/rc.local"
add before 'exit 0' "/home/pi/the/location/of/script/run &"
Ctrl+X
Y
Enter
