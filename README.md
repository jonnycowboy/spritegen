spritegen
=========

Generate sprite sheets from animated gifs with a static background

##Inputs
Uses two inputs files: one, *animated.gif* is the source animation.  Second, *bg.gif* is the complete background (must be created in an editor first). 

##Processing
Uses Imagemagick to split the animated gif, subtract the "moving" parts from the background, resizes the moving part into a 64x64px sprite and appends each sprite into one single long spritesheet (with transparency).

##Output
Generated indivual resized frames (.png format) and a single *spritesheet.png* file.
