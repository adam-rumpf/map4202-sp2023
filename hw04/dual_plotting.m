%=============================================================================
% MAP 4202: Optimization Theory
% Fall 2023
%
% Homework 4
% MATLAB
%
% [[Name]]
% 03/02/2023
%=============================================================================

% Print a title line
disp("MAP 4202 Homework 4" + newline)

% Define the interval of dual variables to use
num = 101; % number of dual variables to use
dualvars = linspace(-3,3,num);

% Generate a list of random primal solution vectors in the box [-1,1]x[-1,1]
vectors = 2*rand(100,2)-1;

%=============================================================================
% Part 1: Plot the Relaxed Objective for One Primal Solution
%=============================================================================

x = vectors(1,:)'; % first solution vector
obj = zeros(num,1); % relaxed objective values
for i=1:num
    obj(i) = lagrangian(dualvars(i), x);
end

% Print information about this specific solution
disp("Chosen solution vector x =")
disp(x)
disp("Penalty term value b-h(x) =")
disp(1-x(1)-x(2))

% Plot objective versus penalty cost
figure
plot(dualvars, obj)
title("Relaxed Objective for One Fixed Primal Solution")
xlabel("penalty cost")
ylabel("relaxed objective")

%=============================================================================
% Part 2: Plot the Relaxed Objective for Many Primal Solutions
%=============================================================================

objlist = zeros(num,size(vectors,1)); % table of relaxed objective values
for i=1:num
    for j=1:size(vectors,1)
        objlist(i,j) = lagrangian(dualvars(i), vectors(j,:)');
    end
end

% Plot all objectives versus penalty cost
figure
plot(dualvars, objlist)
title("Relaxed Objective for Many Different Primal Solutions")
xlabel("penalty cost")
ylabel("relaxed objective")

%=============================================================================
% Part 3: Plot the Minimum of the Relaxed Objective over All Primal Solutions
%=============================================================================

objmin = zeros(num,1); % minimum dual objective over all primal solutions
for i=1:num
    objmin(i) = min(objlist(i,:));
end

% Plot dual objective versus penalty cost
figure
plot(dualvars, objmin)
title("Relaxed Objective")
xlabel("penalty cost")
ylabel("relaxed objective")

%=============================================================================

function y = lagrangian(p, x)
    % Evaluates the Lagrangian relaxation of the primal nonlinear program
    %
    %   min  x(1)^2 + x(2)^2
    %   s.t. x(1)   + x(2)  = 1
    %           -1 <= x(1) <= 1
    %           -1 <= x(2) <= 1
    %
    % Inputs:
    %   p - penalty cost scalar
    %   x - 2x1 primal solution vector
    %
    % Output:
    %   The value of the relaxed objective with primal solution x and
    %   penalty cost p.
    
    % Compute relaxed objective
    y = x(1)^2 + x(2)^2 + p*(1 - x(1) - x(2));
end
