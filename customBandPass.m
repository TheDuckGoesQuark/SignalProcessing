% Custom filter function, removes all frequencies inside of the given band
function fourierTransform = customBandPass(fourierTransform, frequencyAxis, lowerRange, upperRange)
    frequencyAxis(frequencyAxis > 0 & (frequencyAxis <= lowerRange | frequencyAxis >= upperRange)) = 0;
    frequencyAxis(frequencyAxis < 0 & (frequencyAxis <= -upperRange | frequencyAxis >= -lowerRange)) = 0;
    frequencyAxis(frequencyAxis ~= 0) = 1;
    fourierTransform = fourierTransform .* frequencyAxis';
end