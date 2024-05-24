#!/bin/bash

for file in input/*.NEF; do
    base=$(basename $file .NEF)
    if [ ! -f input/$base.png ]; then
        echo "No corresponding png file for $file"
        continue
    fi
    exiftool -TagsFromFile $file -CameraModelName -Make -LensModel -Lens -LensMake -FocalLength -FocalLengthIn35mmFormat -FNumber -ISO -ExposureTime -ShutterSpeedValue -Model input/$base.png
done