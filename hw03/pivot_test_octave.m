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

% Print a title line
disp("MAP 4202 Homework 3\n")

% Define the problem
c = [-10; -12; -12; 0; 0; 0];
A = [1, 2, 2, 1, 0, 0;
     2, 1, 2, 0, 1, 0;
     2, 2, 1, 0, 0, 1];
b = [20; 20; 20];

% Define an initial basis and its associated BFS
basis = [4;  5;  6];
x = zeros(length(c), 1);
x(basis) = A(:,basis) \ b;

disp("Initial basis:")
disp(basis')

disp("Initial BFS:")
disp(x')
disp("with cost " + num2str(c'*x) + "\n")

% Perform a pivot and output the results
[basis, x, code] = pivot(basis, x, c, A, b);

if code == 0
    disp("Standard pivot.")
elseif code == 1
    disp("Current solution optimal.")
elseif code == 2
    disp("Optimal cost unbounded.")
end

disp("\nNew basis:")
disp(basis')

disp("New BFS:")
disp(x')

disp("with cost " + num2str(c'*x))
