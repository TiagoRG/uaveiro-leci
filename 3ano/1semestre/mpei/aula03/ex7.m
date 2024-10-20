% Parâmetros
lambda = 60; % média em 4 segundos

% (a) Probabilidade de não receber nenhuma mensagem
P_0 = exp(-lambda); % P(X = 0)

% (b) Probabilidade de receber mais de 40 mensagens
% Usando a soma das probabilidades de 0 a 40
P_leq_40 = sum(exp(-lambda) * (lambda.^(0:40)) ./ factorial(0:40)); % P(X <= 40)
P_gt_40 = 1 - P_leq_40; % P(X > 40)

% Resultados
fprintf('Probabilidade de não receber nenhuma mensagem: %.10f\n', P_0);
fprintf('Probabilidade de receber mais de 40 mensagens: %.10f\n', P_gt_40);
