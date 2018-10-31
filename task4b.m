%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TASK 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;

%%%%%%%%%%%%%%%%%%%% Voice File %%%%%%%%%%%%%%%%%%%%%

filename='malcolm_x_by_any_means1.wav';
[signal, sampleFrequency] = audioread(filename);

sampleDuration = 1 / sampleFrequency;
totalDuration = length(signal) * sampleDuration;

signal = builtInBandPass(signal, sampleFrequency, 1000, 2000);

% Calculate frequency domain
fourierTransform = fft(signal);
fourierTransform = fftshift(fourierTransform);
frequencyAxis = sampleFrequency / 2 * linspace(-1, 1, sampleFrequency * totalDuration);

% Produce axis for plotting
magnitudeAxis = abs(fourierTransform);
frequencyAxis = frequencyAxis / 1000;

% Plotting frequency domain
figure(4)
ax2 = subplot(2, 2, 1);
plot(frequencyAxis, magnitudeAxis);
xlabel('Frequency (kHz)');
ylabel('Magnitude');
title('Frequency Domain of my filtered voice');
zoom xon;
zoom(10000);
axis auto;
xlim(ax2, [0 inf]);

% Convert frequency domain back to time domain
signal = ifft(ifftshift(fourierTransform));
timeAxis = 0:sampleDuration:totalDuration-sampleDuration;

ax1 = subplot(2, 2, 2);
plot(timeAxis, signal);
xlabel('Time (s)');
ylabel('Amplitude (m)');
title('Time Domain of filtered voice');
zoom xon;

% playSignal(signal, sampleFrequency, totalDuration)

%%%%%%%%%%%%%%%%%%%% Music File %%%%%%%%%%%%%%%%%%%%%

filename='mii-channel-music.mp3';
[signal, sampleFrequency] = audioread(filename);

signal = trimToSecs(signal, sampleFrequency, 9);
signal = convertToMono(signal);

% Remove frequencies inside of sub band
signal = builtInBandPass(signal, sampleFrequency, 2000, 18000);

sampleDuration = 1 / sampleFrequency;
totalDuration = length(signal) * sampleDuration;

% Calculate frequency domain
fourierTransform = fft(signal);
fourierTransform = fftshift(fourierTransform);
frequencyAxis = sampleFrequency / 2 * linspace(-1, 1, sampleFrequency * totalDuration);

% Produce axis for plotting
magnitudeAxis = abs(fourierTransform);
frequencyAxis = frequencyAxis / 1000;

% Plotting frequency domain
ax2 = subplot(2, 2, 3);
plot(frequencyAxis, magnitudeAxis);
xlabel('Frequency (kHz)');
ylabel('Magnitude');
title('Frequency Domain of filtered Mii Channel Music');
zoom xon;
zoom(10000);
axis auto;
xlim(ax2, [0 5]);

% Convert frequency domain back to time domain
signal = ifft(ifftshift(fourierTransform));
timeAxis = 0:sampleDuration:totalDuration-sampleDuration;

ax1 = subplot(2, 2, 4);
plot(timeAxis, signal);
xlabel('Time (s)');
ylabel('Amplitude (m)');
title('Time Domain of filtered Mii Channel Music');
zoom xon;

playSignal(signal, sampleFrequency, totalDuration)

% Audioread, plot, fft,ifft, audioplayer, play, audiowrite, saveas, hist
