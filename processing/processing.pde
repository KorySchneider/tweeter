/*
 * To blink an LED in sync with chirps, uncomment
 * serial/port lines in this file and MorseLogic.pde
*/

//import processing.serial.*;
import twitterp.*;
import twitter4j.*;

TwitterAPI api;
//Serial port;

ArrayList<String> tweets;
boolean readyForTweet = true;

void setup() {
  size(200, 200);
  frameRate(10);

  //port = new Serial(this, Serial.list()[0], 115200);

  minim = new Minim(this);
  initSoundFiles();

  tweets = new ArrayList<String>(2); // current and next tweet

  api = new TwitterAPI(this,
    "consumerKey",
    "consumerSecret",
    "accessToken",
    "accessTokenSecret");

  api.filter("discuss", "converse", "argue", "communicate");
  println('\n');
}

void draw() {
  // Send tweet if done blinking last one
  if (tweets.size() > 0) {
    String tweet = tweets.remove(0).toUpperCase();
    blinkTweet(tweet);
  }
}

void onStatus(Status status) {
  // Only worry about English non-retweets
  if (status.getLang().equals("en") && !status.getText().startsWith("RT")) {
    // Store tweet
    if (tweets.size() < 2) {
      tweets.add(status.getText());
    }
  }
}
