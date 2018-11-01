%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TASK 5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;

%%%%%%%%%%%%%%%%%%%% Voice File %%%%%%%%%%%%%%%%%%%%%

filename='audio_in_noise.wav';
[signal, sampleFrequency] = audioread(filename);

[magnitudeAxis, frequencyAxis] = frequencyDomainPlot(signal, sampleFrequency);

% Plotting frequency domain
figure(6)
plot(frequencyAxis, magnitudeAxis);
xlabel('Frequency (kHz)');
ylabel('Magnitude');
title('Frequency Domain of the worst noise ever.');
zoom xon;
zoom(10000);
axis auto;

playSignal(signal, sampleFrequency);

% Demon noise at 7500 Hz.