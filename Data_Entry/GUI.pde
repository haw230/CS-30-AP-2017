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
  text("Grades", 245, 35);
  text("Absences", 365, 35);
}