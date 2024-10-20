% Definindo os valores da variável aleatória
x = 1:6; % Faces do dado
p = ones(1, 6) / 6; % Probabilidade de cada face (distribuição uniforme)

figure;

% (a) Gráfico da função massa de probabilidade
subplot(2, 1, 1); % Duas linhas, uma coluna, primeiro gráfico
bar(x, p, 'FaceColor', [0 0.5 0.8]);
xlabel('Valores de X (Faces do dado)');
ylabel('P(X)');
xticks(x); % Colocar ticks em cada face do dado
grid on;

% (b) Gráfico da função de distribuição acumulada
subplot(2, 1, 2); % Duas linhas, uma coluna, segundo gráfico
F = cumsum(p); % Função de distribuição acumulada
stairs(x, F, 'LineWidth', 2, 'Color', [0.8 0 0]);
xlabel('Valores de X (Faces do dado)');
ylabel('F(X)');
xticks(x); % Colocar ticks em cada face do dado
grid on;

