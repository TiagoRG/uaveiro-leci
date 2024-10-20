% Number of simulations
num_simulations = 10000;

%% a)
fprintf("e)\n");
% Simulate coin tosses
results = randi([0, 1], num_simulations, 4); % 0 = tails (C), 1 = heads (K)

% Count the number of heads (K) in each simulation
num_heads = sum(results, 2);

% Estimate the probability mass function
pX = zeros(1, 5); % For 0 to 4 heads
for x = 0:4
    pX(x + 1) = sum(num_heads == x) / num_simulations;
end

% Values of x (number of heads)
values_x = 0:4;

% Plotting the probability mass function
bar(values_x, pX);
xlabel('Number of Heads (K)');
ylabel('Probability P(X=x)');
title('Probability Mass Function P(X)');
xticks(values_x);

% Display the results
disp('P(X=x) values:');
for x = 0:4
    fprintf('P(X=%d) = %.4f\n', x, pX(x + 1));
end

%% b)
fprintf("\n====================\n\nb)\n");
% Calculando o valor esperado E(X)
E_X = sum(values_x .* pX);

% Calculando E(X^2)
E_X2 = sum((values_x.^2) .* pX);

% Calculando a variância Var(X)
Var_X = E_X2 - E_X^2;

% Calculando o desvio padrão
std_X = sqrt(Var_X);

% Exibindo os resultados
fprintf('Valor Esperado E(X) = %.4f\n', E_X);
fprintf('Variância Var(X) = %.4f\n', Var_X);
fprintf('Desvio Padrão σ(X) = %.4f\n', std_X);

%% d)
fprintf("\n====================\n\nd)\n");
% Número total de lançamentos
n = 4;
p = 0.5;

% Calculando os valores teóricos da função massa de probabilidade
pX_teorico = zeros(1, 5);
for k = 0:n
    pX_teorico(k + 1) = nchoosek(n, k) * (p^k) * ((1-p)^(n-k));
end

% Comparando os valores teóricos com os estimados
fprintf('Comparação entre valores teóricos e estimados:\n');
fprintf('%-10s %-10s %-10s\n', 'Coroas (K)', 'Teórico', 'Estimado');
for x = 0:4
    fprintf('%-10d %-10.4f %-10.4f\n', x, pX_teorico(x + 1), pX(x + 1));
end

%% e)
fprintf("\n====================\n\ne)\n");
% Parâmetros da distribuição
n = 4;  % número de lançamentos
p = 0.5;  % probabilidade de obter uma coroa

% Cálculo teórico do valor esperado
E_X_teorico = n * p;

% Cálculo teórico da variância
Var_X_teorico = n * p * (1 - p);

% Exibindo os resultados
fprintf('Comparação entre valores teóricos e estimados:\n');
fprintf('%-20s %-10s %-10s\n', 'Descrição', 'Teórico', 'Estimado');
fprintf('%-20s %-10.4f %-10.4f\n', 'E[X]', E_X_teorico, E_X);
fprintf('%-20s %-10.4f %-10.4f\n', 'Var(X)', Var_X_teorico, Var_X);

%% f)
fprintf("\n====================\n\nf)\n");
% Valores teóricos da função massa de probabilidade
pX_teorico = zeros(1, 5);
for k = 0:n
    pX_teorico(k + 1) = nchoosek(n, k) * (p^k) * ((1-p)^(n-k));
end

% Cálculo das probabilidades
P_ge_2 = 1 - (pX_teorico(1) + pX_teorico(2)); % P(X >= 2)
P_le_1 = pX_teorico(1) + pX_teorico(2); % P(X <= 1)
P_between_1_and_3 = pX_teorico(2) + pX_teorico(3) + pX_teorico(4); % P(1 <= X <= 3)

% Exibindo os resultados
fprintf('Probabilidades:\n');
fprintf('P(X >= 2) = %.4f\n', P_ge_2);
fprintf('P(X <= 1) = %.4f\n', P_le_1);
fprintf('P(1 <= X <= 3) = %.4f\n', P_between_1_and_3);
