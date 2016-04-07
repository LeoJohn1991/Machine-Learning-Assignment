%% Machine Learning - Exercise 2: Logistic Regression


%% Initialization
clear; close all; clc

%% Load Data

[digit, txt, raw] = xlsread('psydata.xlsx');  %load data

%select tow features, FVC and Jump. the Label is gender.

featuresRange = [4 6];
trainSize = 2000;   %size of training sample
X = digit(1:trainSize, featuresRange);
Y = digit(1:trainSize, 1);
%origin y is gender, male(y=1),female(y=2)
Y( find(Y==2) ) = 0;  %let female(y=0) for convenience


%% ============== Part 1: Plotting ==============
fprintf('Plotting data:\nfemale(y=0) symol o and male(y=1) symol + \n');

plotData(X, Y, [1 2]); % plot with origin feature

%% ========= Part 2: Normalize features =============
fprintf('Normalizing Features .....\n');
[m n] = size(X);    % get dimention of X
[X mu sigma] = featureNormalize(X); % Normalizing

%Add col x_0 for x_0 * theta_0
X = [ones(m, 1) X];
plotData(X, Y, [2 3]); %Normalize with normalize feature

%% =========== Part 3: Compute Cost and Gradient Descent ===========

% Init fitting parameters
theta = zeros(n + 1, 1);
alpha = 0.01; % Choose the alpha value
num_iters = 1000; %number of iterations

[J_cost, grad] = costFunction(X, Y, theta);

J_history = zeros(num_iters, 1);
acc_history = zeros(num_iters, 1); %Accuracy Rate of Training data 
for i = 1:num_iters
    [J_cur grad_cur] = costFunction(X, Y, theta);
    J_history(i) = J_cur;
    p = predict(theta, X);
    acc_history(i) = mean(double(p == Y)) * 100;
    theta = theta - alpha * grad_cur;
end

%plot J_history with iteration
figure;
hold on;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');
hold off;

%plot accuracy history with iteration
figure;
hold on;
plot(1:numel(acc_history), acc_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Accuracy Rate of train data');
hold off;

%%====== compute Test Dat Accuracy Rate ====================
X_test = digit(trainSize + 1:size(digit,1), featuresRange);
Y_test = digit(trainSize + 1:size(digit,1), 1);

%feacture Normalize
X_test = ( X_test - repmat(mu, size(X_test, 1), 1) ) ./ repmat(sigma, size(X_test, 1), 1);
X_test = [ones(size(X_test, 1),1) X_test];

%let female(y=0) for convenience
Y_test( find(Y_test==2) ) = 0;

p = predict(theta, X_test);
fprintf('Test Data Accuracy: %f\n', mean(double(p == Y_test)) * 100);




