function signal = convertToMono(signal)
    signal = sum(signal, 2) / size(signal, 2);
end