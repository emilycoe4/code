//booleans to help me with start/ end screens 
boolean gameStart = false;
boolean gameEnd = false;
boolean youlose = false; 

//all my variables 
float rcolor;
float gcolor;
float bcolor;

float gap;

float paddlewidth = 100;
float paddleheight = 20;
float Xpaddle;

float circlepositionY = 1;
float circleposition;
float circleX;
float circleY;

int score = 0;
int screen = -1;

//Basic setup 
void setup()
{
  // setting up my window
  size(640, 360);
  gap = height - 30;
  circleposition();
  frameRate(45); 
 
}

//Starts the ball at a random spot and has it go in a random direction
void circleposition() {
    circleX = random(0, width);
  circleY = random(0, 100);
  circleposition = random(-1, 1);
  if ( circleposition < 0)
  {
    circleposition = -1;
  } else
  {
    circleposition = 1;
  }
}

//Creating my home page 
void firstscreen() {
  background(0);
    fill(242, 34, 300);
    textSize(15);
    //text for rules pf the game
    text("LET'S PLAY A GAME OF PONG!!", 200, 130);
    text("One Rule: Don't let the ball fall past your paddle.", 150, 160);
    text("Please select your paddle size! The bigger the easier this game will be.", 80, 190);
    text("Press 1 to select small paddle!", 200, 220);
    text("Press 2 to select medium paddle!", 200, 240);
    text("Press 3 to select large paddle!", 200, 260);
    //letting you chose the paddle size EXTRA CREDIT 
    if (keyPressed) {
      if(key=='1'||key=='!') {
        paddlewidth = 100;
      gameStart = true;
      }
      if(key=='2'||key=='@') {
        paddlewidth = 200;
      gameStart = true;
      }
      if(key=='3'||key=='#') {
        paddlewidth = 300;
      gameStart = true;
      }
    }
}
//Big draw statement 
void draw(){
  //making the paddle stay in the screen
  Xpaddle = constrain(mouseX, paddlewidth/2, width - paddlewidth/2); 
  //Letting the first page run 
  if (gameStart !=true) {
  firstscreen();
  }
  else {
   //making the crazy rainbow feature 
    if(gameEnd !=true) {
   if (!mousePressed)
   {
     background(50);
    }
    {
      // centering rectMode
      rectMode(CENTER);

      //making the colors random 
      rcolor = random(0, 255);
      bcolor = random(0, 255);
      gcolor = random(0, 255);


      // filling and creating my circle
      fill(rcolor, gcolor, bcolor);
      circle(circleX, circleY, 20);
      // filling and creating my rectangle
      fill(255);
      rect(Xpaddle, gap, paddlewidth, paddleheight);
      circleY = circleY + circlepositionY;
      circleX = circleX + circleposition;

      // making boundaries so the ball stays in screen
      if (circleX < 0 || circleX > width) {
        circleposition = circleposition * -1;
      }
      if (circleX <= mouseX + paddlewidth/2 && circleX >= mouseX - paddlewidth/2) {
        if (circleY >= gap - paddleheight/2 - 20/2) {
          circlepositionY = circlepositionY * -1;
        }
      }

      if (circleY <= 0) {
        circlepositionY = circlepositionY * -1;
      }
      if (circleY>=height) {
       gameEnd = true;
      }

      score();
      scoreboard();
   
   
  }
 
}
      else if (gameEnd == true) {
      youlose();
      }
  }
}

//text box to show you the current score of the game 
void score()
{
  fill(255);
  textSize(20);
  text("Score: ", 540, 27);
  text(score, 600, 27);
}

//making the score increase and also making the speed increase when it hits the paddle
void scoreboard()
{
  if (circleX <= mouseX + paddlewidth/2 && circleX >= mouseX - paddlewidth/2) {
    if (circleY >= gap - paddleheight/2 - 20/2) {
      score += 1;
      circlepositionY *=  1.2 ;
    }
  }
}

//You lose screen 
void youlose()
{
    background(0);
    fill(242, 34, 300);
    text("GAME OVER!!!!", 250, 150);
    text("Press any key to play again.", 185, 180);
  if (keyPressed == true) {
    score = 0;
    circleposition();
    circlepositionY= 1;
    gameEnd = false;
  }
}

void mousePressed() {
 
}

//extra credit comments -- I couldn't get buttons so I did code pressed and also was unable to adjust the speed but was happy with the extra work I did so decided to submit it anyway. 
