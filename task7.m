%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TASK 7 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;

%%%%%%%%%%%%%%%%%%%% Voice File %%%%%%%%%%%%%%%%%%%%%

filename='myvoice.wav';
[signal, sampleFrequency] = audioread(filename);
signal = convertToMono(signal);

sampleDuration = 1 / sampleFrequency;
totalDuration = sampleDuration * length(signal);

durationOfFrame = 0.5;
numberOfFrames = ceil(totalDuration / durationOfFrame);
sizeOfFrame = durationOfFrame / sampleDuration;

frames = zeros(numberOfFrames, sizeOfFrame);

signalIndex = 1;
for frameIndex = 1:numberOfFrames
    for sampleIndex = 1:sizeOfFrame
        if (length(signal) == signalIndex) 
            break
        end
        frames(frameIndex, sampleIndex) = signal(signalIndex);
        signalIndex = signalIndex + 1;
    end
end

% Generate scrambling matrix
scramblingMatrix = 1:numberOfFrames;
scramblingMatrix = scramblingMatrix(randperm(length(scramblingMatrix)));

scrambledSignal = [];
for entry = scramblingMatrix
    scrambledSignal = vertcat(scrambledSignal, frames(entry, :)');
end

% Make signals same length
signal = [signal; zeros(length(scrambledSignal) - length(signal),1)];

totalDuration = sampleDuration * length(signal);
timeAxis = 0:sampleDuration:totalDuration-sampleDuration;

% Plotting time domain
fig1 = figure(1);
ax1 = subplot(2, 1, 1);
plot(timeAxis, signal);
xlabel('Time (s)');
ylabel('Amplitude (m)');
title('Time Domain of my voice');
zoom xon;

ax2 = subplot(2, 1, 2);
plot(timeAxis, scrambledSignal);
xlabel('Time (s)');
ylabel('Amplitude (m)');
title('Time Domain of my scrambled voice');
zoom xon;

playSignal(scrambledSignal, sampleFrequency);
saveas(fig1, "scrambled.png", "png");

% Restore the signal using the key
