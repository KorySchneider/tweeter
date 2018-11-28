import ddf.minim.*;

Minim minim;
AudioPlayer[] shortChirps;
AudioPlayer[] longChirps;

int numLongSounds = 15;
int numShortSounds = 16;

void initSoundFiles() {
  shortChirps = new AudioPlayer[numShortSounds];
  for (int i=1; i <= numShortSounds; i++) {
    shortChirps[i-1] = minim.loadFile("short" + i + ".mp3");
  }

  longChirps = new AudioPlayer[numLongSounds];
  for (int i=1; i <= numLongSounds; i++) {
    longChirps[i-1] = minim.loadFile("long" + i + ".mp3");
  }
}

void playRandomShortChirp() {
  int index = floor(random(numShortSounds));
  AudioPlayer chirp = shortChirps[index];
  chirp.setPan(random(2) - 1);
  chirp.loop(0);
}

void playRandomLongChirp() {
  int index = floor(random(numLongSounds));
  AudioPlayer chirp = longChirps[index];
  chirp.setPan(random(2) - 1);
  chirp.loop(0);
}
