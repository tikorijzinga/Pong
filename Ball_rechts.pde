float xspeed = 0;
float yspeed = 6.5;
float rectacc = 0;
float rectx = 542.5;
float recty = 635;
float rectx2 = 542.5;
float recty2 = 0;
float rectx2speed = 0;
float recty2speed = 0;
float rectxspeed = 0;
float rectyspeed = 0;
int score1 = 0;
int score2 = 0;
float ballx = 630;
float bally = 325;
float delay = 5000;
float timePlayed = 0;
boolean timerDisplay = true;

void setup()
{
  size(1260, 650);
  stroke(125);
  timePlayed = millis();
}

void draw()
{
  background(255, 128, 0);
  background(0);
  noStroke();
  fill(255, 255, 255);
  ellipse(ballx, bally, 50, 50);
  fill(0, 0, 255);
  rect(rectx, recty, 175, 15);
  noStroke();
  fill(255, 0, 0);
  rect(rectx2, recty2, 175, 15);

  stroke(255, 0, 0);
  fill(255, 0, 0);
  textSize(32);
  text(score1, 315, 325);

  stroke(0, 0, 255);
  fill(0, 0, 255);
  textSize(32);
  text(score2, 945, 325);

//millis()-timeplayed is de tijd sinds het instellen van timeplayed
  if(millis() - timePlayed >= delay)
  {
  noStroke();
  fill(255, 255, 255);
  textSize(75);
  text((delay / 1000), 500, 340);
  timePlayed = millis();

  }

  if (bally > 600)
  {
    bally = 600;
    yspeed = yspeed * -1;
    xspeed = (rectxspeed / 2);
  }
  if (bally < 50)
  {
    bally = 50;
    yspeed = yspeed * -1;
    xspeed = (rectx2speed / 2);
  }

  if (bally == 600)
  {
    if (ballx < rectx - 25 || ballx > (rectx + 200))
    {
      bally = 1000;
    }
  }
  if (bally == 50)
  {
    if (ballx < rectx2 - 25 || ballx > (rectx2 + 200))
    {
      bally = 2000;
    }
  }

  if (bally == 1000)
  {
    xspeed = 0;
    yspeed = yspeed * -1;
    score1 = score1 + 1;
    bally = 30;
    ballx = 630;
    rectx = 542.5;
    rectx2 = 542.5;
    timePlayed = millis();
    delay(300);
  }

  if (bally == 2000)
  {
    xspeed = 0;
    yspeed = yspeed * -1;
    score2 = score2 + 1;
    bally = 600;
    ballx = 630;
    rectx = 542.5;
    rectx2 = 542.5;
    timePlayed = millis();
    delay(300);
  }

  rectx = (rectx + rectxspeed);
  rectx2 = (rectx2 + rectx2speed);


  ballx = ballx + xspeed;
  bally = bally + yspeed;

  if ((ballx > (width - 25)) || (ballx < 25)) {
    xspeed = xspeed * -1;
  }

  if (rectx < 0)
  {
    rectx = 0;
  }

  if (rectx > 1085)
  {
    rectx = 1085;
  }


  if (rectx2 < 0)
  {
    rectx2 = 0;
  }

  if (rectx2 > 1085)
  {
    rectx2 = 1085;
  }
}



void keyPressed()
{
  if (key == 'a')
  {
    rectxspeed = -15;
  }
  if (key == 'd')
  {
    rectxspeed = 15;
  }
  if (key == 'i')
  {
    rectx2speed = -15;
  }
  if (key == 'p')
  {
    rectx2speed = 15;
  }
}

void keyReleased()
{
  rectacc = 0;
  if (key == 'a')
  {
    rectxspeed = 0;
  }
  if (key == 'd')
  {
    rectxspeed = 0;
  }
  if (key == 'i')
  {
    rectx2speed = 0;
  }
  if (key == 'p')
  {
    rectx2speed = 0;
  }
}