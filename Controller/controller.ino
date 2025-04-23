void setup() {
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(2, INPUT_PULLUP);
  pinMode(3, INPUT_PULLUP);
  pinMode(4, INPUT_PULLUP);
  pinMode(5, INPUT_PULLUP);
  pinMode(6, INPUT_PULLUP);
  pinMode(7, INPUT_PULLUP);
  Serial.begin(9600);
}

const double deadzone = 0.03;



void loop() {
  int x = analogRead(A0);
  int y = analogRead(A1);
  int swa = analogRead(A2);
  int a  = digitalRead(2);
  int b = digitalRead(3);
  int c = digitalRead(4);
  int d = digitalRead(5);
  int e = digitalRead(6);
  int f = digitalRead(7);
  int sw = (swa <= 2 ? 1 : 0);
  double xd = (x - 512.0) / 512.0;
  double yd = (y - 512.0) / 512.0;
  xd = (xd > 0.03  xd < -0.03) ? xd : 0;
  yd = (yd > 0.03  yd < -0.03) ? yd : 0;

  Serial.println(String(yd) + " " + String(-xd)+ " " + String(sw) + " " + String(-a + 1) + " " + String(-b + 1) + " " + String(-c + 1) + " " + String(-d + 1) + " " + String(-e + 1) + " " + String(-f + 1));
  delay(6);
}
