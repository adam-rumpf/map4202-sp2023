%=============================================================================
% MAP 4202: Optimization Theory
% Fall 2023
%
% Homework 06
% MATLAB
%
% [[Name]]
% 04/09/2023
%=============================================================================

% Print a title line
disp("MAP 4202 Homework 6" + newline)

% Read the data files
ndata = csvread("nodes.csv");
adata = csvread("arcs.csv");
m = size(ndata, 1); % number of nodes
n = size(adata, 1); % number of arcs

% Construct the network parameter arrays
b = ndata(:,2); % supply values
tail = adata(:,2); % arc tails
head = adata(:,3); % arc heads
c = adata(:,4); % flow costs
u = adata(:,5); % flow capacities

% Construct the node-arc incidence matrix
A = zeros(m, n);

%##############################################################################
%# FILL IN YOUR CODE HERE
%#
%# By the end of this block of code the array A should represent the node-arc
%# incidence matrix of the network.
%##############################################################################

% Solve the network flows problem
[x, obj] = linprog(c, [], [], A, b, zeros(n,1), u);

% Display the results
disp("Optimal flow:")
for i=1:n
	disp(" x(" + num2str(head(i)) + ',' + num2str(tail(i)) + ") = " + ...
		num2str(x(i)))
end
disp("Flow cost: " + num2str(obj))

% Expected output:
%
% Optimal flow:
%  x(2,1) = 1
%  x(3,1) = 3
%  x(4,2) = 4
%  x(4,3) = 0
%  x(5,3) = 3
%  x(5,4) = 4
% Flow cost: 52
