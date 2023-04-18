% This is the driver for your gradient_descent.m script. Do not edit its
% contents. You do not need to attach this file with your submission.

% Print a title line
disp("MAP 4202 Homework 7" + newline)

% Define the objective function and its gradient
f = @(x) sin(x(1)+x(2)) + (x(1)-x(2))^2 - 1.5*x(1) + 2.5*x(2) + 1;
grad = @(x) [cos(x(1)+x(2)) + 2*(x(1)-x(2)) - 1.5;
             cos(x(1)+x(2)) - 2*(x(1)-x(2)) + 2.5];

% Define the gradient descent parameters
x0 = [0; 0]; % initial solution
maxiter = 100; % maximum iteration cutoff
epsilon = 0.01; % gradient magnitude cutoff

% Initialize the solution vector
x = zeros(2, maxiter);
x(:,1) = x0;

% Carry out gradient descent
i = 1; % iteration number
best_sol = x0; % best known solution
best_obj = f(x0); % best known objective
while (i <= maxiter) && (norm(grad(x(:,i))) > epsilon)
    % Conduct the gradient descent update
    if (i > 1)
        x(:,i+1) = gradient_descent(x(:,i), x(:,i-1), f, grad, i);
    else
        x(:,i+1) = gradient_descent(x(:,i), x(:,i), f, grad, i);
    end
    
    % Update best solution and objective
    obj = f(x(:,i+1));
    if obj < best_obj
        best_obj = obj;
        best_sol = x(:,i+1);
    end
    
    % Increment iteration count
    i = i+1;
end

% Clip unused array indices
x = x(:,1:i);

% Report results
err = norm(grad(x(:,i)));
disp("Terminated after " + num2str(i-1) + " iterations with |f'(x)| = " ...
    + num2str(err))
if (err <= epsilon)
    disp("|f'(x)| tolerance reached.")
else
    disp("Iteration cutoff reached.")
end
disp(newline + "Best objective: " + num2str(best_obj))
disp("Best solution:")
for i = 1:length(best_sol)
    disp(" x(" + num2str(i) + ") = " + num2str(best_sol(i)))
end

% Display search path

xbounds = [-3, 3];
ybounds = [-3, 3];

figure
hold on
axis equal
xlabel("x1")
ylabel("x2")

xlist = linspace(xbounds(1), xbounds(2), 49);
ylist = linspace(ybounds(1), ybounds(2), 49);
zlist = zeros(length(ylist), length(xlist));
for i = 1:length(ylist)
	for j = 1:length(xlist)
		zlist(i,j) = f([xlist(j); ylist(i)]);
	end
end
contour(xlist, ylist, zlist, 'b')

plot(x(1,:), x(2,:), 'ro-')
plot(best_sol(1), best_sol(2), 'go')
