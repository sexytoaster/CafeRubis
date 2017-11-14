//patrick O'Connor
//c16462144

ArrayList<Product> products = new ArrayList<Product>();
ArrayList<Product> bill = new ArrayList<Product>();

void setup(){
 size(800, 600); 
 
 loadData();
 printProducts();
 displayProducts();
}


void loadData(){

  Table table = loadTable("cafe.csv", "header");
  
  for(TableRow p:table.rows())
  {
    Product product = new Product(p);
    products.add(product);
  }
  
}

void printProducts(){
 
  for(Product p:products)
  {
    println(p.name);
    println(p.price);
  }
}

void displayProducts(){
  float x;
  float boxHeight;
  float boxWidth;
  float billWidth;
  float billHeight;
  float borderLeft;
  float start;
  int i;
  
  x = products.size();
  
  //we want to put the products list between the top and bottom 10% of the screen
  //and have them each fill about a third of the screen horizontally about 5% away
  //from the edge
  start = height/10;
  boxHeight = (height/(x + 2));
  boxWidth = width/4;
  borderLeft = width/20;
  billWidth = (width/2)/1.1;
  billHeight = (height/1.3);
  
  
  line(width/2, height/10, width/2, height - (height/10));
  rect((width/2) + 10, start, billWidth, billHeight);
  textSize(25);
  fill(0);
  text("Your Bill", (width/5) * 3, start + boxHeight/2);
  fill(255);
  
  
  for(i = 0; i < products.size()  ; i++)
  {
     rect(borderLeft, start, borderLeft + boxWidth, boxHeight);
     start = start + boxHeight + 10;
  }
  
  start = height/10;
  
  for(Product product: products)
  {
     fill(0);
     textSize(16);
     text(product.name, borderLeft + 10, start + boxHeight/2);
     start = start + boxHeight + 10;
  }
  
  start = height/10;
  
   for(Product product: products)
  {
     float dec = product.price;
     String sDec = nf(dec, 1, 2);
     fill(0);
     textSize(16);
     text(sDec, (borderLeft + boxWidth) - 20, start + boxHeight/2);
     start = start + boxHeight + 10;
  }  
  
}

void mousePressed(){
  
  
}



void draw(){
}