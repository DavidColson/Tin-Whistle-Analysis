% Simply plots the waveform of a given sound file

function WaveFormPlotter()
    sound = wavread('H:\Tin Whistle\Recordings Session 2\FrequencyJump Recordings\Key D - Note D 2.wav');
    x = (sound(:, 1) + sound(:, 2))./2;
    Fs = 8000;

    time = 0:1/8000:(length(x)-1)/8000;
    plot(time, x);

    xlabel('Time (s)');
    ylabel('Amplitude');
end