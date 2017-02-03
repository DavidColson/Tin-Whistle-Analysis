   % This solves a given initial value problem. The solution may not satisfy
    % boundary conditions however and so this is used elsewhere to find a
    % solution for given boundary conditions
    function [X, P, U] = Solve(n, dx, params, initP, initU)
        hp = [147.6e-3; 168e-3; 191.2e-3; 213.2e-3; 230.9e-3; 255.9e-3]-30e-3;
        
        % Pre Allocate space for these before the loop
        internalP = zeros(1, n+1);
        internalP(1) = initP;
        internalU = zeros(1, n+1);
        internalU(1) = initU;
        internalX = zeros(1, n+1);
        dx2 = dx/2;
        
        % we loop n times, n defining the number of steps in the finite
        % value problem
        for i =2:n+1
           internalX(i) = (i-1)*dx;
           
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
               Y = params.Y0+(params.Yclosed(hole)+params.Yopen(hole));
               Z = params.Z0+(params.Zclosed(hole));
           else
               Y = params.Y0;
               Z = params.Z0;
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