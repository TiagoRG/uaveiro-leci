% Valores de p variando de 0.001 a 0.5
p = logspace(-3, log10(0.5), 100);

% Probabilidades de despenho
P_2_motores = p.^2;
P_4_motores = 4 * p.^3 .* (1 - p) + p.^4;

% Plotando os resultados
figure;
plot(p, P_2_motores, 'b-', 'LineWidth', 2);
hold on;
plot(p, P_4_motores, 'r-', 'LineWidth', 2);
hold off;

% Configurações do gráfico
xlabel('Probabilidade de falha (p)');
ylabel('Probabilidade de despenho');
title('Probabilidade de Despenho vs. Probabilidade de Falha');
legend('2 Motores', '4 Motores');
grid on;
set(gca, 'XScale', 'log');
ylim([0 1]);
