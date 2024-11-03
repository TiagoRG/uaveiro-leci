% Joint probability distribution
P_XY = [0.3, 0.2, 0; 
        0.1, 0.15, 0.05; 
        0, 0.1, 0.1];

% Values of X and Y
X_vals = [0, 1, 2];
Y_vals = [0, 1, 2];

% Marginal distributions
P_X = sum(P_XY, 2);
P_Y = sum(P_XY, 1);

% Mean of X and Y
E_X = sum(X_vals .* P_X');
E_Y = sum(Y_vals .* P_Y);

% Variance of X and Y
Var_X = sum((X_vals - E_X).^2 .* P_X');
Var_Y = sum((Y_vals - E_Y).^2 .* P_Y);

% Covariance of X and Y
E_XY = sum(sum((X_vals' * Y_vals) .* P_XY));
Cov_XY = E_XY - E_X * E_Y;

% Correlation coefficient
rho_XY = Cov_XY / sqrt(Var_X * Var_Y);

% Display results
fprintf('Marginal PMF of X: \n');
disp(P_X');
fprintf('Marginal PMF of Y: \n');
disp(P_Y);
fprintf('Mean of X: %.2f\n', E_X);
fprintf('Mean of Y: %.2f\n', E_Y);
fprintf('Variance of X: %.2f\n', Var_X);
fprintf('Variance of Y: %.2f\n', Var_Y);
fprintf('Covariance of X and Y: %.2f\n', Cov_XY);
fprintf('Correlation coefficient between X and Y: %.2f\n', rho_XY);

% Plot Marginal PMFs
figure;
subplot(1,2,1);
stem(X_vals, P_X, 'filled');
title('Marginal PMF of X');
xlabel('X');
ylabel('P(X)');

subplot(1,2,2);
stem(Y_vals, P_Y, 'filled');
title('Marginal PMF of Y');
xlabel('Y');
ylabel('P(Y)');
