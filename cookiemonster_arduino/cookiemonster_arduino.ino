int sensorPin = A0;    // potentiometer
int ledPin = 13;      // led
int sensorValue = 0;  // value coming from the sensor

void setup() {
  pinMode(ledPin, OUTPUT);  
  Serial.begin(9600);
}

void loop() {

  sensorValue = analogRead(sensorPin);  
  
  int input = Serial.read(); 
  
  if(input == 1){
  digitalWrite(ledPin, HIGH);  
  delay(1000);
  }else{
  digitalWrite(ledPin, LOW);   
  }

  Serial.println(analogRead(A0)); 
  delay(50);
}

