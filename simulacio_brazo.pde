/*****salvador marquez*****/
import processing.serial.*;
//import cc.arduino.*;
//Arduino arduino;

int servo1;
int servo2;
int servo3;
int servo4;
int servo5;
int servo6;

Serial puerto;

Robot brazo;

void setup(){
  size(840, 680, P3D);
  textSize(15);
  textAlign(CENTER);
  strokeWeight(18);
  stroke(255, 160);
  
    println(Serial.list()[3]);
   puerto = new Serial(this, Serial.list()[0],9600);

  //Creamos el objeto y pasamos las dimensiones
  brazo = new Robot(20, 130, 200, 20, 100, 15, 70, 15, 70, 15, 40, 15, 40, 0, 180);
  
}
 
void draw(){
  background(100);   

  lights();
   
  //Imprime angulos
  brazo.angulo();
   
  smooth();
   
  //Detecta si el usuario quiere mover la camara
  if (key == 'm' || key == 'M') {
      brazo.camaraX = mouseX;
      brazo.camaraY = mouseY;
     
 }
   
  //Detecta si el usuario quiere modificar el servo 1
  if (key == '1'){
    brazo.servo1 = int(map(mouseX, 0, width, 0, 180));  //Mapea el ancho de la pantalla a valores en grados.
    puerto.write(servo1+"1"); 
  }

  else if (key == 'a'){
      brazo.servo1 = int(map(mouseX, 0, width, 0, 180));  //Mapea el ancho de la pantalla a valores en grados.
    puerto.write(servo1+"a"); 
  }
  
  
  //Detecta si el usuario quiere modificar el servo 2
  if (key == '2'){
    brazo.servo2 = int(map(mouseX, 0, width, 0, 180));  //Mapea el ancho de la pantalla a valores en grados.
    puerto.write(servo2+"2");  
}

   else if (key == 'b'){
      brazo.servo2 = int(map(mouseX, 0, width, 0, 180));  //Mapea el ancho de la pantalla a valores en grados.
    puerto.write(servo2+"b"); 
  }
   
  //Detecta si el usuario quiere modificar el servo 3
  if (key == '3'){
    brazo.servo3 = int(map(mouseX, 0, width, 0, 180));  //Mapea el ancho de la pantalla a valores en grados.
    puerto.write(servo3+"3");
  }
  
   else if (key == 'c'){
      brazo.servo3 = int(map(mouseX, 0, width, 0, 180));  //Mapea el ancho de la pantalla a valores en grados.
    puerto.write(servo3+"c"); 
  }
  
   //Detecta si el usuario quiere modificar el servo 4
  if (key == '4'){
    brazo.servo4 = int(map(mouseX, 0, width, 0, 180));  //Mapea el ancho de la pantalla a valores en grados.
    puerto.write(servo4+"4"); 
}
  
   else if (key == 'd'){
      brazo.servo4 = int(map(mouseX, 0, width, 0, 180));  //Mapea el ancho de la pantalla a valores en grados.
    puerto.write(servo4+"d"); 
  }
  
  //Detecta si el usuario quiere modificar el servo 5
  if (key == '5'){
    brazo.servo5 = int(map(mouseX, 0, width, 0, 180));  //Mapea el ancho de la pantalla a valores en grados.
    puerto.write(servo5+"5"); 
  }
  
   else if (key == 'e'){
      brazo.servo5 = int(map(mouseX, 0, width, 0, 180));  //Mapea el ancho de la pantalla a valores en grados.
    puerto.write(servo5+"e"); 
  }
  
  
  //Detecta si el usuario quiere modificar el servo 6
  if (key == '6'){
    brazo.servo6 = int(map(mouseX, 0, width, 70, 160));  //Mapea el ancho de la pantalla a valores en grados.
    puerto.write(servo6+"6");  
}
   else if (key == 'f'){
      brazo.servo6 = int(map(mouseX, 0, width, 70, 160));  //Mapea el ancho de la pantalla a valores en grados.
    puerto.write(servo6+"f"); 
  }
  
  //Detecta si el usuario quiere salir.
  if (key == 'x' || key == 'X'){
    brazo.salir();
  }
  
  
  brazo.dibujar();
}
 

//Detecta si el usuario quiere guardar la posición.
void keyPressed(){
    if (key == 's' || key == 'S'){
    brazo.guardar();
    }
}

class Robot{
  int camaraX=100, camaraY=205;                        //Variables que controlan la vista de camara.
  int altoCaja, anchoCaja, largoCaja;              //Dimensiones de la caja en mm.
  int aSeg1, lSeg1;                                //ancho y largo de segmento 1.
  int aSeg2, lSeg2;                                //ancho y largo de segmento 2.
  int aSeg3, lSeg3;
  int aSeg4, lSeg4;
  int aSeg5, lSeg5;
  int limIni, limFin;                              //Limites de giro de servo.
  int servo1=60, servo2=66, servo3=64, servo4=33, servo5=1, servo6=156;      //Variables que almacenan el ángulo de los servos (con posicion inicial).  
   
  int [] movimientos1 = new int[0];                //Listado de movimientos.
  int [] movimientos2 = new int[0];
  int [] movimientos3 = new int[0];  
  int [] movimientos4 = new int[0];                //Listado de movimientos.
  int [] movimientos5 = new int[0];
  int [] movimientos6 = new int[0];  
   
  //Constructor
  Robot(int tempAltoCaja, int tempAnchoCaja, int tempLargoCaja, int tempASeg1, int tempLSeg1, int tempASeg2, int tempLSeg2, int tempASeg3, int tempLSeg3, int tempASeg4, int tempLSeg4, int tempASeg5, int tempLSeg5, int tempLimIni, int tempLimFin){
    altoCaja = tempAltoCaja;
    anchoCaja = tempAnchoCaja;
    largoCaja = tempLargoCaja;
    aSeg1 = tempASeg1;
    lSeg1 = tempLSeg1;
    aSeg2 = tempASeg2;
    lSeg2 = tempLSeg2;
    aSeg3 = tempASeg3;
    lSeg3 = tempLSeg3;
    aSeg4 = tempASeg4;
    lSeg4 = tempLSeg4;
    aSeg5 = tempASeg5;
    lSeg5 = tempLSeg5;
    limIni = tempLimIni;
    limFin = tempLimFin;
  }
   
  //Imprime el angulo de los servos
  void angulo(){
    //Imprime ángulo de servos.
  text("servo1 = ", 750, 460);
  text(servo1, 800, 460);
  text("servo2 = ", 750, 480);
  text(servo2, 800, 480);
  text("servo3 = ", 750, 500);
  text(servo3, 800, 500);
  text("servo4 = ", 750, 520);
  text(servo4, 800, 520);
  text("servo5 = ", 750, 540);
  text(servo5, 800, 540);
  text("servo6 = ", 750, 560);
  text(servo6, 800, 560);
  text("Para mantener su posicion actual presione S", 550,580);
  text("Para salir presione X", 635,600);
  text("Para controlar los servos \n presiona del 1 al 6 y mueva el mouse",350,40);
  text("Presione M y mueva el mouse para posicionar la camara",350,90);
  text("Tatiana Stefany Lopez \n Kenny Machado \n Salvador Marquez",100,570);

  }
   
  //Dibuja el brazo robotico
  void dibujar(){
    pushMatrix();
     
 
    translate(width/2, height/2);
    rotateX(radians(camaraY * (-1)));
    rotateY(radians(camaraX));
    fill(#405551);
    
    //Dibuja la base.
    box(anchoCaja, altoCaja, largoCaja);        
 
    //Dibuja el segmento 1 
    translate(0, 40, 40);
    rotateY(radians(servo1-90));
    rotateZ(radians(servo2-90));
    fill(#3BE4F2);
    rect(-aSeg1/2, 5, aSeg1, lSeg1);                           
    box(15,20, 60);
    
    //Dibuja el segmento 2
    translate(0, lSeg1, 0);
    rotateZ(radians(servo3-90));
    fill(#F5AD11);
    rect(-aSeg2/2, 5, aSeg2, lSeg2);
     box(15,20, 25);
    
    //Dibuja el segmento 3
    translate(0, lSeg2, 0);
    rotateZ(radians(servo4-90));
    fill(#22D32C);
   rect(-aSeg3/2, 5, aSeg3, lSeg3);
     box(15,20, 25);
    
     //Dibuja el segmento 4
      
   translate(0, lSeg3, 0);
    rotateY(radians(servo5-90));
    fill(#030200); 
    rect(-aSeg4/2, 5, aSeg4, lSeg4);
      

     
   //Dibuja el segmento 5
 
    translate(0, 5, 20);
    rotateX(radians(servo6-90));
    fill(#FAF032); 
    rect(-aSeg4/2, 0, aSeg5, lSeg5);
     box(0,0, 25);
    
        
    
    
    popMatrix();
  }
 
 
  //Función que va creando el listado de movimientos
  void guardar(){
    movimientos1 = append(movimientos1, servo1);
    movimientos2 = append(movimientos2, servo2);
    movimientos3 = append(movimientos3, servo3);
    movimientos4 = append(movimientos4, servo4);
    movimientos5 = append(movimientos5, servo5);
    movimientos6 = append(movimientos6, servo6);
    
  }
   
  //cierra el programa.
  void salir() {
  exit(); // sale del programa
}

}