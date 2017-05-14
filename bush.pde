class Bush
{
  PVector position;
  float rotation;
  
  Bush()
  {
    //sets bush
    position = new PVector(random(1000)-150,random(1000)-150);
    rotation = random(360);
  }
     void update()
  {
  //draws bush and puts them in their place
   pushMatrix();
   translate(position.x, position.y);
   rotate(rotation);
   image(bush, 0, 0);
   popMatrix();
 }
}