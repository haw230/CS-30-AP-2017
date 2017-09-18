public class Student {
  private String name;
  private String grade;
  private int absence, id;
  private boolean[] column = {false, false, false}; //keeps track of which is highlighted
 
  private Student(int id) { //default student
    this.name = "";
    this.grade = "";
    this.absence = 0;
    this.id = id;
  }
  
  public void display() {
    fill(255);
    if(column[0]) {
      fill(255, 255, 80);
    }
    rect(30, 50 + this.id * 70, 210, 50);
    fill(255);
    if(column[1]) {
      fill(255, 255, 80);
    }
    rect(310, 50 + this.id * 70, 100, 50);
    fill(255);
    if(column[2]) {
      fill(255, 255, 80);
    }
    rect(480, 50 + this.id * 70, 50, 50);
    fill(255);
    
    fill(0);
    text(this.name, 30, 85 + this.id * 70);
    text(this.grade, 310, 85 + this.id * 70);
    text(this.absence, 480, 85 + this.id * 70);
  }
  
  private int row() {
    if(this.checkName()) {
      return 0;
    } else if(this.checkGrade()) {
      return 1;
    } else if(this.checkAbsence()) {
      return 2;
    }
    return -1;
  }
  
  private boolean checkName() {
    if(mouseX > 30 && mouseX < 240) {
      column[0] = true;
      return true;
    }
    return false;
  }
  
  private boolean checkGrade() {
    if(mouseX > 310 && mouseX < 410) {
      column[1] = true;
      return true;
    }
    return false;
  }
  
  private boolean checkAbsence() { //rect(480, 50 + this.id * 70, 50, 50);
    if(mouseX > 480 && mouseX < 530) {
      column[2] = true;
      return true;
    }
    return false;
  }
  
  private void changeName() {
    if(Character.isLetter(key) || key == ' ') {
      if(this.name.length() < 15) {
        this.name = name + key;
      }
    } else if(key == BACKSPACE) {
      if(this.name.length() > 0) {
        this.name = this.name.substring(0, this.name.length() - 1);
      }
    }
  }

  private void changeGrade() {
    if(this.grade.length() < 6) {
      if(Character.isDigit(key)) {
        this.grade += key;
      } else if(key == '.') {
        if(this.grade.indexOf(".") < 0) {
          this.grade += ".";
        }
      }
    }
    if(key == BACKSPACE) {
      if(this.grade.length() > 0) {
        this.grade = this.grade.substring(0, this.grade.length() - 1);
      }
    }
  }
  
  private void changeAbsence() {
    if(Character.isDigit(key)) {
      int val = this.absence * 10 + Character.getNumericValue(key);
      if(val < 1000) {
        this.absence = val;
      }
    } else if (key == BACKSPACE && this.absence > 9){
      this.absence = int(str(this.absence).replaceFirst(".$", ""));
    } else if(key == BACKSPACE) {
      this.absence = 0;
    }
  }
  private void clearHighlight() {
    this.column = new boolean[]{false, false, false};
  }
}

ArrayList<Student> students = new ArrayList<Student>();