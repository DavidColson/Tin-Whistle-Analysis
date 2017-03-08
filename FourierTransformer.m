% This runs through a specified folder full of recorded notes. It fourier
% transforms each note, and tabulates them all by the note. If multiple
% recordings of each note are present, ended with a number, they'll all be
% tabulated together and an average and standard deviation will be
% calculated. 

% Optionally it also plots out the fourier transforms of each note

function result = FourierTransformer(bShouldPlot)
    fnames = dir('H:\Tin Whistle\Recordings Session 2\Key - C\*.wav');
    numfids = length(fnames);

    Freqs = {};
    nameCache = '';
    columnCounter = 0;
    rowCounter = 1;
    
    for K = 1:numfids
        sound = wavread(strcat('H:\Tin Whistle\Recordings Session 2\Key - C\', fnames(K).name));
        Y = fft(sound, 2048);
        freq = 44100*(0:1023)/2048;
        Py = Y.*conj(Y)/2048;
        [ymax, x] = max(Py(1:1024));
        
        if (bShouldPlot)
            figure(K);
            plot(freq, Py(1:1024));
            title(['Key - D, Note - ' fnames(K).name(1:end-4)]);
            xlabel('Frequency (Hz)');
            ylabel('Power (Watts)');
            xlim([0 0.5e4]);
            
            txt1 = ['\leftarrow peak = ' num2str(freq(x)) 'Hz'];
            text(freq(x),ymax,txt1);
        end
        
        noteName = fnames(K).name(1:length(fnames(K).name)-5);
        if ~strcmp(noteName, nameCache)
            if (columnCounter > 0)
                measures = cell2mat(Freqs(2:6, columnCounter));
                average = sum(measures)/5;
                Freqs{7, columnCounter} = 'Average';
                Freqs{8, columnCounter} = average;
                Freqs{9, columnCounter} = 'Standard Deviation';
                Freqs{10, columnCounter} = std(measures);                
            end
            nameCache = noteName;
            columnCounter = columnCounter + 1;
            Freqs{1, columnCounter} = nameCache;
            rowCounter = 2;
        end

        Freqs{rowCounter, columnCounter} = freq(x);
        rowCounter = rowCounter + 1;
    end
    
    measures = cell2mat(Freqs(2:6, columnCounter));
    average = sum(measures)/5;
    Freqs{7, columnCounter} = 'Average';
    Freqs{8, columnCounter} = average;
    Freqs{9, columnCounter} = 'Standard Deviation';
    Freqs{10, columnCounter} = std(measures);   
    
    result = Freqs;
end
