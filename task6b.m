%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TASK 6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
filename='audio_in_noise.wav';
[signal, sampleFrequency] = audioread(filename);


% Generate noise as signal
% totalDuration = (1 / sampleFrequency) * length(signal);
% [noiseSignal, timeAxis] = generateSignal(7500, sampleFrequency, totalDuration);

% Remove noise
signal = lowpass(signal, 4000, sampleFrequency);

[magnitudeAxis, frequencyAxis] = frequencyDomainPlot(signal, sampleFrequency);

% Plotting frequency domain
figure(6)
ax1 = subplot(1,1,1);
plot(frequencyAxis, magnitudeAxis);
xlabel('Frequency (kHz)');
ylabel('Magnitude');
title('Frequency Domain of the worst noise ever once filtered.');
zoom xon;
axis auto;

playSignal(signal, sampleFrequency)


