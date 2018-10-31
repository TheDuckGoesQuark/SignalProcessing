% Custom filter function, removes all frequencies inside of the given band
function fourierTransform = filterSubBand(fourierTransform, frequencyAxis, lowerRange, upperRange)
    frequencyAxis(frequencyAxis >= lowerRange & frequencyAxis <= upperRange) = 0;
    frequencyAxis(frequencyAxis <= -lowerRange & frequencyAxis >= -upperRange) = 0; % Imaginary values? -_-
    frequencyAxis(frequencyAxis ~= 0) = 1;
    fourierTransform = fourierTransform .* frequencyAxis';
end