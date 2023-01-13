%=============================================================================
% MAP 4202: Optimization Theory
% Fall 2023
%
% Homework 1
% MATLAB
%
% [[Name]]
% 01/15/2023
%=============================================================================

% Print a title line
disp("MAP 4202 Homework 1\n")

%=============================================================================
% Part 2: Evaluating a batch of solutions to a standard form LP
%=============================================================================

% Define a cost (column) vector, the constraint matrix, and the requirement
% (column) vector
c = [-1.1; -1.0; 3.2; 2.8; 3.2; 9.3];
A = [-9.4,  5.8, -1.2, -6.6,  4.3,  8.8;
	 -7.7, -9.4,  8.2,  0.9,  5.6,  6.9;
	 10.0,  1.4,  0.7, -2.8, -0.2,  1.7];
b = [85.7; -40.3; 14.1];

% Read vector table as an array
vectors = csvread("vector_list.csv");

% Initialize best known objective and solution
best_obj = Inf;
best_sol = zeros(6, 1);

% ############################################################################
% #
% # INSERT YOUR CODE HERE
% #
% # Apply your check_solution to every solution defined in vector_list.csv.
% #
% # At the end of this section, best_sol should be the best solution vector
% # defined in vector_list.csv, and best_obj should be its cost.
% #
% ############################################################################

% Display the best known solution
disp("Best known solution:")
disp(best_sol)
disp(["Best objective value: ", num2str(best_obj)])

%=============================================================================
% Part 1: A function for evaluating a solution to a standard form LP
%=============================================================================

% Note: In MATLAB, function definitions must be placed at the end of a script.

function obj = check_solution(c, A, b, x)
    % Checks a given solution x for a standard form linear program
    %   min  c'x
    %   s.t.  Ax  = b
    %          x >= 0
    %
    % Inputs:
    %   c - nx1 cost vector
    %   A - mxn constraint matrix
    %   b - mx1 requirement vector
    %   x - nx1 solution vector
    %
    % Output:
    %   If x is feasible, then its objective value is returned.
    %   If not, then Inf is returned.
    
    % Validate dimensions of inputs
    [m, n] = size(A); % m = number of rows, n = number of columns
    if size(c, 1) ~= n || size(c, 2) ~= 1
        error("cost vector must be nx1")
    elseif size(b, 1) ~= m || size(b, 2) ~= 1
        error("requirement vector must be mx1")
    elseif size(x, 1) ~= n || size(b, 2) ~= 1
        error("solution vector must be nx1")
    end
	
	% Initialize objective value
	obj = Inf;
    
% ############################################################################
% #
% # INSERT YOUR CODE HERE
% #
% # At the end of this function, obj should equal the cost of the solution if
% # it's feasible or Inf if it's not.
% #
% ############################################################################
end
