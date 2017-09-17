public class Student {
  private String name;
  private float grade;
  private int absence, id;
  private boolean[] column = {false, false, false}; //keeps track of which is highlighted
  
  private Student(int id) { //default student
    this.name = "Bob Smith";
    this.grade = 50.0;
    this.absence = 0;
    this.id = id;
  }
  
  public void display() {
    fill(255);
    if(column[0]) {
      fill(255, 255, 80);
    }
    rect(30, 50 + this.id * 70, 180, 50);
    fill(255);
    if(column[1]) {
      fill(255, 255, 80);
    }
    rect(240, 50 + this.id * 70, 100, 50);
    fill(255);
    if(column[2]) {
      fill(255, 255, 80);
    }
    rect(390, 50 + this.id * 70, 50, 50);
    fill(255);
    
    fill(0);
    text(this.name, 30, 85 + this.id * 70);
    text(this.grade, 230, 85 + this.id * 70);
    text(this.absence, 390, 85 + this.id * 70);
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
    if(mouseX > 30 && mouseX < 210) {
      column[0] = true;
      return true;
    }
    return false;
  }
  
  private boolean checkGrade() {
    if(mouseX > 240 && mouseX < 340) {
      column[1] = true;
      return true;
    }
    return false;
  }
  
  private boolean checkAbsence() {
    if(mouseX > 390 && mouseX < 440) {
      column[2] = true;
      return true;
    }
    return false;
  }
  
  private void changeName() {
    if(Character.isLetter(key) || key == ' ') {
      this.name = name + key;
    } else if(key == BACKSPACE) {
      if(this.name.length() > 0) {
        this.name = name.replaceFirst(".$", "");
      }
    }
  }

  private void changeGrade() {
    if(Character.isDigit(key)) {
      
    } else if(key == BACKSPACE) {
      
    } else if(key == '.') {
      
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