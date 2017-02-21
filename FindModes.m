% Searches for any solution within the given bounds. 
% Plots of pressure vs distance will be made for every discovered solution

function FindModes(freqLower, freqUpper)
    lambda = 0.026;
    Cp = 1010;
    rho0 = 1.20;
    P0 = 1.01e5;
    gamma = 1.4;
    len = 250e-3;
    wallThickness = 4e-4;
    radius = 6e-3;
    S = pi*radius*radius;

    K0 = gamma*P0;
    alpha = (gamma-1)*(lambda/(rho0*Cp*S))^0.5;
    K = K0*(1-alpha);

    rHole = [2.3e-3; 2.9e-3; 2.6e-3; 2.5e-3; 3.1e-3; 3.1e-3];
    rHolesq = rHole.*rHole;

    % 0 means closed, 1 means open
    holeState = [0; 0; 0; 0; 0; 0];

    test = 1000;
    n = 200;
    dx = len/n;
    freq = freqLower;
    figureCounter = 1;
    
    % We iterate over the domain of frequencies given as function
    % parameters, looking for solutions that satisfy the boundary
    % conditions
    while freq < freqUpper;
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
       if (abs(test) < 1e-4)
           % Frequency Found, plot the result
            pmax = max(P);
            figure(figureCounter);
            plot(x, imag(P)/abs(pmax), x, -imag(P)/abs(pmax));
            title(['Solution for ' num2str(freq) 'Hz']);
            xlabel('distance (m)');
            ylabel('pressure/pmax');
            figureCounter = figureCounter + 1;
            freq = freq + 1; % this prevents the situation where slight variations in the frequency give another solution
       end
    end
end