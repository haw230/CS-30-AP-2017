/*
  The Easter Bunny needs help figuring out which strings in his text file are naughty or nice.

A nice string is one with all of the following properties:

It contains at least three vowels (aeiou only), like aei, xazegov, or aeiouaeiouaeiou.
It contains at least one letter that appears twice in a row, like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements.
For example:

ugknbfddgicrmopn is nice because it has at least three vowels (u...i...o...), a double letter (...dd...), and none of the disallowed substrings.
aaa is nice because it has at least three vowels and a double letter, even though the letters used by different rules overlap.
jchzalrnumimnmhp is naughty because it has no double letter.
haegwjzuvuyypxyu is naughty because it contains the string xy.
dvszwmarrgswjxmb is naughty because it contains only one vowel.
How many strings are nice?*/

void partOne(String[] lines, int nice) {
  for (int i=0; i<lines.length; i++) {
    if(hasBadString(lines[i])) 
      continue;
    if(!hasVowel(lines[i]))
      continue;
    if(!hasConsec(lines[i]))
      continue;
    nice++;
  }
  text("Number of lines: " + lines.length + " Nice Strings: " + nice, 10, 10);
}

boolean hasBadString(String x) {
  //It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements.
  if(x.indexOf("ab") > -1 || x.indexOf("cd") > -1 || x.indexOf("pq") > -1 || x.indexOf("xy") > -1)
    return true;
  return false;
}

boolean hasVowel(String x) {
  //It contains at least three vowels (aeiou only), like aei, xazegov, or aeiouaeiouaeiou.
  String vowels = "aeiou";
  int count = 0;
  
  for(int i = 0; i < x.length(); i++) {
    if(vowels.indexOf(x.charAt(i)) > -1)
      count++;
  }
  if(count >= 3)
    return true;
  return false;
}

boolean hasConsec(String x) {
  //It contains at least one letter that appears twice in a row, like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
  for(int i = 0; i < x.length() - 1; i++) {
    if(x.charAt(i) == x.charAt(i + 1))
      return true;
  }
  return false;
}