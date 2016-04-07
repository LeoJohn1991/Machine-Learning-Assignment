function [J, grad] = costFunction( X, Y, theta )
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost

% Init some useful values
m = length(Y); %number of trainig examples
J = 0; % the cost 
grad = zeros(size(theta)); % gradient for each theta

J = -1 * sum( Y .* log( sigmoid(X * theta) ) + (1 - Y) .* log(1 - sigmoid(X * theta) ) ) / m;

grad = ( X' * (sigmoid(X * theta) - Y) ) / m;


end

