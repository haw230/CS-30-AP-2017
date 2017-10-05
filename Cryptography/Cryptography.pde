import java.util.Arrays;

void setup() {
  try {
    String[] lines = loadStrings("substitute.txt");
    if(isShift(lines[0])) {
      shift(lines, int(lines[0]), false);
      shift(lines, abs(26 - int(lines[0])), true);
    } else{
      substitute(lines, false);
      substitute(lines, true);
    }
  } catch(Exception e) {
    println("Bad input");
  }
}

boolean isShift(String str) {
  for(char c : str.toCharArray()) {
    if(!Character.isDigit(c)) {
      return false;
    }
  }
  return true;
}