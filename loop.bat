cls
del *.png
convert -coalesce animated.gif frame_%%d.gif
FOR %%a in (*.gif) DO convert %%a bg.gif -compose Difference -composite -modulate 100,0 -channel B -evaluate set 0 -alpha Off  diff_mask_%%a.png
FOR %%a in (*.gif) DO convert %%a diff_mask_%%a.png -alpha off -compose CopyOpacity -composite overlay_removed_%%a.png
FOR %%a in (*.gif) DO convert overlay_removed_%%a.png -fuzz 32 -trim +repage overlay_trimmed_%%a.png
FOR %%a in (*.gif) DO del overlay_removed_%%a.png
FOR %%a in (*.gif) DO del diff_mask_%%a.png
mogrify -resize 64x64 -background transparent -gravity center -extent 64x64 -format png  *.png
del overlay_trimmed_bg.gif.png
del overlay_trimmed_animated.gif.png
convert  overlay_trimmed_*.png +append spritesheet.png
