function [ theta, J_history ] = gradientDescentMulti( X, Y, theta, alpha, num_iters )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

m = length(Y); % number of training examples
J_history = zeros(num_iters, 1);

for iter =  1:num_iters
    %fprintf('size(X) = [%d %d]\nsize(Y) = [%d %d]\n',size(X), size(Y));
    %fprintf('size(X*theta - Y) = [%d %d]\nsize(X;) = [%d %d]\n',size(X * theta - Y), size(X'));
    theta = theta - (alpha / m ) * X' * (X * theta - Y);
    J_history(iter) = computeCostMulti(X, Y, theta); %save the cost J in every iteration
    
end

