class UserInterface {
  void drawBackground() {
    background(0);
    fill(255);
    textSize(30);
    text("Chat Bot", (width - textWidth("Chat Bot")) / 2, height / 20);
    fill(127, 255, 0);
    text("Bot", 10, height / 20);
    fill(135, 206, 250);
    text("Human", width - textWidth("Human") - 10, height / 20);
  }
  
  void drawText() {
    fill(255);
    rect(0, height - 90, width, 35);
    fill(0);
    text(input, 5, height - 40 - textAscent());

  }
}

class Text {
  String text;
  int id;
  
  Text(String val, int x) {
    this.text = val;
    this.id = x;
  }
  
  void humDisplay() {
    textSize(25);
    fill(135, 206, 250);
    rect(width - textWidth(this.text) - 10, height / 16 + 40 + (this.id - start) * 80, textWidth(this.text), textAscent() * 1.2, 10, 10, 0, 10);
    fill(0);
    text(this.text, width - textWidth(this.text) - 10, height / 16 + textAscent() + (this.id - start) * 80 + 40);
  }
  
  void botDisplay() {
    textSize(25);
    fill(127, 255, 0);
    rect(10, height / 16 + (this.id - start) * 80, textWidth(this.text), textAscent() * 1.2, 10, 10, 10, 0);
    fill(0);
    text(this.text, 10, height / 16 + textAscent() + (this.id - start) * 80);
  }
}