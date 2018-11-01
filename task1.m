%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TASK 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;

% To plot and generate a sound, we need a sample frequency and a duration.
% Sample frequency must be at least double the maximum frequency of the
% signal.
middleCFreq = 261.6;

sampleFrequency = 48*10^3; % Sample rate used in high quality music
sampleDuration = 1 / sampleFrequency;
totalDuration = 10;
[signal, timeAxis] = generateSignal(middleCFreq, sampleFrequency, totalDuration);

% Plotting time domain
fig1 = figure(1)
ax1 = subplot(2, 1, 1);
plot(timeAxis, signal);
xlabel('Time (s)');
ylabel('Amplitude (m)');
title('Time Domain of Middle C');
zoom xon;
zoom(100);

[magnitudeAxis, frequencyAxis] = frequencyDomainPlot(signal, sampleFrequency);

% Noted, reducing the duration of the sound decreases the accuracy of the
% fft

% Plotting frequency domain
ax2 = subplot(2, 1, 2);
plot(frequencyAxis, magnitudeAxis);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Domain of Middle C');
zoom xon;
axis auto;
xlim(ax2, [0, 300]);

playSignal(signal, sampleFrequency);

% saveas(fig1, "figure1.png", "png");

