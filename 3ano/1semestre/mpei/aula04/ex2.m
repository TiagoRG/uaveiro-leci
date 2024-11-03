% Joint probability distribution
P_XY = [1/8, 1/8, 1/24; 
        1/8, 1/4, 1/8; 
        1/24, 1/8, 1/24];

% Values of X and Y
X_vals = [-1, 0, 1];
Y_vals = [-1, 0, 1];

% Marginal distributions
P_X = sum(P_XY, 2); % Sum across rows for X
P_Y = sum(P_XY, 1); % Sum across columns for Y

% Checking independence
independence = true; % Assume independence initially

for i = 1:length(X_vals)
    for j = 1:length(Y_vals)
        % Calculate product of marginals
        product_marginals = P_X(i) * P_Y(j);
        
        % Compare with joint probability
        if abs(P_XY(i, j) - product_marginals) > 1e-10
            independence = false;
            break;
        end
    end
    if ~independence
        break;
    end
end

% Display results
fprintf('Marginal PMF of X: \n');
disp(P_X');
fprintf('Marginal PMF of Y: \n');
disp(P_Y);
if independence
    fprintf('X and Y are independent.\n');
else
    fprintf('X and Y are not independent.\n');
end
