%% a)
% Number of students
num_students = 120;

% Mean and variance for N1 and N2
mu_N1 = 14;
var_N1 = 3.5;
mu_N2 = 16.8;
var_N2 = 4.2;

% Standard deviations
sigma_N1 = sqrt(var_N1);
sigma_N2 = sqrt(var_N2);

% Generate N1 and N2 from a normal distribution
N1 = round(normrnd(mu_N1, sigma_N1, [num_students, 1]));
N2 = round(normrnd(mu_N2, sigma_N2, [num_students, 1]));

% Ensure values are within a reasonable range (e.g., scores between 0 and 20)
N1 = max(0, min(20, N1));
N2 = max(0, min(20, N2));

%% b)
% Joint PMF calculation
joint_counts = zeros(21, 21);
for i = 1:num_students
    joint_counts(N1(i)+1, N2(i)+1) = joint_counts(N1(i)+1, N2(i)+1) + 1;
end
joint_pmf = joint_counts / num_students;

% Plotting the joint PMF
[X, Y] = meshgrid(0:20, 0:20);
figure;
bar3(joint_pmf);
xlabel('N_1 scores');
ylabel('N_2 scores');
zlabel('Joint Probability');
title('Joint PMF of N_1 and N_2');

%% c)
% Calculate correlation coefficient
correlation_matrix = corrcoef(N1, N2);
correlation_coefficient = correlation_matrix(1, 2);

% Display result
fprintf('Correlation coefficient between N1 and N2: %.2f\n', correlation_coefficient);

%% d)
% Marginal PMFs
marginal_N1 = sum(joint_pmf, 2);
marginal_N2 = sum(joint_pmf, 1);

% Check independence by verifying if joint PMF = product of marginals
independent = true;
for i = 1:21
    for j = 1:21
        if abs(joint_pmf(i, j) - (marginal_N1(i) * marginal_N2(j))) > 1e-10
            independent = false;
            break;
        end
    end
    if ~independent
        break;
    end
end

% Display independence result
if independent
    fprintf('N1 and N2 are independent.\n');
else
    fprintf('N1 and N2 are not independent.\n');
end
