function WaveFormPlotter()
    sound = wavread('H:\Tin Whistle\Recordings Session 2\LowSampleRate Recordings\Key G - Note G.wav');
    x = (sound(:, 1) + sound(:, 2))./2;
    Fs = 8000;

    time = 0:1/8.000:(length(x)-1)/8.000;
    plot(time, x);

    ylabel('Time (ms)');
    xlabel('Amplitude');
    title('Stable G Recording');
end