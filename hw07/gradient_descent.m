%=============================================================================
% MAP 4202: Optimization Theory
% Fall 2023
%
% Homework 7
% MATLAB
%
% [[Name]]
% 04/24/2023
%=============================================================================

function xnext = gradient_descent(x, xprev, f, grad, iter)
    % Conducts one iteration of gradient descent.
    %
    % Inputs:
    %   x (nx1) - Current solution vector.
    %   xprev (nx1) - Previous solution vector.
    %   f (Rn->R) - Objective function.
    %   grad (Rn->Rn) - Gradient of objective function.
    %   iter - Iteration number.
    %
    % Outputs:
    %   xnext (nx1) - Next solution vector.
    
    xnext = x;
    
    % Conduct the gradient descent update
    
    %#########################################################################
    %# FILL IN YOUR CODE HERE
    %#
    %# Code a variant of the gradient descent update. After this block of code
    %# the variable xnext should equal the next solution.
    %#
    %# Your update must make use of the current solution x and the gradient
    %# function grad(x). You may optionally make use of the previous solution
    %# xprev, the objective function f(x), and the iteration number iter.
    %#
    %# You may not simply use a constant step size gamma. Your gradient descent
    %# algorithm must somehow adapt its step size using the above inputs.
    %#########################################################################
end
