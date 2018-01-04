String reply(String in) {
  String str = "";
  for(char c: in.toCharArray()) {
    if(Character.isLetter(c) || c == '?' || c == '!') {
      str += c;
    }
  }
  if(str.length() == 0) {
    return "Don't be shy!";
  }
  str = str.toLowerCase(); //String[] temp = exact.keyArray();
  return checkExact(str, exact.keyArray());
}

String checkExact(String x, String[] y) {
  for(String str : y) {
    if(exact.hasKey(x)) {
      String[] t = exact.get(x).split("# ");
      return t[int(random(t.length))];
    }
  }
  return checkPhrase(x, phrase.keyArray());
}

String checkPhrase(String x, String[] y) {
  for(String str : y) {
    if(x.indexOf(str) > -1 && x.length() > str.length()) {
      String t = phrase.get(str);
      return t + input.substring(x.indexOf(str) + t.length()) + ", too";
    }
  }
  return checkWord(x, word.keyArray());
}

String checkWord(String x, String[] y) {
  for(String str : y) {
    if(x.indexOf(str) > -1) {
      String[] t = word.get(str).split("# ");
      return t[int(random(t.length))];
    }
  }
  return checkFinal(x, zfinal.keyArray());
}

String checkFinal(String x, String[] y) {
  for(String str : y) {
    if(x.indexOf(str) > -1) {
      String[] t = zfinal.get(str).split("# ");
      return t[int(random(t.length))];
    }
  }
  return fail[int(random(fail.length))];
}