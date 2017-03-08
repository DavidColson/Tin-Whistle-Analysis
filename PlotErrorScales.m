% This is designed to take data from the FourierTransformer file. It graphs
% measurements along a scale and then shows the average and error in each
% measurement

function PlotErrorScales(cellTable, shiftAmount)
    labels = transpose(cellTable(1, 1:8));
    x = linspace(1, 8, 8);
    labels = circshift(labels, shiftAmount);
    
    h = [];
    for K = 1:5
        frequencies = transpose(cell2mat(cellTable(K+1, 1:8)));
        frequencies = circshift(frequencies, shiftAmount);
        labels = circshift(labels, shiftAmount);
        figure(1);
        hold on;
        h(1) = plot(x, frequencies, '-or', 'LineWidth', 2, 'DisplayName', 'Recorded');
        set(gca,'XTickLabel',labels)
    end
   
    avfrequencies = transpose(cell2mat(cellTable(8, 1:8)));
    avfrequencies = circshift(avfrequencies, shiftAmount);
    errors = transpose(cell2mat(cellTable(10, 1:8)));
    errors = circshift(errors, shiftAmount);
    
    h(2) = errorbar(x, avfrequencies, errors, '-ob', 'LineWidth', 2, 'DisplayName', 'Average');
    ylabel('Note Frequency (Hz)');
    title('Recorded Scale for C Whistle with errors');
    legend(h);
end