%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TASK 6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
filename='audio_in_noise.wav';
[signal, sampleFrequency] = audioread(filename);

% Remove noise
signal = bandstop(signal, [7400 7600], sampleFrequency);

[magnitudeAxis, frequencyAxis] = frequencyDomainPlot(signal, sampleFrequency);

% Plotting frequency domain
figure(6)
ax2 = subplot(1,1,1);
plot(frequencyAxis, magnitudeAxis);
xlabel('Frequency (kHz)');
ylabel('Magnitude');
title('Frequency Domain of the worst noise ever once filtered.');
zoom xon;
axis auto;

playSignal(signal, sampleFrequency)
