String iterConvert(int num, int base) {
  String result = "";
  while(num > 0) {
    if(num % base < 10){
      result = str(num % base) + result;
    } else{
      result = char(num % base + 55) + result;
    }
    num = num / base;
  }
  return result;
}

String convert(int num, int base) {
  if(num == 0) {
    return "";
  }
  if(num % base < 10){
    return convert(num / base, base) + str(num % base);
  } else{
    return convert(num / base, base) + char(num % base + 55);
  }
}

int toTen(String num, int base) {
  int temp = 0;
  for(int i = 0; i < num.length(); i++) {
    char cha = num.charAt(num.length() - 1 - i);
    if(Character.isDigit(cha)) {
      temp += int(str(cha)) * pow(base, i);
    } else{
      temp += (int(cha) - 55) * pow(base, i);
    }
  }
  return temp;
}