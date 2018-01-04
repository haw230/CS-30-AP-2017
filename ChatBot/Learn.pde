void learn(String k, String val) {
  String str = "";
  for(char c: k.toCharArray()) {
    if(Character.isLetter(c) || c == '?' || c == '!') {
      str += c;
    }
  }
  str = str.toLowerCase();
  if(exact.hasKey(str)) {
    exact.set(str, exact.get(str) + "# " + val);
  } else{
    exact.set(str, val);
  }
}

ArrayList formatArray(StringDict x) {
  String[] keys = x.keyArray();
  int klen = keys.length;
  String[] temp = new String[klen + 1];
  temp[0] = str(klen);
  for(int i = 0; i < klen; i++) {
    temp[i + 1] = keys[i] + ":" + x.get(keys[i]);
  }
  return new ArrayList<String>(Arrays.asList(temp));
}

void exit() {
  String[] keys = exact.keyArray();
  ArrayList<String> saveArr = new ArrayList<String>();
  saveArr.addAll(formatArray(exact));
  saveArr.addAll(formatArray(phrase));
  saveArr.addAll(formatArray(word));
  saveArr.addAll(formatArray(zfinal));
  saveStrings("chatbot.ini", saveArr.toArray(new String[saveArr.size()]));
}