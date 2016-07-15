//**salvador**

#include <Servo.h> //Cabecera para el servo



void f_servos(); //FUNCION

//char A,B,C,D,E,F,G,H,I,J,K,L; //variables que se digitaran en el monitor serial

Servo servo1; //Servos a mover
Servo servo2;
Servo servo3;
Servo servo4;
Servo servo5;
Servo servo6;

int datos; //Se le asigna el valor leido en el puerto serial

int pos = 90;//Posicion inicial del servo
int pos1=90;
int pos2=90;
int pos3=120;
int pos4=160;
int pos5=90;
 


void setup(){


  servo1.attach(7);   //Servo en puerto 7
  servo2.attach(8);   //puerto 8
  servo3.attach(9);    //puerto 9
  servo4.attach(10);   //Servo en puerto 10
  servo5.attach(11);   //puerto 11
  servo6.attach(12);    //puerto 12

  servo1.write(pos);
  servo2.write(pos1);
  servo3.write(pos2);
  servo4.write(pos3);
  servo5.write(pos4);
  servo6.write(pos5);


  

  Serial.begin(9600);  //Se inicializa el puerto serial configurado a 9600

}

 

void loop(){
 
   
    if(Serial.available())

   {

    datos=Serial.read(); //Asignando valor leido en el puerto

        

         
    switch(datos)
    {
      
     //*****GIRO*****
     
      case 'a':  // Si el valor digitado es a gira a la derecha
        Serial.println(" 'A' Digitado");
        pos +=15;        // se incrementa
        servo1.write(pos); //la posicion del servo   
      break;

      case 'b':   // Si el valor digitado es b gira a la izquierda
        Serial.println(" 'B' Digitado");
        pos -=15;              // Se decrementa                                  
        servo1.write(pos);        // el valor del servo  
      break;


      //*****ANTEBRAZO*****
      
      case 'c':   // Si el valor digitado es c gira a la derecha
       Serial.println(" 'C' Digitado");
       pos1 +=5;  //Incrementa el valor del servo
       servo2.write(pos1);
       
      break;

      case 'd':  // Si el valor digitado es d gira a la izquierda
       Serial.println(" 'D' Digitado");
       pos1 -=5;     //Se decrementa el valor del servo                                
       servo2.write(pos1);         
      break;


      //*****CODO*****

     case 'e': // Si el valor digitado es e gira a la derecha
        Serial.println(" 'E' Digitado");
        pos2 +=5;  //Incrementa el valor del servo
        servo3.write(pos2);
       
     break;

     case 'f':  // Si el valor digitado es f gira a la izquierda
        Serial.println(" 'F' Digitado");
        pos2 -=5;     //Se decrementa el valor del servo
        servo3.write(pos2); 
     break;

     
        //*****BRAZO*****
       
     case 'g':  // Si el valor digitado es g gira a la derecha
         Serial.println(" 'G' Digitado");
         pos3 +=5;        // se incrementa
         servo4.write(pos3); //la posicion del servo
       
     break;

     case 'h':  // Si el valor digitado es h gira a la izquierda
         Serial.println(" 'H' Digitado");
         pos3 -=5;              // Se decrementa                                  
         servo4.write(pos3);        // el valor del servo
     break;

  
      //*****MUNNECA*****

     case 'i':  // Si el valor digitado es i gira a la derecha
          Serial.println(" 'I' Digitado");
          pos4 +=15;  //Incrementa el valor del servo
          servo5.write(pos4);
       
     break;

     case 'j':  // Si el valor digitado es j gira a la izquierda
          Serial.println(" 'J' Digitado");
          pos4 -=15;     //Se decrementa el valor del servo
          servo5.write(pos4);             
     break;

     
     //*****PINZAS*****

     case 'k':   // Si el valor digitado es k gira a la derecha
         Serial.println(" 'K' Digitado");
         pos5 +=15;  //Incrementa el valor del servo
         servo6.write(pos5);
       
     break;

     case 'l':   // Si el valor digitado es l gira a la izquierda
         Serial.println(" 'L' Digitado");
         pos5 -=15;     //Se decrementa el valor del servo
         servo6.write(pos5); 
        
     break;

     case 'Z':
     Serial.println(" 'Z' Digitado"); //Todo a posicion inicial
        servo1.write(90);
        //servo2.write(pos1);
        servo3.write(120);
        servo4.write(120);
        servo5.write(160);
        servo6.write(90);
     break;

      

  
    }
   }
     

}// CIERA EL VOID LOOP()

//**marquez**
