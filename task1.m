%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TASK 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% To plot and generate a sound, we need a sample frequency and a duration.
% Sample frequency must be at least double the maximum frequency of the
% signal.
middleCFreq = 261.6;

sampleFrequency = 48*10^3; % Sample rate used in high quality music
sampleDuration = 1 / sampleFrequency;
totalDuration = 2;
timeAxis = 0:sampleDuration:totalDuration-sampleDuration;


% w = 2.pi.f
% y = A.sin(w.t+theta)
signal = sin(2*pi*middleCFreq*timeAxis);

%soundObj = audioplayer(amplitudeAxis, sampleFrequency);
%play(soundObj);

% Plotting time domain
figure(1)
ax1 = subplot(2, 1, 1);
plot(timeAxis, signal);
xlabel('Time (s)');
ylabel('Amplitude (m)');
title('Time Domain of Middle C');
zoom xon;
zoom(100);

% Calculate frequency domain
fourierTransform = fft(signal);
fourierTransform = fftshift(fourierTransform);

magnitudeAxis = abs(fourierTransform);
frequencyAxis = abs(sampleFrequency / 2 * linspace(-1, 1, sampleFrequency * 2));

% Plotting frequency domain
ax2 = subplot(2, 1, 2);
plot(frequencyAxis, magnitudeAxis);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Domain of Middle C');
zoom xon;
zoom(10000);
axis auto;
xlim(ax2, [0 300]);

