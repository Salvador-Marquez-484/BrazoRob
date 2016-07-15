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

int pos =90;  //90;//Posicion inicial del servo
int pos1=60;  //90;
int pos2=90;  //90
int pos3=120; //120
int pos4=160; //160
int pos5=90; //90
 


 

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
     
      case '1':  // Si el valor digitado es a gira a la derecha
        Serial.println(" 'A' Digitado");
        pos +=1;        // se incrementa
        servo1.write(pos); //la posicion del servo   
        delay(100);
      break;

      case 'a':   // Si el valor digitado es b gira a la izquierda
        Serial.println(" 'B' Digitado");
        pos -=1;              // Se decrementa                                  
        servo1.write(pos);        // el valor del servo 
        delay(60); 
      break;


      //*****ANTEBRAZO*****
      
      case '2':   // Si el valor digitado es c gira a la derecha
       Serial.println(" 'C' Digitado");
       pos1 +=1;  //Incrementa el valor del servo
       servo2.write(pos1);
       delay(100);
      break;

      case 'b':  // Si el valor digitado es d gira a la izquierda
       Serial.println(" 'D' Digitado");
       pos1 -=1;     //Se decrementa el valor del servo                                
       servo2.write(pos1); 
         delay(60);        
      break;


      //*****CODO*****

     case '3': // Si el valor digitado es e gira a la derecha
        Serial.println(" 'E' Digitado");
        pos2 +=1;  //Incrementa el valor del servo
        servo3.write(pos2);
         delay(100);
     break;

     case 'c':  // Si el valor digitado es f gira a la izquierda
        Serial.println(" 'F' Digitado");
        pos2 -=1;     //Se decrementa el valor del servo
        servo3.write(pos2); 
          delay(60);
     break;

     
        //*****BRAZO*****
       
     case '4':  // Si el valor digitado es g gira a la derecha
         Serial.println(" 'G' Digitado");
         pos3 +=1;        // se incrementa
         servo4.write(pos3); //la posicion del servo
         delay(100);
     break;

     case 'd':  // Si el valor digitado es h gira a la izquierda
         Serial.println(" 'H' Digitado");
         pos3 -=1;              // Se decrementa                                  
         servo4.write(pos3);        // el valor del servo
           delay(60);
     break;

  
      //*****MUNNECA*****

     case '5':  // Si el valor digitado es i gira a la derecha
          Serial.println(" 'I' Digitado");
          pos4 +=1;  //Incrementa el valor del servo
          servo5.write(pos4);
            delay(100);
     break;

     case 'e':  // Si el valor digitado es j gira a la izquierda
          Serial.println(" 'J' Digitado");
          pos4 -=1;     //Se decrementa el valor del servo
          servo5.write(pos4);             
            delay(60);
         break;

     
     //*****PINZAS*****

     case '6':   // Si el valor digitado es k gira a la derecha
         Serial.println(" 'K' Digitado");
         pos5 +=1;  //Incrementa el valor del servo
         servo6.write(pos5);
         delay(100);
     break;

     case 'f':   // Si el valor digitado es l gira a la izquierda
         Serial.println(" 'L' Digitado");
         pos5 -=1;     //Se decrementa el valor del servo
         servo6.write(pos5);
          delay(60);
     break;

     case 'Z':
     Serial.println(" 'Z' Digitado");
        servo1.write(90);
        //servo2.write(pos1);
        servo3.write(90);
        servo4.write(120);
        servo5.write(160);
        servo6.write(90);
     break;

      

  
    }
   }
     

}// CIERA EL VOID LOOP()
