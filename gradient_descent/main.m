% A driver script for displaying the path followed by an iterative NLP solver.
%
% This is the main driver for a collection of script files that should be
% placed in the same directory, including:
%	showpath.m
%	graddescent.m

f1 = @(x) 0.125*x'*[2, 1; 1, 3]*x - [2, -1]*x;
fp1 = @(x) 0.25*[2, 1; 1, 3]*x - [2; -1];
exact1 = [28/5; -16/5];

sols1 = graddescent(@(x) f1(x), @(x) fp1(x), [-2; -1], 20, 1.0);
showpath(@(x) f1(x), sols1, [-3, 7], [-6, 4], "Gradient Descent", exact1);
showgrad(@(x) f1(x), @(x) fp1(x), sols1);

%==============================================================================

f2 = @(x) 0.5*x'*[2, 1; 1, 20]*x - [5, 3]*x;
fp2 = @(x) [2, 1; 1, 20]*x - [5; 3];
exact2 = [97/39; 1/39];

%sols2 = graddescent(@(x) f2(x), @(x) fp2(x), [-3; -1], 10, 1.0);
%showpath(@(x) f(x), sols2, [-4, 4], [-2, 2], "Gradient Descent, theta = 1.0", exact2);
%showgrad(@(x) f2(x), @(x) fp2(x), sols2);
