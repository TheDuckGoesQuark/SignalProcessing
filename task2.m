%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TASK 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

filename='malcolm_x_by_any_means1.wav';
[signal, sampleRate] = audioread(filename);

%soundObj = audioplayer(signal, sampleRate);
%play(soundObj);

numberOfSamples = size(signal);
lengthOfSample = 1 / sampleRate;
lengthOfTrack = numberOfSamples * lengthOfSample;

timeAxis = 0:lengthOfSample:lengthOfTrack-lengthOfSample;

figure(1);
plot(timeAxis, signal);

% Audioread, plot, fft,ifft, audioplayer, play, audiowrite, saveas, hist
