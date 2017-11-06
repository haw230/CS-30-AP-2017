void tri(int x, int y, int n, int shiftX, int shiftY) {
  if(n > 0) {
    fill(random(255), random(255), random(255));
    triangle(0 + shiftX, y + shiftY, x/4 + shiftX, y/2 + shiftY, x/2 + shiftX, y + shiftY); //left
    tri(x/2, y/2, n - 1, shiftX, shiftY + y/2);
    triangle(x/4 + shiftX, y/2 + shiftY, x/2 + shiftX, 0 + shiftY, 3*x/4 + shiftX, y/2 + shiftY); //top
    tri(x/2, y/2, n - 1, shiftX + x/4, shiftY);
    triangle(x/2 + shiftX, y + shiftY, 3*x/4 + shiftX, y/2 + shiftY, x + shiftX, y + shiftY); //right
    tri(x/2, y/2, n - 1, shiftX + x/2, shiftY + y/2);
  }
}


void setup() {
  int x = 600;
  int y = 490;
  int n = 5;
  int shiftX = 0;
  int shiftY = 0;
  size(600, 490);
  fill(0, 0);
  tri(x, y, n, shiftX, shiftY);
}