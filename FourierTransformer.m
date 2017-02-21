fnames = dir('H:\Tin Whistle\Recordings\Scales\Key - C\*.wav');
numfids = length(fnames);

for K = 1:numfids
    sound = wavread(strcat('H:\Tin Whistle\Recordings\Scales\Key - C\', fnames(K).name));
    Y = fft(sound, 2048);
    freq = 44100*(0:1023)/2048;
    Py = Y.*conj(Y)/2048;
    
    figure(K);
    plot(freq, Py(1:1024));
    title(['Key - D, Note - ' fnames(K).name(1:end-4)]);
    xlabel('Frequency (Hz)');
    ylabel('Power (Watts)');
    xlim([0 0.5e4]);
    
    [ymax, x] = max(Py(1:1024))
     txt1 = ['\leftarrow peak = ' num2str(freq(x)) 'Hz'];
     text(freq(x),ymax,txt1)
end
