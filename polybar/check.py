#!/bin/python3

from sys import argv, exit
from time import time

if __name__=="__main__":
    fname = "/home/mitata/dotfiles/state/" + argv[1]
    if argv[2] == "up":
        up, down = 0, 1
    else:
        up, down = 1, 0
    with open(fname) as f:
        expires = int(f.readline())
    if expires < time():
        exit(down)
    else:
        exit(up)
    

