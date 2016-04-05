function [ X_normal, mu, sigma ] = featureNormalize( X )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

X_normal = X;
mu = zeros(1, size(X, 2));  %mean value ��ֵ
sigma = zeros(1, size(X, 2));   %standard deviation ��׼��

mu = mean(X);
sigma = std(X);

X_normal = (X - repmat(mu, size(X, 1), 1)) ./ repmat(sigma, size(X, 1), 1); % x_i = (x_i - mu) / sigma , for each x

end

