%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TASK 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;

%%%%%%%%%%%%%%%%%%%% Voice File %%%%%%%%%%%%%%%%%%%%%

filename='myvoice.wav';
[signal, sampleFrequency] = audioread(filename);

% Calculate frequency domain
[magnitudeAxis, frequencyAxis] = frequencyDomainPlot(signal, sampleFrequency);
frequencyAxis = frequencyAxis / 1000;

% Plotting frequency domain
fig3 = figure(3);
ax1 = subplot(2, 1, 1);
plot(frequencyAxis, magnitudeAxis);
xlabel('Frequency (kHz)');
ylabel('Magnitude');
title('Frequency Domain of my voice');
zoom xon;
axis auto;
xlim(ax1, [0 7]);

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
axis auto;
xlim(ax2, [0 7]);

% saveas(fig3, "figure3.png", "png")
    
