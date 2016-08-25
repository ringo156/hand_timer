
#include <ESP8266WiFi.h>
#include <WiFiUdp.h>
#include <Time.h>
#include <TimeLib.h>
#include <Wire.h>
#include "skI2CLCDlib.h"
#include <Ticker.h>
#include <Servo.h>
#include <stdio.h>
Ticker ticker;
Servo servo;
skI2CLCDlib LCD(0x3E,16) ;
bool readyForTicker = false;
bool servoFlag = false;
bool endFlag = false;
const int servoPin = 5;
char val[16];
int8_t hourOld;

char ssid[] = "********";  //  your network SSID (name)
char pass[] = "********";  // your network password

unsigned int localPort = 2390;      // local port to listen for UDP packets

/* Don't hardwire the IP address or we won't get the benefits of the pool.
 *  Lookup the IP address for the host name instead */
//IPAddress timeServer(129, 6, 15, 28); // time.nist.gov NTP server
IPAddress timeServerIP; // time.nist.gov NTP server address
const char* ntpServerName = "time.nist.gov";

const int NTP_PACKET_SIZE = 48; // NTP time stamp is in the first 48 bytes of the message

byte packetBuffer[ NTP_PACKET_SIZE]; //buffer to hold incoming and outgoing packets

// A UDP instance to let us send and receive packets over UDP
WiFiUDP udp;

void setReadyForTicker() {
  // フラグを立てるだけ
  readyForTicker = true;
}

void doBlockingIO() {
  // TODO 定期的に行いたい通信とかファイル読み書き
  if(servoFlag == true)
  {
    servo_step();
    if(endFlag == true)
    {
      servoFlag = false;
      endFlag = false;
    }
  }
  // フラグを落とす
  readyForTicker = false;
}

void setup() {
  Serial.begin(115200);
  Serial.println();
  Serial.println();

  // We start by connecting to a WiFi network
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, pass);
  
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  Serial.println("Starting UDP");
  udp.begin(localPort);
  Serial.print("Local port: ");
  Serial.println(udp.localPort());

  //LCD
  Wire.begin(4, 14);//sda,slc
  LCD.Init(LCD_NOT_ICON,32,LCD_VDD3V) ;
  LCD.SetCursor(0,0);
  LCD.Puts("HelloWorld!");

  int cb;
  while(1)
  {
    //get a random server from the pool
    WiFi.hostByName(ntpServerName, timeServerIP); 
    sendNTPpacket(timeServerIP); // send an NTP packet to a time server
    // wait to see if a reply is available
    delay(3000);
    
    cb = udp.parsePacket();
    if (!cb) {
      Serial.println("no packet yet");
    }
    else
    {
      break;
    }
  }
    Serial.print("packet received, length=");
    Serial.println(cb);
    // We've received a packet, read the data from it
    udp.read(packetBuffer, NTP_PACKET_SIZE); // read the packet into the buffer

    //the timestamp starts at byte 40 of the received packet and is four bytes,
    // or two words, long. First, esxtract the two words:

    unsigned long highWord = word(packetBuffer[40], packetBuffer[41]);
    unsigned long lowWord = word(packetBuffer[42], packetBuffer[43]);
    // combine the four bytes (two words) into a long integer
    // this is NTP time (seconds since Jan 1 1900):
    unsigned long secsSince1900 = highWord << 16 | lowWord;
    Serial.print("Seconds since Jan 1 1900 = " );
    Serial.println(secsSince1900);

    // now convert NTP time into everyday time:
    Serial.print("Unix time = ");
    // Unix time starts on Jan 1 1970. In seconds, that's 2208988800:
    const unsigned long seventyYears = 2208988800UL;
    // subtract seventy years:
    unsigned long epoch = secsSince1900 - seventyYears;
    // print Unix time:
    Serial.println(epoch);

    Serial.println();
    // Timeライブラリに時間を設定(UNIXタイム)し日本標準時にあわせる。＋9時間
    setTime(epoch + (9 * 60 * 60));
    Serial.print("JST is ");
    Serial.print(year());
    Serial.print('/');
    Serial.print(month());
    Serial.print('/');
    Serial.print(day());
    Serial.print(' ');
    Serial.print(hour());
    Serial.print(':');
    Serial.print(minute());
    Serial.print(':');
    Serial.println(second());
    Serial.println();
  hourOld = hour();
  
  // 1 秒ごとに setReadyForTicker() を呼び出す
  ticker.attach_ms(100, setReadyForTicker);
  // ミリ秒単位も指定出来ます
  // ticker.attach_ms(60000, setReadyForTicker);
  LCD.Clear();
}

void loop() {
  if (readyForTicker) {
    doBlockingIO();
  }
  //更新
 if(hourOld != hour())
 {
  servoFlag = true;
  hourOld = hour();
 }
  LCD.SetCursor(0,0);
  sprintf(val,"%4d/%2d/%2d",year(), month(), day());
  LCD.Puts(val);
  LCD.SetCursor(0,1);
  sprintf(val,"%2d : %2d : %2d", hour(), minute(), second());
  LCD.Puts(val);
}

void servo_step()
{
  static uint8_t count = 1;
  static uint8_t servo_step = 0;
  static uint8_t limit = 0;
  count++;
  if(servo_step == 0)
  {
    servo.attach(servoPin);
    servo.write(110);
    limit = 3;
  }
  else if(servo_step == 1)
  {
    servo.detach();
    limit = 10;
  }
  else if(servo_step == 2)
  {
    servo.attach(servoPin);
    servo.write(60);
    limit = 5;
  }
  else if(servo_step == 3)
  {
     servo.detach();
     limit = 10;
  }
  else if(servo_step == 4)
  {
    servo.attach(servoPin);
    servo.write(110);
    limit = 3;
  }
  else if(servo_step == 5)
  {
    servo.detach();
    endFlag = true;
      servo_step = 0;
      limit = 0;
      count = 1;
  }
  if(limit == count)
  {
      servo_step++;
      count = 0;
  }
}

// send an NTP request to the time server at the given address
unsigned long sendNTPpacket(IPAddress& address)
{
  Serial.println("sending NTP packet...");
  // set all bytes in the buffer to 0
  memset(packetBuffer, 0, NTP_PACKET_SIZE);
  // Initialize values needed to form NTP request
  // (see URL above for details on the packets)
  packetBuffer[0] = 0b11100011;   // LI, Version, Mode
  packetBuffer[1] = 0;     // Stratum, or type of clock
  packetBuffer[2] = 6;     // Polling Interval
  packetBuffer[3] = 0xEC;  // Peer Clock Precision
  // 8 bytes of zero for Root Delay & Root Dispersion
  packetBuffer[12]  = 49;
  packetBuffer[13]  = 0x4E;
  packetBuffer[14]  = 49;
  packetBuffer[15]  = 52;

  // all NTP fields have been given values, now
  // you can send a packet requesting a timestamp:
  udp.beginPacket(address, 123); //NTP requests are to port 123
  udp.write(packetBuffer, NTP_PACKET_SIZE);
  udp.endPacket();
}
