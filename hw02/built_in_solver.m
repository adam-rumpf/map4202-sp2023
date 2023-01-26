%=============================================================================
% MAP 4202: Optimization Theory
% Fall 2023
%
% Homework 02
% MATLAB
%
% [[Name]]
% 02/05/2023
%=============================================================================

% Print a title line
disp("MAP 4202 Homework 2" + newline)

%=============================================================================
% Part 1: Solving a small-scale LP
%=============================================================================

% Initialize the solution and objective value
sol = zeros(3, 1); % solution vector
obj = Inf; % minimum cost

%#############################################################################
%#
%# FILL IN YOUR CODE HERE
%#
%# Solve the given linear program using MATLAB's built-in LP solver, linprog.
%#
%# This will require you to define every component of your LP model, including
%# every element of the cost vector, the constraint matrix, and the
%# requirement vector. You may also need to specify the directions of the
%# inequality constraints (depending on how exactly you defined your LP).
%#
%# You will definitely want to consult the online documentation to see how the
%# linprog function works:
%#	<https://www.mathworks.com/help/optim/ug/linprog.html>
%#
%# By the end of this block of code, sol and obj should equal the optimal
%# solution and its cost, respectively.
%#
%#############################################################################

% Display the results
disp("Part 1")
disp("Best solution:")
disp(sol)
disp("at cost " + num2str(obj))

% Expected output:
%
% Part 1
% Best solution:
%    6
%    2
%    0
% at cost 10

%=============================================================================
% Part 2: Minimizing a piecewise linear convex function
%=============================================================================

% Read data as an array and get its length
data = csvread("line_data.csv");
m = size(data, 1); % number of data points
c = data(:,1); % vector of line slopes
d = data(:,2); % vector of line intercepts

% Initialize the components of the solution
x = 0; % optimal x-value
obj = Inf; % optimal cost

%#############################################################################
%#
%# FILL IN YOUR CODE HERE
%#
%# Solve the given linear program using MATLAB's built-in LP solver, linprog.
%#
%# By the end of this block of code, x and obj should equal the optimal
%# solution and its cost, respectively. Note that, since this LP includes two
%# decision variables (x and z), you'll need to assign one of its two
%# elements to the variable x initialized above.
%#
%#############################################################################

% Display the results
disp(newline + "Part 2")
disp("The minimum value is " + num2str(obj))
disp("It occurs at x = " + num2str(x))

% Expected output:
%
% Part 2
% The minimum value is 5.9145
% It occurs at x = 1.1884
