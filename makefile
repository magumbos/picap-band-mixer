#*******************************************************************************
#
# Bare Conductive Pi Cap
# ----------------------
#
# Makefile - defines build recipes for touch-mp3.cpp
#
# Heavily based on Makefiles from WiringPi written by Gordon Henderson
# (lots of copypasta)
#
# Bare Conductive code written by Stefan Dzisiewski-Smith.
#
# This work is licensed under a MIT license https://opensource.org/licenses/MIT
#
# Copyright (c) 2016, Bare Conductive
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
#*******************************************************************************

ifneq ($V,1)
	Q ?= @
endif

DEBUG   = -O3
CC      = g++
INCLUDE = -I/usr/local/include -I/usr/include
CFLAGS  = $(DEBUG) -Wall $(INCLUDE) -Winline -pipe

SRCS    = $(wildcard *.cpp)
OBJS    = ${SRCS:.cpp=.o}

LDFLAGS = -L/usr/local/lib
LDLIBS  = -lMPR121 -lwiringPi -lwiringPiDev -lSDL2 -lSDL2_mixer

NAME    = band_mixer

SRC     = $(NAME).cpp
BIN     = $(NAME:.cpp=)

.PHONY: run clean

$(NAME):	$(OBJS)
	$Q echo [link]
	$Q $(CC) -o $@ $(OBJS) $(LDFLAGS) $(LDLIBS)

.cpp.o:
	$Q echo [CC] $<
	$Q $(CC) -c $(CFLAGS) $< -o $@

clean:
	$Q echo "[Clean]"
	$Q rm -f $(OBJS) *~ core tags $(BIN)

tags:	$(SRC)
	$Q echo [ctags]
	$Q ctags $(SRC)

depend:
	makedepend -Y $(SRC)

run:
	sudo ./$(NAME)

# DO NOT DELETE
