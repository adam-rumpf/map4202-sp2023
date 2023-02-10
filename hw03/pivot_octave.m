%=============================================================================
% MAP 4202: Optimization Theory
% Fall 2023
%
% Homework 3
% MATLAB
%
% [[Name]]
% 02/19/2023
%=============================================================================

% ############################################################################
% # The following function definition includes a variety of blanks labeled:
% #
% #      ### FILL IN CODE HERE ###
% #
% # Fill in your own code in these spaces to complete an implementation of
% # the simplex algorithm as defined in ILO pp. 90-91.
% ############################################################################

function [basis, x, code] = pivot(basis, x, c, A, b)
    % Performs a single simplex pivot and returns the new basis.
    %
    % Required inputs:
    %	basis - mx1 vector of basic indices
    %   x - nx1 basic feasible solution associated with the given basis
    %	c - nx1 cost vector
    %   A - mxn constraint matrix
    %   b - mx1 requirement vector
    %
    % Outputs:
    %   basis - the updated simplex basis
    %   code - a numerical exit code to indicate the outcome of the pivot:
    %       0 - successful pivot in a direction of cost decrease
    %       1 - current solution optimal
    %       2 - cost unbounded
    %
    % This algorithm performs one full iteration of the naive
    % implementation of the simplex method, as described in ILO pp. 90-91.
    %
    % If a successful pivot takes place, then the new basis is returned. If
    % the algorithm is meant to terminate (either due to the current
    % solution being optimal or due to the cost being unbounded), then no
    % edits are made and the original basis is returned.
    
    % Get array sizes and validate dimensions of inputs
    [m, n] = size(A); % m = number of rows, n = number of columns
    if size(c, 1) ~= n || size(c, 2) ~= 1
        error("cost vector must be nx1")
    elseif size(b, 1) ~= m || size(b, 2) ~= 1
        error("requirement vector must be mx1")
    end
    
    % Initialize return code
    code = 0; % indicator of the pivot's results
    
    % Step 1: At the beginning of an iteration, we have the current basis
    % and we can compute the basis matrix and the associated basic feasible
    % solution.
    
    % Define the basis matrix [A_B(1) ... A_B(m)]
    B = % ### FILL IN CODE HERE TO COMPUTE B ###
    
    % Step 2: Compute the reduced costs.
    %
    % If all reduced costs are nonnegative, then the current solution is
    % optimal. Otherwise we choose a nonbasic variable with a negative
    % reduced cost to enter the basis.
    
    % Compute the reduced cost vector
    cbar = % ### FILL IN CODE HERE TO COMPUTE cbar ###
    
    % If all reduced costs are nonnegative, terminate with exit code 1
    if all(cbar >= 0)
        code = 1;
        return;
    end
    
    % Otherwise choose an index j for the entering variable
    j = -1; % initialize index of entering variable
    % ### FILL IN CODE HERE TO COMPUTE j ###
    
    % Step 3: Compute the pivot column u.
    %
    % If no component of u is positive, then the optimal cost is unbounded.
    
    u = % ### FILL IN CODE HERE TO COMPUTE u ###
    
    % If all components of u are nonpositive, terminate with exit code 2
    if all(u <= 0)
        code = 2;
        return;
    end
    
    % Step 4: Compute the step size theta.
    %
    % Compute the ratio x_B(i)/u_i for all basic variables with a positive
    % pivot element u_i. The step size is the minimum of these ratios.
    
    theta = Inf; % initialize step size
    % ### FILL IN CODE HERE TO COMPUTE theta ###
    
    % Step 5: Find a leaving variable and perform the change of basis.
    %
    % Find which basic variable minimizes the ratio x_B(i)/u_i. That
    % variable leaves the basis, after which we can generate the new basis
    % and its associated BFS.
    
    % Find the minimizing index
    ell = -1;
    for i = 1:m
        if abs(x(basis(i))/u(i) - theta) < 0.0001
            ell = i;
            break;
        end
    end
    
    % Update the BFS
    % ### FILL IN CODE HERE TO UPDATE THE SOLUTION VECTOR x ###
    
    % Update the basis
    % ### FILL IN CODE HERE TO UPDATE THE BASIC INDEX ARRAY basis ###
end
