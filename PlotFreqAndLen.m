%Searches for fundamentals for a given whistle length and then plots the
%fundamentals against whistle length

function PlotFreqAndLen()
    lambda = 0.026;
    Cp = 1010;
    rho0 = 1.20;
    P0 = 1.01e5;
    gamma = 1.4;

    rHole = [2.46e-3; 2.94e-3; 2.94e-3; 2.46e-3; 3.51e-3; 3.45e-3];
    wallThickness = 0.52e-3;
    radius = 5.91e-3;
    
     % 0 means closed, 1 means open
    holeState = [0; 0; 0; 0; 0; 0];
    
    S = pi*radius*radius;
    K0 = gamma*P0;
    alpha = (gamma-1)*(lambda/(rho0*Cp*S))^0.5;
    K = K0*(1-alpha);
    rHolesq = rHole.*rHole;
    
    n = 200;
    lengths = linspace(50e-3, 450e-3, 50);
    
    % create a vector of whistle lengths
    % for loop over all the lenghts, searching for the first solution. Once
    % found stop and store the found freq, 
    % repeat for all lengths
    freqs = [];
    for len = lengths
        dx = len/n;
        freq = 50;
        test = 1000;
        
        while abs(test) > 1e-4;
           freq = freq + 0.01;

           % Calculate the coefficients for the given frequency and pack them
           % up ready to give the solver
           Zc = -freq*0.2927*sqrt(-1)*rho0*wallThickness/(radius^4);
           Yc = sqrt(-1)*2*pi*pi*freq*wallThickness/K;
           Yo = 1/(2.8*rho0*freq*sqrt(-1));
           params = struct('Zclosed', Zc*(rHolesq.*(1-holeState)),...
                           'Yclosed', Yc*(rHolesq.*(1-holeState)),...
                           'Yopen', Yo*(rHole.*holeState),...
                           'Z0', 2*dx*sqrt(-1)*pi*freq*rho0/S,...
                           'Y0', 2*dx*sqrt(-1)*pi*freq*S/K);

           % The solver gives us arrays for the 3 variables in the system
           [x, P, U] = Solve(n, dx, params, 0, 1);

           % This checks the corrected pressure at the end of the whistle to
           % ensure it's what we want out of a solution
           test = P(n+1) - (sqrt(-1)*1.2266*rho0*freq*U(n+1)/radius);
           test = test/max(P);
        end
        freqs = [freqs freq];
        % Frequency Found, save it and move on to next length
        disp(['Found freq: ' num2str(freq) ' At length: ' num2str(len)]);
    end
    
    plot(lengths, freqs);
    title('Fundamental Frequency for Different Whistle Lengths');
    xlabel('Whistle length (m)');
    ylabel('Fundamental Frequency (Hz)');
end