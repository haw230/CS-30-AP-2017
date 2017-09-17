void mouseClicked(){
  try{
    lastClickedRow.clearHighlight();
  } catch(NullPointerException e) {
    println("Nothing clicked.");
  }
  if(mouseY > 50 && mouseY < 50 + students.size() * 70) {
    for(int i = 0; i < students.size(); i++) {
      int start = 50 + i * 70;
      if(mouseY > start && mouseY < start + 50) {
        lastClickedRow = students.get(i);
        lastClickedColumn = lastClickedRow.row();
        break;
      }
    }
  } else {
    lastClickedRow = null;
  }
  println(lastClickedRow, lastClickedColumn);
}

void keyPressed() {
  //for(Boolean
  if(lastClickedRow != null && lastClickedColumn > -1) {
    
    if(key == TAB) {
      lastClickedRow.clearHighlight(); //set all to false
      if(lastClickedColumn == 2) { //last column
        if(lastClickedRow.id == students.size() - 1) { //last row
          //loop back to first
          lastClickedRow = students.get(0);
          lastClickedRow.column = new boolean[]{true, false, false};
          lastClickedColumn = 0;
        } else{
          lastClickedRow = students.get(lastClickedRow.id + 1);
          lastClickedRow.column = new boolean[]{true, false, false};
          lastClickedColumn = 0;
        }
      } else{
        lastClickedColumn++;
        lastClickedRow.column[lastClickedColumn] = true;
      }
      
    } else{
      if(lastClickedColumn == 0) {
        lastClickedRow.changeName();
      } else if(lastClickedColumn == 1) {
        lastClickedRow.changeGrade();
      } else {
        lastClickedRow.changeAbsence();
      }
    }
  }
}