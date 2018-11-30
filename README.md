# Conditional Access Implementation
The goal of this project is to scramble an image so that:
1) The scrambled image can be decoded by a standard decoder but only with a limited quality;
2) A secret key is needed to decode the image with maximal quality.

The following algorithm of scrambling is used:

1) Taking an image I.
2) Dividing it into blocks of 8x8 pixels. 
3) Applying 2D-DCT to each block.
4) 
