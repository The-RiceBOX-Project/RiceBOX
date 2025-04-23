void setup() {
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(2, INPUT_PULLDOWN);
  pinMode(3, INPUT_PULLDOWN);
  pinMode(4, INPUT_PULLDOWN);
  pinMode(5, INPUT_PULLDOWN);
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
  int sw = (swa <= 2 ? 1 : 0);
  double xd = (x - 512.0) / 512.0;
  double yd = (y - 512.0) / 512.0;
  xd = (xd > 0.03 || xd < -0.03) ? xd : 0;
  yd = (yd > 0.03 || yd < -0.03) ? yd : 0;

  Serial.print(String(xd) + " " + String(yd)+ " " + String(sw) + " " + String(a) + " " + String(b) + " " + String(c) + " " + String(d));
  delay(6);
}
