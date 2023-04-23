function out = showpath(f, sol, xbounds, ybounds, ct, pt)
	% Displays the results of an iterative NLP solution algorithm.
	%
	% Inputs:
	%	f - Objective function (R2 -> R).
	%	sol - Array of solutions (2xn).
	%	xbounds - x-interval to display (1x2).
	%	ybounds - y-interval to display (1x2).
	%	ct - Chart title.
	%	pt - Additional points to mark (e.g. the exact solution) (2xm).
	
	figure;
	hold on;
	title(ct)
	xlabel("x1")
	ylabel("x2")
	
	% Generate a contour map
	x = linspace(xbounds(1), xbounds(2), 49);
	y = linspace(ybounds(1), ybounds(2), 49);
	z = zeros(length(y), length(x));
	for i = 1:length(y)
		for j = 1:length(x)
			z(i,j) = f([x(j); y(i)]);
		end
	end
	contour(x, y, z, 'b')
	
	% Plot path and points
	plot(sol(1,:), sol(2,:), 'ro-')
	if size(pt, 2) > 0
		plot(pt(1,:), pt(2,:), 'gx')
	end
	
	out = 0;
end
