%% Machine Learning - Exercise 1: Linear Regression withMulti Featrue

%% Initialization

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures

clear; close all; clc

fprintf('Loading data ...\n');

%% Load Data
[digit, txt, raw] = xlsread('psydata.xlsx'); %?表格已处理过，把跑步成绩文本信息，转化为数字，添加新列保存，便于读取数据。男女长跑成绩都化为800米跑步时间。

%选取肺活量，短跑，跳远作为特征arr_X，拟合长跑成绩
trainSize = 2000; % Training sample size
testSize = size(digit,1) - trainSize;
X = digit(1:trainSize, 4:6);
Y = digit(1:trainSize, 12);

%Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf('x = [%.0f %.0f %.0f], y = %.0f \n', [X(1:10, :), Y(1:10, :)]');

% fprintf('Program paused. Press enter to continue.\n');
% pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);     % (x - mu) / sigma; 均值 0， 标准差 1

% Add intercept term to X, (x_0 = 1)
X = [ones(trainSize, 1) X];

%% ================ Part 2: Gradient Descent ================

fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.01;
num_iters = 2000;

% Init Theta and Run Gradient Descent 
theta = zeros(size(X, 2), 1);

% Init Theta and Run Gradient Descent 
[theta, J_history] = gradientDescentMulti(X, Y, theta, alpha, num_iters);

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');


%% Estimate the model

% X_predict = digit(trainSize + 1: trainSize + 10, 4:6);
% X_predict = (X_predict - repmat(mu, size(X_predict, 1), 1)) ./ repmat(sigma, size(X_predict, 1), 1); % x_i = (x_i - mu) / sigma , for each x
% X_predict = [ones(10, 1) X_predict];
% Y_predict = zeros(10, 1);
% Y_Real = digit(trainSize + 1: trainSize + 10, 12);
% 
% 
% % predict Y
% Y_predict = X_predict * theta;
% fprintf('estimate first 10 test data:\npredict \t origin\n');
% fprintf('%f\t%f\n',[Y_predict Y_Real]');

X_test = digit(trainSize + 1:size(digit,1), 4:6);
Y_test = digit(trainSize + 1:size(digit,1), 12);
acc_rate = computeAccuracyRate(X_test, Y_test, theta, mu, sigma);
fprintf('accurate rate: %.0f\nrate = sum((predict_y-y).^2) / length(y)\n', acc_rate);


