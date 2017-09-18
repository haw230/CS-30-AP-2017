void drawData(int num){ //uses id to move boxes appropriately
  strokeWeight(2);
  for(int i = 0; i < num; i++) {
    students.get(i).display();
  }
}

void drawBackground() {
  background(255, 159, 117);
  
  fill(0);
  textAlign(LEFT);
  textSize(27);
  text("Name", 90, 35);
  text("Grades", 320, 35);
  text("Absences", 450, 35);
}
void addStudent() {
  fill(124, 252, 0);
  rect(30, 50 + studentCount * 70, 155, 25, 3);
  fill(0);
  textSize(20);
  text("+Add a Student", 30, 70 + studentCount * 70);
}

void deleteStudent() {
  fill(179, 58, 58);
  rect(220, 50 + studentCount * 70, 155, 25, 3);
  fill(0);
  textSize(20);
  text("-Delete Student", 220, 70 + studentCount * 70);
}