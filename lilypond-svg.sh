rm lilypond/*.svg

echo "[*] ly to svg"

for file in lilypond/*.ly; do
    (lilypond -dno-point-and-click -fsvg -o "${file%.*}" "$file") &
done;

wait

echo "[*] crop svg"

for file in lilypond/*.svg; do
    (inkscape --actions "select-all;fit-canvas-to-selection" --export-overwrite "$file") &
done;

wait

echo "[*] copy svg into ./figures/"

for file in lilypond/*.svg; do
    (cp $file "$(dirname $file)/../figures/") &
done;

echo "[*] done"
