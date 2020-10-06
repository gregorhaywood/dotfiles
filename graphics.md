# Graphics

My Nvidia card is not supported by nouveau (formultihead, at least). My 
current setup uses nvidia-prime for render offloading. This does not let me 
use the HDMI port, as I cannot sink outputs to the discrete card. To do that, 
I would need to use the nvidia card as the primary GPU, which would have a 
power cost and a noise cost. As I don't need HDMI most of the time, I'm 
leaving it off.

To get HDMI working, I probably need to remove nvidia-prime, then set up 
Nvidia as the primary card. This would be a hassle, and is unlikely to be 
necessary for anything.

To use the powerful card, prefix a command with prime-run.
