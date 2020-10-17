#!/usr/bin/env bash

# Combine two files using a chromakey effects

# Parameters:
# $1: Input File 1
# $2: Input File 2
# $3: Blend Mode

# acceptabel blend mode options:
# addition, addition128, grainmerge, and, average, burn, darken, difference, difference128, grainextract,
# divide, dodge, freeze, exclusion, extremity, glow, hardlight, hardmix, heat,
# lighten, linearlight, multiply, multiply128, negation, normal, or, overlay,
# phoenix, pinlight, reflect, screen, softlight, subtract, vividlight, xor


ffmpeg -i "$1" -i "$2" -c:v prores -profile:v 3 -filter_complex '[1:v][0:v]scale2ref[ckout][vid];[vid][ckout]blend=all_mode='$3' [out]' -map '[out]' "${1%%.*}_blend_${3}.mov"
