function [ X_normal, mu, sigma ] = featureNormalize( X )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

X_normal = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X,2));

mu = mean(X);   % mean value
sigma = std(X); % standard deviation

X_normal = ( X - repmat(mu, size(X, 1), 1) ) ./ repmat(sigma, size(X, 1), 1);


end

