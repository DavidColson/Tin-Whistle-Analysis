sound = wavread('H:\Tin Whistle\Recordings Session 2\LowSampleRate Recordings\Key G - Note G Wavy.wav');
x = (sound(:, 1) + sound(:, 2))./2;
Fs = 8000;

segmentLength = round(numel(x)/4.5);
spectrogram(x,round(segmentLength/20),round(50/100*segmentLength/20),[],Fs,'yaxis')

c=colorbar
ylabel(c,'Power/frequency (dB/Hz)');
title('Key G - Note G Wavy Recording');