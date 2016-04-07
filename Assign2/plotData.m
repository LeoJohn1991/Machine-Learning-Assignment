function plotData( X, Y, feature)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the male examples
%   and o for the female examples. X is assumed to be a Mx2 matrix.

figure;
hold on;

male = find(Y == 1);
female = find(Y == 0);

plot(X(male, feature(1)), X(male, feature(2)), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
plot(X(female, feature(1)), X(female, feature(2)), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);

%put some label
xlabel('FVC');
ylabel('jump');
legend('male', 'female');

hold off;

end

