function signal = builtInBandPass(signal, sampleFrequency, lowerRange, upperRange)
    signal = bandpass(signal, [lowerRange, upperRange], sampleFrequency);
end