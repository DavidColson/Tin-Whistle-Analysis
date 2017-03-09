%Whistle Data

% Key - D (Oak D) Whistle
% -------------------------------------------------
rHole = [2.46e-3; 2.94e-3; 2.94e-3; 2.46e-3; 3.51e-3; 3.45e-3];
len = 296.98e-3-33e-3;
wallThickness = 0.52e-3;
radius = 5.91e-3;
    
hp = [152.46e-3, 172.54e-3, 194.62e-3, 217.58e-3, 233.65e-3, 259.11e-3]-33e-3;
    
% 0 means closed, 1 means open
holeStateD = [0; 0; 0; 0; 0; 0];
holeStateE = [0; 0; 0; 0; 0; 1];
holeStateFs = [0; 0; 0; 0; 1; 1];
holeStateG = [0; 0; 0; 1; 1; 1];
holeStateA = [0; 0; 1; 1; 1; 1];
holeStateB = [0; 1; 1; 1; 1; 1];
holeStateCs = [1; 1; 1; 1; 1; 1];
holeStateDh = [1; 0; 0; 0; 0; 0];

temperedScale = [587.33; 
                659.255; 
                739.989; 
                783.991; 
                880; 
                987.767; 
                1108.731; 
                1174.659]

% Key - C Whistle
% -------------------------------------------------
rHole = [2.81e-3; 3.19e-3; 3.19e-3; 2.57e-3; 3.05e-3; 2.93e-3];
len = 328.28e-3-39.3e-3;
wallThickness = 0.38e-3;
radius = 6.82e-3;
    
hp = [162.13e-3, 184.59e-3, 208.71e-3, 232.43e-3, 255.03e-3, 283.21e-3]-39.3e-3;
    
% 0 means closed, 1 means open
holeStateC = [0; 0; 0; 0; 0; 0];
holeStateD = [0; 0; 0; 0; 0; 1];
holeStateE = [0; 0; 0; 0; 1; 1];
holeStateF = [0; 0; 0; 1; 1; 1];
holeStateG = [0; 0; 1; 1; 1; 1];
holeStateA = [0; 1; 1; 1; 1; 1];
holeStateB = [1; 1; 1; 1; 1; 1];
holeStateCh = [1; 0; 0; 0; 0; 0];

temperedScale = [523.251; 
                587.33; 
                659.255; 
                698.456; 
                783.989; 
                880; 
                987.767; 
                1046.502]

% Key - G Whistle
% -------------------------------------------------
rHole = [2.27e-3; 2.6e-3; 2.37e-3; 2.09e-3; 2.7e-3; 2.61e-3];
len = 229.32e-3-40e-3;
wallThickness = 0.38e-3;
radius = 5.21e-3;
    
hp = [120.03e-3; 130.46e-3; 151.67e-3; 167.17e-3; 180.90e-3; 199.87e-3]-40e-3;
    
% 0 means closed, 1 means open
holeStateG = [0; 0; 0; 0; 0; 0];
holeStateA = [0; 0; 0; 0; 0; 1];
holeStateB = [0; 0; 0; 0; 1; 1];
holeStateC = [0; 0; 0; 1; 1; 1];
holeStateD = [0; 0; 1; 1; 1; 1];
holeStateE = [0; 1; 1; 1; 1; 1];
holeStateFs = [1; 1; 1; 1; 1; 1];
holeStateGh = [1; 0; 0; 0; 0; 0];

temperedScale = [783.991; 
                880; 
                987.767; 
                1046.502; 
                1174.659; 
                1318.51; 
                1479.987; 
                1567.982]

% Key - Bb Whistle
% -------------------------------------------------
rHole = [3.21e-3; 3.66e-3; 3.93e-3; 3.15e-3; 4.35e-3; 4.26e-3];
len = 372.98e-3-42e-3;
wallThickness = 0.58e-3;
radius =7.39e-3;
    
hp = [186.81e-3, 212.60e-3, 239.63e-3, 267.61e-3, 288.93e-3, 323.34e-3]-42e-3;
    
% 0 means closed, 1 means open
holeStateBb = [0; 0; 0; 0; 0; 0];
holeStateC = [0; 0; 0; 0; 0; 1];
holeStateD = [0; 0; 0; 0; 1; 1];
holeStateEb = [0; 0; 0; 1; 1; 1];
holeStateF = [0; 0; 1; 1; 1; 1];
holeStateG = [0; 1; 1; 1; 1; 1];
holeStateA = [1; 1; 1; 1; 1; 1];
holeStateBbh = [1; 0; 0; 0; 0; 0];

temperedScale = [466.164; 
                523.251; 
                587.33; 
                622.254; 
                698.456; 
                783.991; 
                880; 
                932.328]

% Key - D (Susato D) Whistle
% -------------------------------------------------
rHole = [2.46e-3; 3.01e-3; 3.01e-3; 2.46e-3; 3.49e-3; 3.47e-3];
len = 294.82e-3;
wallThickness = 1.86e-3;
radius = 6.05e-3;
    
hp = [144.28e-3, 167.17e-3, 189.37e-3, 209.54e-3, 227.61e-3, 254.23e-3];