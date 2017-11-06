/*
Realizing the error of his ways, the Easter Bunny has switched to a better model of determining whether a string is naughty or nice. None of the old rules apply, as they are all clearly ridiculous.

Now, a nice string is one with all of the following properties:

It contains a pair of any two letters that appears at least twice in the string without overlapping, like xyxy (xy) or aabcdefgaa (aa), but not like aaa (aa, but it overlaps).
It contains at least one letter which repeats with exactly one letter between them, like xyx, abcdefeghi (efe), or even aaa.
For example:

qjhvhtzxzqqjkmpb is nice because is has a pair that appears twice (qj) and a letter that repeats with exactly one letter between them (zxz).
xxyxx is nice because it has a pair that appears twice and a letter that repeats with one between, even though the letters used by each rule overlap.
uurcxstgmygtbstg is naughty because it has a pair (tg) but no repeat with a single letter between them.
ieodomkazucvgmuy is naughty because it has a repeating letter with one between (odo), but no pair that appears twice.
How many strings are nice under these new rules?
*/

void partTwo(String[] lines, int nice) {
  for (int i = 0; i < lines.length; i++) {
    if(!hasTwoPairs(lines[i])) {
      println(lines[i]);
      continue;
    }
    if(!hasAltRepeat(lines[i]))
      continue;
    nice++;
  }
  print('a' + 'b');
  text("Number of lines: " + lines.length + " Nice Strings: " + nice, 10, 10);
}

boolean hasTwoPairs(String x) {
  //It contains a pair of any two letters that appears at least twice in the string without overlapping, like xyxy (xy) or aabcdefgaa (aa), but not like aaa (aa, but it overlaps).
  for(int i = 0; i < x.length() - 1; i++) {
    if(x.indexOf(str(x.charAt(i)) + str(x.charAt(i + 1)), i + 1) > -1) {
      return true;
    }
  }
  return false;
}

boolean hasAltRepeat(String x) {
  for(int i = 0; i < x.length() - 2; i++) {
    if(x.charAt(i) == x.charAt(i + 2))
      return true;
  }
  return false;
}