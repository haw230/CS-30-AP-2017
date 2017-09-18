Student lastClickedRow = new Student(0);
int lastClickedColumn = 0;
int studentCount = 1; //more efficent than students.size()

void setup() {
  students.add(lastClickedRow);
  lastClickedRow.column = new boolean[]{true, false, false};
  lastClickedRow.name = "Bob Smith";
  lastClickedRow.grade = "99.99";
  lastClickedRow.absence = 4;
  size(600, 600);
}

void draw() {
  drawBackground();
  drawData(studentCount);
  if(studentCount < 7) {
    addStudent();
  }
  if(studentCount > 1) {
    deleteStudent();;
  }
  if(lastClickedRow != null) {
    if(lastClickedRow.name.length() > 0 && lastClickedRow.grade.length() > 0) {
      text(lastClickedRow.name + " has an average of " + lastClickedRow.grade + 
           "% and missed " + lastClickedRow.absence + " days", 0, 90 + studentCount * 90);
    }
  }
}