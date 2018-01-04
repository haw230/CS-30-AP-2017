import java.util.Arrays;

UserInterface ui = new UserInterface();
Text bt = new Text("Hey, what's new with you?", 0);
ArrayList<Text> botTexts = new ArrayList<Text>();
ArrayList<Text> humTexts = new ArrayList<Text>();
String input = "";
StringDict exact, phrase, word, zfinal;
String[] fail = {"Oh, that's nice.", "That's cool, but how's life?", "Right."};
int start = 0;
int end = 0;

void setup() {
  setStrings("chatbot.ini");
  size(500, 700);
  botTexts.add(bt);
}

void draw() {
  ui.drawBackground();
  for(int i = start; i < end + 1; i++) {
    botTexts.get(i).botDisplay();
  }
  
  for(int i = start; i < end; i++) {
    humTexts.get(i).humDisplay();
  }
  ui.drawText();
}

StringDict dictFormat(String[] x) {
  StringDict sd = new StringDict();
  for(int i = 0; i < x.length; i++) {
    String[] temp = x[i].split(":");
    sd.set(temp[0], temp[1]);
  }
  return sd;
}

void setStrings(String fileName) {
  String[] temp = loadStrings(fileName);
  int start = 1;
  int end = 1 + int(temp[0]);
  exact = dictFormat(Arrays.copyOfRange(temp, start, end));
  start = end + 1;
  end += 1 + int(temp[end]);
  phrase = dictFormat(Arrays.copyOfRange(temp, start, end));
  start = end + 1;
  end += 1 + int(temp[end]);
  word = dictFormat(Arrays.copyOfRange(temp, start, end));
  start = end + 1;
  end += 1 + int(temp[end]);
  zfinal = dictFormat(Arrays.copyOfRange(temp, start, end));
}