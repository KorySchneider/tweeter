int dot = 150; // milliseconds

void blinkLong() {
  //port.write('H');
  delay(dot * 3);
  //port.write('L');
  delay(dot);
}

void blinkShort() {
  //port.write('H');
  delay(dot);
  //port.write('L');
  delay(dot);
}

void blinkSpace() {
  //port.write('L');
  delay(dot * 7);
}

// Call blinkLong() and blinkShort() based on pattern string
void blinkPattern(String pattern) {
  for (int i = 0; i < pattern.length(); i++) {
    if (pattern.charAt(i) == 'S') {
      playRandomShortChirp();
      blinkShort();
    } else if (pattern.charAt(i) == 'L') {
      playRandomLongChirp();
      blinkLong();
    }
  }
}

// Call blinkPattern() for alphanumeric chars or blinkSpace() for whitespace
void blinkChar(char c) {
  print(c);

  // Whitespace
  if (Character.isWhitespace(c)) {
    blinkSpace();
    return;
  }

  if (Character.isLetterOrDigit(c)) {
    int code = c - '0';

    // Numbers
    if (code >= 0 && code <= 9) {
      String pattern = numbers[code];
      blinkPattern(pattern);
      return;
    }

    // Alphabet
    if (code >= 17 && code <= 42) {
      String pattern = alphabet[code - 17];
      blinkPattern(pattern);
      return;
    }
  }
}

// Call blinkChar() on each char in tweet
void blinkTweet(String tweet) {
  for (int i = 0; i < tweet.length(); i++) {
    char c = tweet.charAt(i);
    if (Character.isLetterOrDigit(c) || Character.isWhitespace(c)) {
      blinkChar(c);
    }
  }
  println("\n\n");
}
