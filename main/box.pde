public class Box {
  String val = "";
  int x, y, w, h;
  boolean clicked = false;
  
  public Box(int a, int b, int c, int d) {
    this.x = a;
    this.y = b;
    this.w = c;
    this.h = d;
  }
  
  public void addText(int maxLength, boolean isNum) {
    if(this.clicked) {
      if((this.val.length() < maxLength && Character.isDigit(key))) {
        this.val += str(key);
      } else if(Character.isLetter(key) && isNum) {
        this.val += str(key).toUpperCase();
      }
    }
  }
  
  public void printLabel(String text, int labelX, int labelY) {
    if(this.clicked) {
      fill(255, 255, 80);
    } else{
      fill(0);
    }
    text(text, labelX, labelY);
  }
  
  public void printText(int textX, int textY) {
    textSize(50);
    text(this.val, textX - textWidth(this.val), textY);
  }
  
  public void drawBox() {
    if(this.clicked) {
      fill(255, 255, 80);
    } else{
      fill(255);
    }
    rect(this.x, this.y, this.w, this.h);
  }

  public boolean clicked() {
    if(mouseX > this.x && mouseX < (this.x + this.w) && mouseY > this.y && mouseY < (this.y + this.h)) {
      this.clicked = true;
    } else{
      this.clicked = false;
    }
    return this.clicked;
  }
  
  public void delete() {
    if(this.clicked && this.val.length() > 0) {
      this.val = this.val.substring(0, this.val.length() - 1);
    }
  }
}

int wid = 600;
int hei = 300;

Box num = new Box((wid - 350) / 2, (hei - 65) / 4, 350, 55);
Box fromBase = new Box((wid - 350) / 2, 150, 90, 50);
Box toBase = new Box((wid - 350) / 2 + 120, 150, 90, 50);
Box button = new Box((wid - 350) / 2 + 225, 150, 125, 50);