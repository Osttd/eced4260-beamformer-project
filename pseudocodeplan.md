# Planning for project layout

Thoughts of structure


# Pseudo code for ip cores

PLL (only for real implementation to change 50 MHz to 100 Mhz)

input (8 channels of n bits)

BRAM holding input (word size 8*n) This should be fine, 256 appears to be almost max bus size
n-1:0 will be channel 1 and so on

filters for each channel

whatever is needed for upsampling? output of this is size m

beamform using known indexes

BRAM holding output (word size 8*m) will need to figure out something for this since that is too large
m-1:0 will be channel 1 and so on

sum and send to 


# Plans for controller

## S0
waiting for PLL lock
maybe loading input into BRAM if possible? probably just waiting for lock though

## S1
starting to load input into BRAM and into filters
no filter output will be valid

## S2
filter output is now valid, start loading into BRAM for applying delays?
Or have BRAM loaded with the calculated delays we were given and load those in sequence
to know which samples to keep and to toss for each line
Then store those in a BRAM




# If BRAM can not have a word size that large

Have a sequential thing to cycle through each block of 8 addresses?
Would not be ideal though
Looks like BRAM holding output of filters will not be able to be that large
BRAM per channel there?
Or do sequential?






# Assumptions to simplify

## These appear to hold true for the matlab data given
Each sample will be a different value than the last
The distance between desired sample indexes is enough time to load the next desired index from a bram (11-12 samples)
The distance between different channels' desired indexes is less than the distance between two adjacent desired indexes for the same channel (1 sample vs 11-12 samples)




