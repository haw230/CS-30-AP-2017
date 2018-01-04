void mouseClicked(){
  num.clicked();
  fromBase.clicked();
  toBase.clicked();
  s();
}

boolean s() {
  if(button.clicked()) {
    int limit = int(fromBase.val) - 1;
    for(int i = 0; i < num.val.length(); i++) {
      char cha = num.val.charAt(i);
      if(Character.isDigit(cha)) {
        if(int(str(cha)) > limit) {
          ans = "Error";
          return false;
        }
      } else{
        if((int(cha) - 55) > limit) {
          ans = "Error";
          return false;
        }
      }
    }
    if(num.val != "" && fromBase.val != "" && toBase.val != "") {
      if((int(fromBase.val) < 35 && int(fromBase.val) > 1 && int(toBase.val) < 35 && int(toBase.val) > 1)) {
        ans = convert(toTen(num.val, int(fromBase.val)), int(toBase.val));
      }
    }
  }
  return false;
}