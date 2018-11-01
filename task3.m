%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TASK 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;

%%%%%%%%%%%%%%%%%%%% Voice File %%%%%%%%%%%%%%%%%%%%%

filename='malcolm_x_by_any_means1.wav';
[signal, sampleFrequency] = audioread(filename);

% Calculate frequency domain
[magnitudeAxis, frequencyAxis] = frequencyDomainPlot(signal, sampleFrequency);
frequencyAxis = frequencyAxis / 1000;

% Plotting frequency domain
figure(3)
ax2 = subplot(2, 1, 1);
plot(frequencyAxis, magnitudeAxis);
xlabel('Frequency (kHz)');
ylabel('Magnitude');
title('Frequency Domain of my voice');
zoom xon;
axis auto;

%%%%%%%%%%%%%%%%%%%% Music File %%%%%%%%%%%%%%%%%%%%%

filename='mii-channel-music.mp3';
[signal, sampleFrequency] = audioread(filename);

signal = trimToSecs(signal, sampleFrequency, 9);
signal = convertToMono(signal);

% Calculate frequency domain
[magnitudeAxis, frequencyAxis] = frequencyDomainPlot(signal, sampleFrequency);
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
    
