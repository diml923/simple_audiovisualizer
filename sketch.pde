import peasy.*;
float z = 5;
PeasyCam jCam;
import ddf.minim.*; 
import ddf.minim.analysis.*;  
Minim minim;   
FFT fft;  
AudioInput in;   
float amp = 15; // used to make signal stronger/weaker 
float ampWave = 10*amp; 
PrintWriter output;
AudioPlayer player;



void setup()
{ 
  //fullScreen(P3D, SPAN);
  //canvas(200,200);
  size(1000,1000,P3D);
  minim = new Minim(this); // initalize in setup 
  in = minim.getLineIn(Minim.STEREO, 512); // audio in + bufferSize 512 or 1024 
  fft = new FFT(in.bufferSize(), in.sampleRate());  
  fft.logAverages(22, 6);   //30 chuncks of frequencies



  jCam = new PeasyCam(this, 0, 100, 0, 200); //initialize a jCam
}

void draw() {
  

  

  fft.forward(in.mix);
  background(0);  //set background color
   
   //rotate the whole plane around X Y Z 

       rotateZ(radians(frameCount*(0.1)));
  rotateX(radians(frameCount*0.1));


  for (int i=0; i < fft.avgSize(); i++) {  
    float x = map(i, 0, fft.avgSize(), 0, width); 
    float w = width/fft.avgSize(); 
    float a = fft.getAvg(i)*amp;
    noStroke();
    rotateY(radians((frameCount*0.001)*(a))); 
 

    if ((i<10)&&(i>=0))
    {
         

      pushMatrix();   
      translate(20*cos(x), 150, 20*sin(x)) ;
      fill(25, 25, 112);

      box(5, -a/2, 5);
      popMatrix();
    } 
    if ((i>=10)&&i<20)
    {
       
      pushMatrix();   
      translate(40*cos(x), 150, 40*sin(x) );
      fill(0, 0, 205);
      box(4, -a/2, 4);
      popMatrix();
    } 

    if ((i>=20)&&i<30)
    {

      pushMatrix();   
      translate(60*cos(x), 150, 60*sin(x) );
      fill(0, 191, 255);
      box(4, -a/2, 4);
      popMatrix();
    } else    
    {
      pushMatrix();   
      translate(80*cos(x), 150, 80*sin(x) );
      fill(204,229, 255); 
      box(4, -a/2, 4);
      popMatrix();
    }

    
    if (a>40) 
    {
         if ((i<37)&&(i>=30))
          {
  
            pushMatrix();   
            translate(120*cos(x), 150, 120*sin(x)) ;
            fill(203,154,255);
  
            box(5, -a*(0.5), 5);
            popMatrix();
          } 
          if ((i>=37)&&i<44)
          {
  
            pushMatrix();   
            translate(130*cos(x), 150, 130*sin(x) );
            fill(178,102,255);
            box(4, -a*(0.5), 4);
            popMatrix();
          } 
  
          if ((i>=44)&&i<51)
          {
  
            pushMatrix();   
            translate(150*cos(x), 150, 150*sin(x) );
            fill(153,51,255);
            box(4, -a*(0.5), 4);
            popMatrix();
          } 
          else    
          {
            pushMatrix();   
            translate(160*cos(x), 160, 160*sin(x) );
            fill(127,0,255); 
            box(4, -a*(0.1), 4);
            popMatrix();
          }
      }//if statement of a
      
      
    } //for loop
  }



  void keyPressed() {  //this whole function changes amplitude high or low
    if (keyCode == 38) { // up arrow 
      amp += 5; 
      ampWave = amp*10;
    } else if (keyCode == 40) { // down arrow 
      amp -= 5; 
      if (amp < 5) { 
        amp = 5;
      } 
      ampWave = amp*10;
    }
  } 