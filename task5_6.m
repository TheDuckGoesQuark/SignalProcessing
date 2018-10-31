%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TASK 5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;

%%%%%%%%%%%%%%%%%%%% Voice File %%%%%%%%%%%%%%%%%%%%%

filename='audio_in_noise.wav';
[signal, sampleFrequency] = audioread(filename);

sampleDuration = 1 / sampleFrequency;
totalDuration = length(signal) * sampleDuration;
timeAxis = 0:sampleDuration:totalDuration-sampleDuration;

% Calculate frequency domain
fourierTransform = fft(signal);
fourierTransform = fftshift(fourierTransform);
frequencyAxis = sampleFrequency / 2 * linspace(-1, 1, sampleFrequency * totalDuration);

% Produce axis for plotting
magnitudeAxis = abs(fourierTransform);
frequencyAxis = frequencyAxis / 1000;

% Plotting frequency domain
figure(6)
ax1 = subplot(2,1,1);
plot(frequencyAxis, magnitudeAxis);
xlabel('Frequency (kHz)');
ylabel('Magnitude');
title('Frequency Domain of the worst noise ever.');
zoom xon;
zoom(10000);
axis auto;
xlim(ax1, [0 inf]);

%playSignal(signal, sampleFrequency, totalDuration);

% Demon noise at 7500 Hz.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TASK 6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
filename='audio_in_noise.wav';
[signal, sampleFrequency] = audioread(filename);

sampleDuration = 1 / sampleFrequency;
totalDuration = length(signal) * sampleDuration;
timeAxis = 0:sampleDuration:totalDuration-sampleDuration;

% fourierTransform = customBandPass(fourierTransform, frequencyAxis*1000, 0, 7000);
signal = builtInBandPass(signal, sampleFrequency, 1, 500);

% Calculate frequency domain
fourierTransform = fft(signal);
fourierTransform = fftshift(fourierTransform);
frequencyAxis = sampleFrequency / 2 * linspace(-1, 1, sampleFrequency * totalDuration);

% Produce axis for plotting
magnitudeAxis = abs(fourierTransform);
frequencyAxis = frequencyAxis / 1000;

% Plotting frequency domain
ax2 = subplot(2,1,2);
plot(frequencyAxis, magnitudeAxis);
xlabel('Frequency (kHz)');
ylabel('Magnitude');
title('Frequency Domain of the worst noise ever once filtered.');
zoom xon;
zoom(10000);
axis auto;
xlim(ax2, [0 inf]);

% Convert frequency domain back to time domain
signal = ifft(ifftshift(fourierTransform));

playSignal(signal, sampleFrequency, totalDuration)

