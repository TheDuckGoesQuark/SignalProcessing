function [signal, timeAxis] = generateSignal(frequency, sampleFrequency, totalDuration)
    sampleDuration = 1 / sampleFrequency;
    timeAxis = 0:sampleDuration:totalDuration-sampleDuration;

    % w = 2.pi.f
    % y = A.sin(w.t+theta)
    signal = sin(2*pi*frequency*timeAxis);
end