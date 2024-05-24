foreach ($file in Get-ChildItem -Path input -Filter *.NEF) {
    $base = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $png = Join-Path -Path $file.DirectoryName -ChildPath "$base.png"
    if (-not (Test-Path $png)) {
        Write-Output "No corresponding png file for $file"
        continue
    }
    & exiftool -TagsFromFile $file.FullName -CameraModelName -Make -LensModel -Lens -LensMake -FocalLength -FocalLengthIn35mmFormat -FNumber -ISO -ExposureTime -ShutterSpeedValue -Model $png
}