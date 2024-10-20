% Parâmetros do problema
n = 5; % número de peças
p = 0.3; % probabilidade de uma peça ser defeituosa
num_simulacoes = 10000; % número total de simulações

% Simulação
defeituosas = binornd(n, p, num_simulacoes, 1);

% Cálculo da PMF
pmf = histcounts(defeituosas, 0:n+1, 'Normalization', 'probability');

% Cálculo da CDF
cdf = cumsum(pmf);

% Cálculo da probabilidade de no máximo 2 defeituosas
prob_max_2 = sum(pmf(1:3)); % PMF para 0, 1 e 2 peças defeituosas

% Exibição dos resultados
disp('PMF:');
disp(pmf);
disp('CDF:');
disp(cdf);
disp(['Probabilidade de no máximo 2 peças defeituosas: ', num2str(prob_max_2)]);

% Gráfico na mesma figura, gráficos diferentes
figure;

% Subplot para a PMF
subplot(2, 1, 1); % 2 linhas, 1 coluna, 1º gráfico
bar(0:n, pmf, 'FaceColor', 'b', 'EdgeColor', 'k');
title('Função Massa de Probabilidade (PMF)');
xlabel('Número de Peças Defeituosas');
ylabel('Probabilidade');
xlim([-0.5 n + 0.5]);
grid on;

% Subplot para a CDF
subplot(2, 1, 2); % 2 linhas, 1 coluna, 2º gráfico
cdf_plot = [0; cdf(:)]; % Adiciona um zero no início
x_values = 0:n; % Valores do eixo x
x_values = [0; x_values(:)]; % Adiciona um zero no início

plot(x_values, cdf_plot, '-o', 'Color', 'r');
title('Função Distribuição Acumulada (CDF)');
xlabel('Número de Peças Defeituosas');
ylabel('Probabilidade Acumulada');
xlim([-0.5 n + 0.5]);
grid on;
