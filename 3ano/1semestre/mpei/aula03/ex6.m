% Parâmetros
n = 8000;
p = 1/1000;
k = 7;

% (a) Cálculo usando a distribuição binomial
% Cálculo da combinação diretamente
comb = 1;
for i = 1:k
    comb = comb * (n - (i - 1)) / i; % Cálculo da combinação n!/(k!(n-k)!)
end

P_binomial = comb * (p^k) * ((1 - p)^(n - k));

% (b) Cálculo usando a aproximação de Poisson
lambda = 8; % média de defeituosos em 8000 chips
P_poisson = (lambda^k * exp(-lambda)) / factorial(k);

% Resultados
fprintf('Probabilidade (Binomial) de 7 defeituosos: %.6f\n', P_binomial);
fprintf('Probabilidade (Poisson) de 7 defeituosos: %.6f\n', P_poisson);
