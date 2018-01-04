void keyPressed() {
  num.addText(10, true);
  toBase.addText(2, false);
  fromBase.addText(2, false);
  
  if(key == BACKSPACE) {
    num.delete();
    fromBase.delete();
    toBase.delete();
  }
}