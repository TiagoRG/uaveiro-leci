% Parâmetros
lambda = 2; % média de erros em 100 páginas

% Cálculo das probabilidades
P_0 = exp(-lambda); % P(X = 0)
P_1 = (lambda^1 * exp(-lambda)) / factorial(1); % P(X = 1)

% Probabilidade de no máximo 1 erro
P_leq_1 = P_0 + P_1;

% Resultados
fprintf('Probabilidade de no máximo 1 erro em 100 páginas: %.6f\n', P_leq_1);
