%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TASK 6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
filename='audio_in_noise.wav';
[signal, sampleFrequency] = audioread(filename);
signal = convertToMono(signal);

% Generate noise as signal
totalDuration = (1 / sampleFrequency) * length(signal);
[5*noiseSignal, timeAxis] = generateSignal(7500, sampleFrequency, totalDuration);

% Remove noise
signal = signal - noiseSignal';

[magnitudeAxis, frequencyAxis] = frequencyDomainPlot(signal, sampleFrequency);
[noiseMagnitudeAxis, noiseFrequencyAxis] = frequencyDomainPlot(noiseSignal, sampleFrequency);

% Plotting frequency domain
figure(6)
ax1 = subplot(1,1,1);
plot(frequencyAxis, magnitudeAxis);
xlabel('Frequency (kHz)');
ylabel('Magnitude');
title('Frequency Domain of the worst noise ever once filtered.');
zoom xon;
axis auto;

hold on
plot(noiseFrequencyAxis, noiseMagnitudeAxis);
hold off

playSignal(signal, sampleFrequency)


