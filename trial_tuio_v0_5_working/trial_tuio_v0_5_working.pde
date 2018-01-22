import TUIO.*;
import processing.video.*;

TuioProcessing tuioClient;

PImage slug1;
PImage slug3;
PImage dandelion2;
PImage leaves1;
PImage leaves3;

Movie visitgarden;
Movie slug2;
Movie dandelion1;
Movie dandelion3;
Movie leaves2;
Movie bird1;
Movie bird2;
Movie bird3;
Movie helvetica1, helvetica2, helvetica3;
Movie futura1, futura2, futura3;
Movie blackletter1, blackletter2, blackletter3;

// these are some helper variables which are used
// to create scalable graphical feedback
float cursor_size = 15;
float object_size = 60;
float table_size = 760;
float scale_factor = 1;
float xpos;
float ypos;
float detect;
PFont font;

boolean verbose = false; // print console debug messages
boolean callback = true; // updates only after callbacks

void setup()
{
  // GUI setup
  fullScreen(); 
  //size(displayWidth, displayHeight);
  noCursor();
  noStroke();
  fill(0);

  // periodic updates
  if (!callback) {
    frameRate(60);
    loop();
  } else noLoop(); // or callback updates 

  font = createFont("Arial", 8);
  scale_factor = height/table_size;

  // finally we create an instance of the TuioProcessing client
  // since we add "this" class as an argument the TuioProcessing class expects
  // an implementation of the TUIO callback methods in this class (see below)
  tuioClient  = new TuioProcessing(this);

  slug1 = loadImage("bananaslugs-01.png");
  slug3= loadImage("bananaslugs-03.png");
  dandelion2= loadImage("dandelion-02.png");
  leaves1= loadImage("fallingleaves-01.png");
  leaves3= loadImage("fallingleaves-03.png");

  visitgarden = new Movie (this, "visitgarden-bg.mp4");
  slug2 = new Movie (this, "bananaslugs-02.mp4");
  dandelion1 = new Movie (this, "dandelion-01.mp4");
  dandelion3 = new Movie (this, "dandelion-03.mp4");
  leaves2 = new Movie (this, "fallingleaves-v2.mp4");
  bird1 = new Movie (this, "hummingbird-01.mp4");
  bird2 = new Movie (this, "hummingbird-02.mp4");
  bird3 = new Movie (this, "hummingbird-03.mp4");

  helvetica1=new Movie(this, "helvetica1.mp4");
  helvetica2=new Movie(this, "helvetica2.mp4");
  helvetica3=new Movie(this, "helvetica3.mp4");
  futura1=new Movie(this, "futura1.mp4");
  futura2=new Movie(this, "futura2.mp4");
  futura3=new Movie(this, "futura3.mp4");
  blackletter1=new Movie(this, "blackletter1.mp4");
  blackletter2=new Movie(this, "blackletter2.mp4");
  blackletter3=new Movie(this, "blackletter3.mp4");
}

// within the draw method we retrieve an ArrayList of type <TuioObject>, <TuioCursor> or <TuioBlob>
// from the TuioProcessing client and then loops over all lists to draw the graphical feedback.
void draw()
{

  background(0);
  textFont(font, 18*scale_factor);
  float obj_size = object_size*scale_factor; 
  float cur_size = cursor_size*scale_factor; 

  ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();
  for (int i=0; i<tuioObjectList.size(); i++) {
    TuioObject tobj = tuioObjectList.get(i);
    stroke(0);
    fill(0);
    pushMatrix();
    translate(tobj.getScreenX(width), tobj.getScreenY(height));
    rotate(tobj.getAngle());
    rect(-obj_size/2, -obj_size/2, obj_size, obj_size);
    popMatrix();
    fill(255);
    text(""+tobj.getSymbolID(), tobj.getScreenX(width), tobj.getScreenY(height));

    detect = tobj.getSymbolID();
    xpos = tobj.getX();
    ypos = tobj.getY();


    //left zone, slug1
    if (detect == 2  && xpos >0.667) {   
      //visitgarden.stop();
      slug2.stop();
      dandelion1.stop();
      dandelion3.stop();
      leaves2.stop();
      bird1.stop();
      bird2.stop();
      bird3.stop();
      helvetica1.stop();
      helvetica2.stop();
      helvetica3.stop();
      blackletter1.stop();
      blackletter2.stop();
      blackletter3.stop();
      futura1.stop();
      futura2.stop();
      futura3.stop();

      image(slug1, width/2, height/2);
      imageMode(CENTER);
      slug1.resize(width, 0);
    }

    //middle zone, slug2
    if (detect == 2 && xpos>0.335 && xpos<0.666 ) { //middle zone
      // visitgarden.stop();
      dandelion1.stop();
      dandelion3.stop();
      leaves2.stop();
      bird1.stop();
      bird2.stop();
      bird3.stop();
      helvetica1.stop();
      helvetica2.stop();
      helvetica3.stop();
      blackletter1.stop();
      blackletter2.stop();
      blackletter3.stop();
      futura1.stop();
      futura2.stop();
      futura3.stop();

      image(slug2, width/2, height/2);
      imageMode(CENTER);
      slug2.loop();
    }

    //right zone, slug3
    if (detect == 2 && xpos>0 && xpos<0.334 ) {  //right zone
      slug2.stop();
      dandelion1.stop();
      dandelion3.stop();
      leaves2.stop();
      bird1.stop();
      bird2.stop();
      bird3.stop();
      helvetica1.stop();
      helvetica2.stop();
      helvetica3.stop();
      blackletter1.stop();
      blackletter2.stop();
      blackletter3.stop();
      futura1.stop();
      futura2.stop();
      futura3.stop();

      image(slug3, width/2, height/2);
      imageMode(CENTER);
      slug3.resize(width, 0);
    }


    //left zone, bird1
    if (detect == 3  && xpos >0.667) {   
      slug2.stop();
      dandelion1.stop();
      dandelion3.stop();
      leaves2.stop();
      bird2.stop();
      bird3.stop();
      helvetica1.stop();
      helvetica2.stop();
      helvetica3.stop();
      blackletter1.stop();
      blackletter2.stop();
      blackletter3.stop();
      futura1.stop();
      futura2.stop();
      futura3.stop();

      image(bird1, width/2, height/2);
      imageMode(CENTER);
      bird1.loop();
    }

    //middle zone, bird2
    if (detect == 3 && xpos>0.335 && xpos<0.666 ) { //middle zone
      slug2.stop();
      dandelion1.stop();
      dandelion3.stop();
      leaves2.stop();
      bird1.stop();
      bird3.stop();
      helvetica1.stop();
      helvetica2.stop();
      helvetica3.stop();
      blackletter1.stop();
      blackletter2.stop();
      blackletter3.stop();
      futura1.stop();
      futura2.stop();
      futura3.stop();

      image(bird2, width/2, height/2);
      imageMode(CENTER);
      bird2.loop();
    }

    //right zone, bird3
    if (detect == 3 && xpos>0 && xpos<0.334 ) {  //right zone
      slug2.stop();
      dandelion1.stop();
      dandelion3.stop();
      leaves2.stop();
      bird1.stop();
      bird2.stop();
      helvetica1.stop();
      helvetica2.stop();
      helvetica3.stop();
      blackletter1.stop();
      blackletter2.stop();
      blackletter3.stop();
      futura1.stop();
      futura2.stop();
      futura3.stop();

      image(bird3, width/2, height/2);
      imageMode(CENTER);
      bird3.loop();
    }

    //left zone, dandelion1
    if (detect == 4  && xpos >0.667) {   
      //visitgarden.stop();
      slug2.stop();
      dandelion3.stop();
      leaves2.stop();
      bird1.stop();
      bird2.stop();
      bird3.stop();
      helvetica1.stop();
      helvetica2.stop();
      helvetica3.stop();
      blackletter1.stop();
      blackletter2.stop();
      blackletter3.stop();
      futura1.stop();
      futura2.stop();
      futura3.stop();

      image(dandelion1, width/2, height/2);
      imageMode(CENTER);
      dandelion1.loop();
    }

    //middle zone, dandelion2
    if (detect == 4 && xpos>0.335 && xpos<0.666 ) { //middle zone
      // visitgarden.stop();
      slug2.stop();
      dandelion1.stop();
      dandelion3.stop();
      leaves2.stop();
      bird1.stop();
      bird2.stop();
      bird3.stop();
      helvetica1.stop();
      helvetica2.stop();
      helvetica3.stop();
      blackletter1.stop();
      blackletter2.stop();
      blackletter3.stop();
      futura1.stop();
      futura2.stop();
      futura3.stop();

      image(dandelion2, width/2, height/2);
      imageMode(CENTER);
      dandelion2.resize(width, 0);
    }

    //right zone, dandelion3
    if (detect == 4 && xpos>0 && xpos<0.334 ) {  //right zone
      slug2.stop();
      dandelion1.stop();
      leaves2.stop();
      bird1.stop();
      bird2.stop();
      bird3.stop();
      helvetica1.stop();
      helvetica2.stop();
      helvetica3.stop();
      blackletter1.stop();
      blackletter2.stop();
      blackletter3.stop();
      futura1.stop();
      futura2.stop();
      futura3.stop();

      image(dandelion3, width/2, height/2);
      imageMode(CENTER);
      dandelion3.loop();
    }

    //left zone, leaves1
    if (detect == 5  && xpos >0.667) {   
      //visitgarden.stop();
      slug2.stop();
      dandelion1.stop();
      dandelion3.stop();
      leaves2.stop();
      bird1.stop();
      bird2.stop();
      bird3.stop();
      helvetica1.stop();
      helvetica2.stop();
      helvetica3.stop();
      blackletter1.stop();
      blackletter2.stop();
      blackletter3.stop();
      futura1.stop();
      futura2.stop();
      futura3.stop();

      image(leaves1, width/2, height/2);
      imageMode(CENTER);
      leaves1.resize(width, 0);
    }

    //middle zone, leaves2
    if (detect == 5 && xpos>0.334 && xpos<0.666 ) { //middle zone
      // visitgarden.stop();
      slug2.stop();
      dandelion1.stop();
      dandelion3.stop();
      bird1.stop();
      bird2.stop();
      bird3.stop();
      helvetica1.stop();
      helvetica2.stop();
      helvetica3.stop();
      blackletter1.stop();
      blackletter2.stop();
      blackletter3.stop();
      futura1.stop();
      futura2.stop();
      futura3.stop();

      image(leaves2, width/2, height/2);
      imageMode(CENTER);
      leaves2.loop();
    }

    //right zone, leaves3
    if (detect == 5 && xpos>0 && xpos<0.334 ) {  //right zone
      // visitgarden.stop();
      slug2.stop();
      dandelion1.stop();
      dandelion3.stop();
      leaves2.stop();
      bird1.stop();
      bird2.stop();
      bird3.stop();
      helvetica1.stop();
      helvetica2.stop();
      helvetica3.stop();
      blackletter1.stop();
      blackletter2.stop();
      blackletter3.stop();
      futura1.stop();
      futura2.stop();
      futura3.stop();

      image(leaves3, width/2, height/2);
      imageMode(CENTER);
      leaves3.resize(width, 0);
    }

    //--------------------------lei-------------------------
    //left zone, helvetica1
    if (detect == 6  && xpos >0.667) {   
      slug2.stop();
      dandelion1.stop();
      dandelion3.stop();
      leaves2.stop();
      bird1.stop();
      bird2.stop();
      bird3.stop();
      helvetica2.stop();
      helvetica1.stop();
      blackletter1.stop();
      blackletter2.stop();
      blackletter3.stop();
      futura1.stop();
      futura2.stop();
      futura3.stop();

      image(helvetica3, width/2, height/2);
      imageMode(CENTER);
      helvetica3.loop();
    }

    //middle zone, helvetica2
    if (detect == 6 && xpos>0.335 && xpos<0.666 ) { //middle zone
      slug2.stop();
      dandelion1.stop();
      dandelion3.stop();
      leaves2.stop();
      bird1.stop();
      bird2.stop();
      bird3.stop();
      helvetica1.stop();
      helvetica3.stop();
      blackletter1.stop();
      blackletter2.stop();
      blackletter3.stop();
      futura1.stop();
      futura2.stop();
      futura3.stop();

      image(helvetica2, width/2, height/2);
      imageMode(CENTER);
      helvetica2.loop();
    }

    //right zone, helvetica1
    if (detect == 6 && xpos>0 && xpos<0.334 ) {  //right zone
      slug2.stop();
      dandelion1.stop();
      dandelion3.stop();
      leaves2.stop();
      bird1.stop();
      bird2.stop();
      bird3.stop();
      helvetica3.stop();
      helvetica2.stop();
      blackletter1.stop();
      blackletter2.stop();
      blackletter3.stop();
      futura1.stop();
      futura2.stop();
      futura3.stop();

      image(helvetica1, width/2, height/2);
      imageMode(CENTER);
      helvetica1.loop();
    }


    //left zone, blackletter3
    if (detect == 7  && xpos >0.667) {   
      slug2.stop();
      dandelion1.stop();
      dandelion3.stop();
      leaves2.stop();
      bird1.stop();
      bird2.stop();
      bird3.stop();
      helvetica2.stop();
      helvetica1.stop();
      helvetica3.stop();
      blackletter1.stop();
      blackletter2.stop();
      futura1.stop();
      futura2.stop();
      futura3.stop();

      image(blackletter3, width/2, height/2);
      imageMode(CENTER);
      blackletter3.loop();
    }

    //middle zone, blackletter2
    if (detect == 7 && xpos>0.335 && xpos<0.666 ) { //middle zone
      slug2.stop();
      dandelion1.stop();
      dandelion3.stop();
      leaves2.stop();
      bird1.stop();
      bird2.stop();
      bird3.stop();
      helvetica1.stop();
      helvetica2.stop();
      helvetica3.stop();
      blackletter1.stop();
      blackletter3.stop();
      futura1.stop();
      futura2.stop();
      futura3.stop();

      image(blackletter2, width/2, height/2);
      imageMode(CENTER);
      blackletter2.loop();
    }

    //right zone, blackletter1
    if (detect == 7 && xpos>0 && xpos<0.334 ) {  //right zone
      slug2.stop();
      dandelion1.stop();
      dandelion3.stop();
      leaves2.stop();
      bird1.stop();
      bird2.stop();
      bird3.stop();
      helvetica3.stop();
      helvetica2.stop();
      helvetica1.stop();
      blackletter2.stop();
      blackletter3.stop();
      futura1.stop();
      futura2.stop();
      futura3.stop();

      image(blackletter1, width/2, height/2);
      imageMode(CENTER);
      blackletter1.loop();
    }


    //left zone, futura3
    if (detect == 8  && xpos >0.667) {   
      slug2.stop();
      dandelion1.stop();
      dandelion3.stop();
      leaves2.stop();
      bird1.stop();
      bird2.stop();
      bird3.stop();
      helvetica2.stop();
      helvetica1.stop();
      helvetica3.stop();
      blackletter1.stop();
      blackletter2.stop();
      blackletter3.stop();
      futura1.stop();
      futura2.stop();

      image(futura3, width/2, height/2);
      imageMode(CENTER);
      futura3.loop();
    }

    //middle zone, futura2
    if (detect == 8 && xpos>0.335 && xpos<0.666 ) { //middle zone
      slug2.stop();
      dandelion1.stop();
      dandelion3.stop();
      leaves2.stop();
      bird1.stop();
      bird2.stop();
      bird3.stop();
      helvetica1.stop();
      helvetica2.stop();
      helvetica3.stop();
      blackletter1.stop();
      blackletter2.stop();
      blackletter3.stop();
      futura1.stop();
      futura3.stop();

      image(futura2, width/2, height/2);
      imageMode(CENTER);
      futura2.loop();
    }

    //right zone, futura1
    if (detect == 8 && xpos>0 && xpos<0.334 ) {  //right zone
      slug2.stop();
      dandelion1.stop();
      dandelion3.stop();
      leaves2.stop();
      bird1.stop();
      bird2.stop();
      bird3.stop();
      helvetica3.stop();
      helvetica2.stop();
      helvetica1.stop();
      blackletter1.stop();
      blackletter2.stop();
      blackletter3.stop();
      futura2.stop();
      futura3.stop();

      image(futura1, width/2, height/2);
      imageMode(CENTER);
      futura1.loop();
    }
  }
}


void movieEvent(Movie m) {
  m.read();
}
void addTuioObject(TuioObject tobj) {
  if (verbose) println("add obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());
}

void updateTuioObject (TuioObject tobj) {
  if (verbose) println("set obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle()
    +" "+tobj.getMotionSpeed()+" "+tobj.getRotationSpeed()+" "+tobj.getMotionAccel()+" "+tobj.getRotationAccel());
}

void removeTuioObject(TuioObject tobj) {
  if (verbose) println("del obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+")");
}

void refresh(TuioTime frameTime) {
  if (verbose) println("frame #"+frameTime.getFrameID()+" ("+frameTime.getTotalMilliseconds()+")");
  if (callback) redraw();
}