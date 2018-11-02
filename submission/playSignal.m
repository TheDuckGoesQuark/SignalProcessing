function playSignal(signal, sampleRate)
    durationOfPause = ((1 / sampleRate) * length(signal));
    soundObj = audioplayer(signal, sampleRate);
    play(soundObj);
    pause(durationOfPause)
end