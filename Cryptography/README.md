## Cryptography
Step 1:
Choose either shift or substitution by changing ```text.txt``` to ```shift.txt``` or ```substitution.txt``` in the code.
```processing
import java.util.Arrays;

void setup() {
  try {
    String[] lines = loadStrings("text.txt");
    ...
```

Step 2:
Edit the txt file to desired key and the phrase(s) to encode/decode.

<br>![alt text](https://image.prntscr.com/image/Ap6CgidjTDOWvEHQ_Hyw7w.png)<br>

Step 3:
Click run and the files in the folders ```Shift Results``` or ```Substitution Results``` will be updated. There will be an ```Encode Results.txt``` and a ```Decode Results.txt```, containing the shift in either direction.

<br>![alt text](https://image.prntscr.com/image/ebp9PrKVT0qrIXrMGGIUFQ.png)<br>
