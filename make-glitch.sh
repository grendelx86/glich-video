#!/bin/sh

ffmpeg -filter_complex "nullsrc=s=1920x1080,geq=random(1)*255:128:128[vout];aevalsrc=-2+random(0)" -map "[vout]" -t 46 -c:v libx264 base.mp4
ffmpeg -i base.mp4 -codec:v libx264 -c:a pcm_s16le -bsf:v noise=1000000 -bsf:a noise=100 glitch.mp4