% Given probabilities
P_S = 0.75;       % Probability of a sunny day
P_R = 0.25;       % Probability of a rainy day
P_C_given_S = 1/3;  % Probability meteorologist is correct given sunny day
P_C_given_R = 1;    % Probability meteorologist is correct given rainy day

% Part 1: Calculate overall accuracy of the meteorologist
P_C = P_C_given_S * P_S + P_C_given_R * P_R;

% Part 2: Calculate accuracy if the student always predicts sun
P_student_correct = P_S;

% Display the results
fprintf('Meteorologist''s overall accuracy: %.2f%%\n', P_C * 100);
fprintf('Student''s accuracy if they always predict sun: %.2f%%\n', P_student_correct * 100);

% Decision analysis
if P_C > P_student_correct
    fprintf('The meteorologist''s balanced prediction method is better.\n');
else
    fprintf('The student''s method of always predicting sun is better.\n');
end
