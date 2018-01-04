void draw(){
  background(56, 205, 255);
  
  num.drawBox();
  toBase.drawBox();
  fromBase.drawBox();
  
  fill(184);
  rect(button.x, button.y, button.w, button.h); //submit
  
  textSize(23);
  fromBase.printLabel("From Base", 115, 145);
  toBase.printLabel("To Base", 245, 145);
  textSize(30);
  num.printLabel("Number: ", 0, 93);
  fill(0);
  text("AnyBase Converter", (width - textWidth("AnyBase Converter")) / 2, height / 8);
  text("Convert", 355, 185);
  text(ans, (width - textWidth(ans)) / 2, height * 7/8);
  
  num.printText(465, 105);
  fromBase.printText(205, 193);
  toBase.printText(325, 193);
}