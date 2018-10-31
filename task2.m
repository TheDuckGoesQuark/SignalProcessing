%%%%%%%%%%%%%%%%%%%% Voice File %%%%%%%%%%%%%%%%%%%%%

filename='malcolm_x_by_any_means1.wav';
[signal, sampleFrequency] = audioread(filename);

sampleDuration = 1 / sampleFrequency;
totalDuration = length(signal) * sampleDuration;
timeAxis = 0:sampleDuration:totalDuration-sampleDuration;

% Plotting time domain
figure(2)
ax1 = subplot(2, 1, 1);
plot(timeAxis, signal);
xlabel('Time (s)');
ylabel('Amplitude (m)');
title('Time Domain of my voice');
zoom xon;

playSignal(signal, sampleFrequency, totalDuration);

%%%%%%%%%%%%%%%%%%%% Music File %%%%%%%%%%%%%%%%%%%%%

filename='mii-channel-music.mp3';
[signal, sampleFrequency] = audioread(filename);

signal = trimToSecs(signal, sampleFrequency, 9);
signal = convertToMono(signal);

sampleDuration = 1 / sampleFrequency;
totalDuration = length(signal) * sampleDuration;
timeAxis = 0:sampleDuration:totalDuration-sampleDuration;

% Plotting time domain
ax1 = subplot(2, 1, 2);
plot(timeAxis, signal);
xlabel('Time (s)');
ylabel('Amplitude (m)');
title('Time Domain of Mii Channel Music');
zoom xon;

playSignal(signal, sampleFrequency, totalDuration);

