%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TASK 6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
filename='audio_in_noise.wav';
[signal, sampleFrequency] = audioread(filename);


% Generate noise as signal
% totalDuration = (1 / sampleFrequency) * length(signal);
% [noiseSignal, timeAxis] = generateSignal(7500, sampleFrequency, totalDuration);

% Remove noise
signal = lowpass(signal, 4000, sampleFrequency);

signal = convertToMono(signal);
sampleDuration = 1 / sampleFrequency;
totalDuration = sampleDuration * length(signal);
timeAxis = 0:sampleDuration:totalDuration-sampleDuration;

[magnitudeAxis, frequencyAxis] = frequencyDomainPlot(signal, sampleFrequency);
frequencyAxis = frequencyAxis / 1000;

% Plotting frequency domain
fig6a = figure(6);
ax2 = subplot(2,1,2);
plot(frequencyAxis, magnitudeAxis);
xlabel('Frequency (kHz)');
ylabel('Magnitude');
title('Frequency Domain of the worst noise ever with bandstop applied.');
zoom xon;
axis auto;

% Plotting time domain
ax1 = subplot(2, 1, 1);
plot(timeAxis, signal);
xlabel('Time (s)');
ylabel('Amplitude (m)');
title('Time Domain of audio in noise with bandstop applied.');
zoom xon;

playSignal(signal, sampleFrequency)
saveas(fig6a, "figure6b.png", "png")

