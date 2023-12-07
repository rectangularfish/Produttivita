void genVisualizer() {

  fill(accent2);




  rectMode(CENTER);
  rect(1300, height/2, 515, 515, 50);


  fill(accent1);


  textAlign(LEFT);
  textSize(60);
  text("Music:" + " " + currentMusicString, 1100, height/2 - 150);



  fft.forward(currentMusic.mix);
  fill(accent1);

  for (int i = 0; i < numBands; i++) {
    float rawValue = fft.getBand(i) * 20;
    float smoothingFactor = 0.1;
    smoothedBandValues[i] = lerp(smoothedBandValues[i], rawValue, smoothingFactor);

    float x = map(i, 0, numBands, 1100, 1500);

    // Apply limits to the circle size
    float circleSize = constrain(smoothedBandValues[i], 0, maxCircleSize);

    ellipse(x, height/2, 7, circleSize);
  }
}
