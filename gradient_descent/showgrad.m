function out = showgrad(f, fp, sol)
	% Displays the solution and gradient values of a sequence of solutions.
	%
	% Inputs:
	%	f - Objective function (R2 -> R).
	%	fp - Gradient function (R2 -> R2).
	%	sol - Array of solutions (2xn).
	
	n = size(sol, 2);
	
	% Generate objective plot
	figure;
	obj = zeros(n, 1);
	for i = 1:n
		obj(i) = f(sol(:,i));
	end
	plot(1:n, obj, 'o')
	title("Objective Value")
	xlabel("Iteration")
	ylabel("f(x)")
	
	% Generate gradient magnitude plot
	figure;
	grad = zeros(n, 1);
	for i = 1:n
		grad(i) = norm(fp(sol(:,i)));
	end
	plot(1:n, grad, 'o')
	title("Gradient Magnitude")
	xlabel("Iteration")
	ylabel("|f(x)|")
	
	out = 0;
end
