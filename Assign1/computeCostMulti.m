function J = computeCostMulti( X, Y, theta )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

m = length(Y); % number of training examples

J = 0;

J = sum((X * theta - Y) .^ 2) / ( 2 * m );


end
