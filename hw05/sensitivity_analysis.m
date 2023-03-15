%=============================================================================
% MAP 4202: Optimization Theory
% Fall 2023
%
% Homework 5
% MATLAB
%
% [[Name]]
% 03/26/2023
%=============================================================================

% Print a title line
disp("MAP 4202 Homework 5" + newline)

% By default, MATLAB's linprog function prints a completion message every
% time it successfully arrives at a solution. This can clutter the terminal
% in applications that require calling linprog many times within a loop,
% which is the case in this lab (and is likely to be the case in your final
% project).
% The "options" variable defined below can be fed to linprog as an optional
% 8th argument
%   linprog(f,A,b,Aeq,beq,lb,ub,options)
% to suppress the completion messages.
options = optimoptions('linprog', 'Display', 'none');

% Define number of values to test
num = 51;

% Define the initial LP
A = [-6, 10, 20, 11;
    4, 17, -8, 16];
c = [1; 2; 8; 5];
b = [3; 3];

%=============================================================================
% Part 1
%=============================================================================

% Define an array of c1 values
c1 = linspace(-10, 5, num);

% Solve the problem for every c1 value
cost_obj = zeros(num,1);
cost_x1 = zeros(num,1);
%##############################################################################
%#
%# Fill in your code here.
%#
%# Solve the linear program
%#     min  c'x
%#     s.t.  Ax  = b
%#            x >= 0
%# repeatedly using the A, c, and b defined above, but with the first
%# component of the cost vector taking every value in the array c1 defined
%# above. After each solution, store the optimal cost in cost_obj and the
%# optimal value of x1 in cost_x1.
%#
%# At the end of this block of code cost_obj(i) and cost_x1(i) should equal
%# the optimal cost and optimal first component of the solution vector
%# resulting from setting the first component of the cost vector to c1(i).
%#
%##############################################################################

% Plot objective versus c1
figure
plot(c1, cost_obj)
title("Objective versus c(1)")
xlabel("c(1)")
ylabel("objective")

% Plot x1 versus unit c1
figure
plot(c1, cost_x1)
title("x(1)* versus c(1)")
xlabel("c(1)")
ylabel("x(1)*")

%=============================================================================
% Part 2
%=============================================================================

% Define an array of b1 values
b1 = linspace(-4, 4, num);

% Solve the problem for every b1 value
requirement_obj = zeros(num,1);
%##############################################################################
%#
%# Fill in your code here.
%#
%# Solve the linear program
%#     min  c'x
%#     s.t.  Ax  = b
%#            x >= 0
%# repeatedly using the A, c, and b defined above, but with the first
%# component of the requirement vector taking every value in the array b1
%# defined above. After each solution, store the optimal cost in
%# requirement_obj.
%#
%# At the end of this block of code requirement_obj(i) should equal the
%# optimal cost of the solution vector resulting from setting the first
%# component of the requirement vector to b1(i).
%#
%##############################################################################

% Plot objective versus b1
figure
plot(b1, requirement_obj)
title("Objective versus b(1)")
xlabel("b(1)")
ylabel("objective")
