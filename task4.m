%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TASK 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;

%%%%%%%%%%%%%%%%%%%% Voice File %%%%%%%%%%%%%%%%%%%%%

filename='malcolm_x_by_any_means1.wav';
[signal, sampleFrequency] = audioread(filename);

sampleDuration = 1 / sampleFrequency;
totalDuration = length(signal) * sampleDuration;

% Calculate frequency domain
fourierTransform = fft(signal);
fourierTransform = fftshift(fourierTransform);

frequencyAxis = sampleFrequency / 2 * linspace(-1, 1, sampleFrequency * totalDuration);
fourierTransform = filterSubBand(fourierTransform, frequencyAxis, 0, 1000);
magnitudeAxis = abs(fourierTransform);
frequencyAxis = frequencyAxis / 1000;


% Plotting frequency domain
figure(3)
ax2 = subplot(2, 1, 1);
plot(frequencyAxis, magnitudeAxis);
xlabel('Frequency (kHz)');
ylabel('Magnitude');
title('Frequency Domain of my voice');
zoom xon;
zoom(10000);
axis auto;
xlim(ax2, [0 inf]);

%%%%%%%%%%%%%%%%%%%% Music File %%%%%%%%%%%%%%%%%%%%%

filename='mii-channel-music.mp3';
[signal, sampleFrequency] = audioread(filename);

signal = trimToSecs(signal, sampleFrequency, 9);
signal = convertToMono(signal);

sampleDuration = 1 / sampleFrequency;
totalDuration = length(signal) * sampleDuration;

% Calculate frequency domain
fourierTransform = fft(signal);
fourierTransform = fftshift(fourierTransform);
magnitudeAxis = abs(fourierTransform);
frequencyAxis = sampleFrequency / 2 * linspace(-1, 1, sampleFrequency * totalDuration);
frequencyAxis = frequencyAxis / 1000;

% Plotting frequency domain
ax2 = subplot(2, 1, 2);
plot(frequencyAxis, magnitudeAxis);
xlabel('Frequency (kHz)');
ylabel('Magnitude');
title('Frequency Domain of Mii Channel Music');
zoom xon;
zoom(10000);
axis auto;
xlim(ax2, [0 5]);
    

% Audioread, plot, fft,ifft, audioplayer, play, audiowrite, saveas, hist
