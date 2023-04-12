function x = graddescent(obj, grad, x0, num, scale)
	% Conducts naive gradient descent.
	%
	% Inputs:
	%	obj - Objective function handle (output 1x1).
	%	grad - Objective gradient handle (output nx1).
	%	x0 - Initial guess (nx1).
	%	num - Iteration cutoff.
	%	scale - Constant step size scaling factor.
	%
	% Ouptuts:
	%	x - Array of solutions visited (nx(num+1)).
	
	% Get vector size
	n = size(x0, 1);
	
	% Initialize solution array
	x = zeros(n, num+1);
	x(:,1) = x0;
	
	% Carry out gradient descent
	for i = 2:num+1
		x(:,i) = x(:,i-1) - scale*grad(x(:,i-1));
	end
end
