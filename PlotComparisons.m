% This is designed to take data from the FourierTransformer file. It graphs
% measurements along a scale and then shows the average and error in each
% measurement

function PlotComparisons(recordedCellData, shiftAmount)
    simulatedData = [473.67;
                    539.07;
                    613.27;
                    665.36;
                    757.27;
                    864.46;
                    991.48;
                    1000.2];
                
    knownData = [466.164; 
                523.251; 
                587.33; 
                622.254; 
                698.456; 
                783.991; 
                880; 
                932.328];

    labels = transpose(recordedCellData(1, 1:8));
    x = linspace(1, 8, 8);
    labels = circshift(labels, shiftAmount);
    
    figure(1);
    hold on;
    h(1) = plot(x, simulatedData, '-ob', 'LineWidth', 2, 'DisplayName', 'Simulated');
    
    hold on;
    h(2) = plot(x, knownData, '-ok', 'LineWidth', 2, 'DisplayName', 'Tempered Scale');
    
    % Plot average of recorded values with error bars
    avfrequencies = transpose(cell2mat(recordedCellData(8, 1:8)));
    avfrequencies = circshift(avfrequencies, shiftAmount);
    errors = transpose(cell2mat(recordedCellData(10, 1:8)));
    errors = circshift(errors, shiftAmount);
    h(3) = errorbar(x, avfrequencies, errors, '-or', 'LineWidth', 2, 'DisplayName', 'Average');
    
    set(gca,'XTickLabel',labels)
    xlim([1, 8]);
    ylabel('Note Frequency (Hz)');
    title('Recorded Scale for Bb Whistle with errors');
    legend(h);
    hold off;
end