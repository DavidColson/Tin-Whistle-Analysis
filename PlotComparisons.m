% This is designed to take data from the FourierTransformer file. It graphs
% measurements along a scale and then shows the average and error in each
% measurement

function PlotComparisons(recordedCellData, shiftAmount)
    simulatedData = [580.72;
                    624.97;
                    691.72;
                    740.81;
                    836.26;
                    942.8;
                    1089.63;
                    1159.62];

    knownData = [587.33; 
                659.255; 
                739.989; 
                783.991; 
                880; 
                987.767; 
                1108.731; 
                1174.659];
     
    % Valid for C Whistle Scale
    sideal = zeros(8, 1)
    sideal(1) = simulatedData(1);
    sideal(2) = sideal(1)*(1.06)^2;
    sideal(3) = sideal(2)*(1.06)^2;
    sideal(4) = sideal(3)*(1.06)^1;
    sideal(5) = sideal(4)*(1.06)^2;
    sideal(6) = sideal(5)*(1.06)^2;
    sideal(7) = sideal(6)*(1.06)^2;
    sideal(8) = sideal(7)*(1.06)^1;
    
    labels = transpose(recordedCellData(1, 1:8));
    x = linspace(1, 8, 8);
    labels = circshift(labels, shiftAmount);
    
    figure(1);
    hold on;
    h(1) = plot(x, simulatedData, '-ob', 'LineWidth', 2, 'DisplayName', 'Simulated');
    
    hold on;
    h(2) = plot(x, knownData, '-ok', 'LineWidth', 2, 'DisplayName', 'Tempered Scale');
    
    hold on;
    h(3) = plot(x, sideal, '-oc', 'LineWidth', 2, 'DisplayName', 'Ideal Simulated Scale');
    
    % Plot average of recorded values with error bars
    avfrequencies = transpose(cell2mat(recordedCellData(8, 1:8)));
    avfrequencies = circshift(avfrequencies, shiftAmount);
    errors = transpose(cell2mat(recordedCellData(10, 1:8)));
    errors = circshift(errors, shiftAmount);
    h(3) = errorbar(x, avfrequencies, errors, '-or', 'LineWidth', 2, 'DisplayName', 'Average');
    
    set(gca,'XTickLabel',labels)
    xlim([1, 8]);
    ylabel('Note Frequency (Hz)');
    title('Comparing with Ideal Semitone Note Ratios (Bb)');
    legend(h);
    hold off;
end