   % Same as the normal solver, but this one can deal with a varying radius
   % along the length of the whistle. It's slower as it needs to
   % recalculate coefficients as it runs through the solution
   
   % Params should be include terms that involve the radius, they will be
   % done during the execution of the solver
   % RadiusFunc should be a function that takes the distance to the top of
   % the whistle and returns the radius
    function [X, P, U] = VarRadiusSolve(n, dx, params, radiusFunc, initP, initU)
        
        % Hole positions, specific to each whistle
        % Note that this is kept in this file for for performance reasons
        % since it needs to be accessed frequently
        hp = [247.97e-3, 224.26e-3, 208.24e-3, 184.41e-3, 163.15e-3, 138.99e-3];
        
        % Pre Allocate space for these before the loop
        internalP = zeros(1, n+1);
        internalP(1) = initP;
        internalU = zeros(1, n+1);
        internalU(1) = initU;
        internalX = zeros(1, n+1);
        dx2 = dx/2;
        
        lambda = 0.026;
        Cp = 1010;
        rho0 = 1.20;
        P0 = 1.01e5;
        gamma = 1.4;
        K0 = gamma*P0;
        
        % we loop n times, n defining the number of steps in the finite
        % value problem
        for i =2:n+1
           internalX(i) = (i-1)*dx;
           
           S = pi*radiusFunc(internalX(i))^2;
           alpha = (gamma-1)*(lambda/(rho0*Cp*S))^0.5;
           K = K0*(1-alpha);
           
           Zclosed = (params.Zclosed)./(radiusFunc(internalX(i))^4);
           Yclosed = (params.Yclosed)./K;
           Z0 = (params.Z0)/(pi*radiusFunc(internalX(i))^2);
           Y0 = (params.Y0)*(pi*radiusFunc(internalX(i))^2)/K;
           
           % This checks if the current timestep is underneath a hole, if
           % it is hole is the ID number of the hole, otherwise it's -1
           hole = -1;
           for j = 1:6
               if ((hp(j)-dx2) < internalX(i) && internalX(i) < (hp(j)+dx2))
                   hole = j;
                   break;
               end
           end 
            
           % Correct the coefficients if we're underneath a hole
           if (hole > 0)
               Y = Y0+(Yclosed(hole)+params.Yopen(hole));
               Z = Z0+(Zclosed(hole));
           else
               Y = Y0;
               Z = Z0;
           end
           
           % The two steps of second order runga kutta
           Phalf = internalP(i-1) - 0.5*internalU(i-1)*Z;
           Uhalf = internalU(i-1) - 0.5*internalP(i-1)*Y;
           internalP(i) = internalP(i-1) - Uhalf*Z;
           internalU(i) = internalU(i-1) - Phalf*Y;
        end
       
        P = internalP;
        U = internalU;
        X = internalX;
    end