% Parâmetros
mu = 14;         % média
sigma = 2;      % desvio padrão
n_samples = 100000; % número de amostras

% Gerar amostras da distribuição normal
X = mu + sigma * randn(n_samples, 1); % amostras

% (a) Probabilidade de um aluno ter classificação entre 12 e 16
P_a = mean(X >= 12 & X <= 16);

% (b) Probabilidade de os alunos terem classificações entre 10 e 18
P_b = mean(X >= 10 & X <= 18);

% (c) Probabilidade de um aluno passar (classificação maior ou igual a 10)
P_c = mean(X >= 10);

% Exibir resultados
fprintf('Estimativa da probabilidade (a) entre 12 e 16: %.4f\n', P_a);
fprintf('Estimativa da probabilidade (b) entre 10 e 18: %.4f\n', P_b);
fprintf('Estimativa da probabilidade (c) para passar (>= 10): %.4f\n', P_c);

% Verificação usando normcdf()
P_a_exact = normcdf(16, mu, sigma) - normcdf(12, mu, sigma);
P_b_exact = normcdf(18, mu, sigma) - normcdf(10, mu, sigma);
P_c_exact = 1 - normcdf(10, mu, sigma); % P(X >= 10)

% Exibir resultados da verificação
fprintf('Probabilidade exata (a) entre 12 e 16: %.4f\n', P_a_exact);
fprintf('Probabilidade exata (b) entre 10 e 18: %.4f\n', P_b_exact);
fprintf('Probabilidade exata (c) para passar (>= 10): %.4f\n', P_c_exact);
