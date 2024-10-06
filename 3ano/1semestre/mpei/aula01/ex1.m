% Matriz 3x10000 em que cada coluna representa uma experiência com os 3
% resultados (cada valor está entre 0..1)
experiencias = rand(3,10000);
% Matriz 3x10000 com valores 1 ou 0 dependente se for maior que 0.5
lancamentos = experiencias > 0.5;
% Vetor 1x10000 com a soma de cada linha (número de resultados obtidos)
resultados = sum(lancamentos,1);
% Vetor 1x10000 com 1 se o resultado for 2 (o pretendido)
sucessos = resultados == 2;
% Determina a % de valores 1
P = sum(sucessos) / 10000

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 1e5; % Número de experiências
p = 0.5; % prob de cara
k = 2; % número de caras
n = 3; % número de lançamentos
lancamentos = rand(n,N) > p;
sucessos = sum(lancamentos) == k;
P = sum(sucessos) / N