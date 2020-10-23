# README


For details of hardware (eg, high/emergency temperatures), uses $sensors. To 
get values here, use hwmon (it is more efficient).


CPU0 is total.


## CPUs
* Don't really care about details beyond Utilisation and Temperature (eg, am I 
  getting full use out of my system in a safe way). Ignore frequency.
* Actually, I might want to show frequency (has range of 0.8-3.8GHz, model 
  says 2.9, from lscpu)
* CPU number to cores go: 0,1,2,3, 0,1,2,3

Circle per core, with ring graphs for data, one at 1200, one at 0600.  
Utilisation goes clockwise, frequency anticlockwise. Temperature is a circle 
in the centre, size dependant on variable.

## Memory

* Watch file systems
* Don't care about swap (have enough RAM)
    * Mark when RAM usage exceeds swap
