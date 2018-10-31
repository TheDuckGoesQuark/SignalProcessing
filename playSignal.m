function playSignal(signal, sampleRate, durationOfPause)
    soundObj = audioplayer(signal, sampleRate);
    play(soundObj);
    pause(durationOfPause)
end