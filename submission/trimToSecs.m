function signal = timeToSecs(signal, sampleFrequency, secs) 
    sampleDuration = 1 / sampleFrequency;
    numberOfSamples = secs / sampleDuration;
    signal = signal(1:numberOfSamples)';
end
