/**
 * Borrowing heavily from Daniel Shiffman's *The Nature of Code*
 * http://natureofcode.com
 */

long GENERATION_LIFETIME = 1000;

long generationAge;
Gol gol;

void setup() {
  size(400, 400);
  generationAge = millis();
  gol = new Gol();
}

void draw() {
  background(255);

  if (millis() - generationAge > GENERATION_LIFETIME) {
    generationAge = millis();
    gol.generate();
  }

  gol.draw();
}
