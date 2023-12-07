void genVisualizer() {

  
  
  // background of the music visualizer
  fill(accent2);
  rectMode(CENTER);
  rect(1300, height/2, 515, 515, 50);
  fill(accent1);
  
  
  // display current music user is listening to
  textAlign(LEFT);
  textSize(60);
  text("Music:" + " " + currentMusicString, 1100, height/2 - 150);


  // perform fft analysis on the current music
  fft.forward(currentMusic.mix);

 for (int i = 0; i < numBands; i++) {
    // calculate the raw amplitude value for the current frequency band
    float rawValue = fft.getBand(i) * 20;

    float smoothingFactor = 0.1;

    // smooth the amplitude values
    smoothedBandValues[i] = lerp(smoothedBandValues[i], rawValue, smoothingFactor);

    // map the x-coordinate based on the frequency band index
    float x = map(i, 0, numBands, 1100, 1500);

    // apply limits to the circle size to prevent it from being too large
    float circleSize = constrain(smoothedBandValues[i], 0, maxCircleSize);

    // draw an ellipse representing the amplitude at the current frequency band
    ellipse(x, height/2, 7, circleSize);
  }
}
