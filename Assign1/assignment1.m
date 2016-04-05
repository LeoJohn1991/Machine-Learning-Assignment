%% Machine Learning - Exercise 1: Linear Regression withMulti Featrue

%% Initialization

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures

clear; close all; clc

fprintf('Loading data ...\n');

%% Load Data
[digit, txt, raw] = xlsread('psydata.xlsx'); %?����Ѵ���������ܲ��ɼ��ı���Ϣ��ת��Ϊ���֣�������б��棬���ڶ�ȡ���ݡ�

%ѡȡ�λ���FVC������sprint����Զjump��Ϊ����arr_X����ϳ��ܳɼ�
trainSize = 2000; % Training sample size
textSize = size(digit,1) - trainSize;
X = digit(1:trainSize, 4:6);
Y = digit(1:trainSize, 12);

%Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf('x = [%.0f %.0f %.0f], y = %.0f \n', [X(1:10, :), Y(1:10, :)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);     % (x - mu) / sigma; ��ֵ 0�� ��׼�� 1

% Add intercept term to X, (x_0 = 1)
X = [ones(trainSize, 1) X];

%% ================ Part 2: Gradient Descent ================

fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.01;
num_iters = 8500;

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


