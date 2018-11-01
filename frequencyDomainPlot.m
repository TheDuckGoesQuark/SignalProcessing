function [magnitudeAxis, frequencyAxis] = frequencyDomainPlot(signal, sampleFrequency)
    nyquistLimit = sampleFrequency / 2;
    fourierTransform = fft(signal);
    fourierTransform = fftshift(fourierTransform);
    magnitudeAxis = abs(fourierTransform(length(fourierTransform) / 2 : length(fourierTransform)));
    frequencyAxis = nyquistLimit * linspace(0, 1, length(magnitudeAxis));
end