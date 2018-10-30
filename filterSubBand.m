function fourierTransform = filterSubBand(fourierTransform, frequencyAxis, lowerRange, upperRange)
    frequencyAxis(frequencyAxis <= lowerRange) = 0;
    frequencyAxis(frequencyAxis >= upperRange) = 0;
    frequencyAxis(frequencyAxis ~= 0) = 1;
    fourierTransform = fourierTransform * frequencyAxis;
    pause(1);
end