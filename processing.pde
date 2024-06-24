int cols = 0;
int rows = 0;
int scl = 20;
int w = 3000;
int h = 3000;
float[][] terrain;
void setup() {
    fullScreen(P3D);
    cols = w / scl;
    rows = h / scl;
    terrain = new float[rows][cols];
}
float flying = 0;
void generate_terrain() {
    float yoff = flying -= 0.01;
    for (int y = 0; y < rows; ++y) {
        float xoff = 0;
        for (int x = 0; x < cols; ++x) {
            terrain[y][x] = map(noise(xoff,yoff),0,1, -2,300);
            xoff += 0.1;
        }
        yoff += 0.1;
    }
    background(#87CEEB);
    noStroke();
    fill(#FFE87C);
    ellipse(1860,10,300,300);
    stroke(#4B4D55);
    fill(#686D76);
    
    translate(width / 2,height);
    rotateX(PI / 2);
    translate( -width / 2 - 570, -height);
    for (int y = 0; y < rows - 1; y++) {       
        beginShape(TRIANGLE_STRIP);
        for (int x = 0; x < cols; x++) {
            vertex(x * scl, y * scl,terrain[y][x]);
            vertex(x * scl,(y + 1) * scl,terrain[y + 1][x]);
        }
        endShape();
    }
}

void draw() {
    generate_terrain();
}