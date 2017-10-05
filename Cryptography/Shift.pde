void shift(String[] arr, int shiftKey, boolean decode) {
  String[] toShift = Arrays.copyOfRange(arr, 1, arr.length);
  ArrayList<String> ans = new ArrayList<String>();
  
  for(int i = 0; i < toShift.length; i++) {
    
    String temp = "";
    char[] chars = toShift[i].toCharArray();
    //CAPS: 65 -> 90, LOW: 97 -> 122
    for(char c : chars) {
      if(Character.isAlphabetic(c)) {
        int ascii = int(c);
        if(Character.isLowerCase(c)) {
          temp += shiftLower(ascii, shiftKey);
        } else{
          temp += shiftUpper(ascii, shiftKey);
        }
      } else{
        temp += c;
      }
    }
    println(temp);
    ans.add(temp);
  }
  ans.add(0, "Key: " + str(shiftKey));
  if(!decode) {
    saveStrings("/Shift Results/Encode Results.txt", ans.toArray(new String[ans.size()]));
  } else{
    saveStrings("/Shift Results/Decode Results.txt", ans.toArray(new String[ans.size()]));
  }
}

char shiftLower(int ascii, int shiftKey) {
  if(ascii + shiftKey > 122) { //wraparound case
    return char(ascii + shiftKey - 26);
  } else{
    return char(ascii + shiftKey);
  }
}

char shiftUpper(int ascii, int shiftKey) {
  if(ascii + shiftKey > 90) { //wraparound case
    return char(ascii + shiftKey - 26);
  } else{
    return char(ascii + shiftKey);
  }
}