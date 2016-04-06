function acc_rate = computeAccuracyRate( X, Y, theta, mu, sigma)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%   X,Y is test data
%   mu is the means value of training data for normalize,
%   sigma is the standard deviation

% normalize X
m = length(Y); %size of test data;
X_normal = (X - repmat(mu, m, 1)) ./ repmat(sigma, m, 1); 

% Add intercept term to X, (x_0 = 1)
X_normal = [ones(m, 1) X_normal];

acc_rate = sum( (X_normal * theta - Y) .^ 2 ) / m;


end

