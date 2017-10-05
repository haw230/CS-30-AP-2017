void substitute(String[] arr, boolean decode) {
  String[] toShift = Arrays.copyOfRange(arr, 1, arr.length);
  StringDict shiftKey = makeDict(arr[0], decode);
  ArrayList<String> ans = new ArrayList<String>();

  for(int i = 0; i < toShift.length; i++) {
    
    String temp = "";
    char[] chars = toShift[i].toCharArray();
    //CAPS: 65 -> 90, LOW: 97 -> 122
    for(char c : chars) {
      if(Character.isAlphabetic(c)) {
        if(Character.isLowerCase(c)) {
          temp += shiftKey.get(str(c));
        } else{
          temp += shiftKey.get(str(c).toLowerCase()).toUpperCase();
        }
      } else{
        temp += c;
      }
    }
    println(temp);
    ans.add(temp);
  }
  ans.add(0, "Key: " + shiftKey.keyArray());
  if(!decode) {
    saveStrings("/Substitution Results/Encode Results.txt", ans.toArray(new String[ans.size()]));
  } else{
    saveStrings("/Substitution Results/Decode Results.txt", ans.toArray(new String[ans.size()]));
  }
}

StringDict makeDict(String str, boolean decode) {
  StringDict temp = new StringDict();
  String[] arr = str.split("");
  String[] alphabet = "abcdefghijklmnopqrstuvwxyz".split("");
  for(int i = 0; i < arr.length; i++) {
    if(!decode) {
      temp.set(alphabet[i], arr[i].toLowerCase());
    } else{
      temp.set(arr[i].toLowerCase(), alphabet[i]);
    }
  }
  return temp;
}