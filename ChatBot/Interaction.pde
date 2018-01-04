void keyPressed() {
  if(Character.isLetter(key) || key == '"' || key == '\'' || key == '?' || key == '!' || key == ' ' && textWidth(input) < width) {
    input += key;
  }
  
  if(key == BACKSPACE && input.length() > 0) {
    input = input.substring(0, input.length() - 1);
  }
  
  if(key == ENTER && input.length() > 0) {
    humTexts.add(new Text(input, humTexts.size()));
    botTexts.add(new Text(reply(input), botTexts.size()));
    learn(botTexts.get(end).text, humTexts.get(end).text);
    input = "";
    end++;
    if(end != humTexts.size()) {
      end = humTexts.size();
      start = end - 7;
    }
    if(humTexts.size() > 6) {
      start++;
    }
  }
  
  if(keyCode == UP && start > 0) {
    start--;
    end--;
  }
  
  if(keyCode == DOWN && end < humTexts.size()) {
    start++;
    end++;
  }
}