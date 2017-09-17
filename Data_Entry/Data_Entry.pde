Student lastClickedRow = new Student(0);
int lastClickedColumn = 0;

void setup() {
  students.add(lastClickedRow);
  students.get(0).column = new boolean[]{true, false, false};
  students.add(new Student(1));
  size(600, 600);
}

void draw() {
  drawBackground();
  drawData(students.size());
}