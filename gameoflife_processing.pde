/**
 * Borrowing heavily from Daniel Shiffman's *The Nature of Code*
 * http://natureofcode.com
 */

long GENERATION_LIFETIME = 1000;

long generationAge;
int generationCount;
boolean newGeneration;

Gol gol;

void setup() {
  size(620, 190);
  generationAge = millis();
  gol = new Gol();
}

void draw() {
  background(255);

  if (millis() - generationAge > GENERATION_LIFETIME) {
    generationAge = millis();
    newGeneration = true;
    gol.generate();
  }

  gol.draw();

  if (newGeneration && generationCount < 61) {
    generationCount++;
    saveFrame("frame-" + generationCount + ".png");
    newGeneration = false;
  }
}
