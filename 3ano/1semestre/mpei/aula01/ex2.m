N = 1e5; % Número de experiências
p = 0.5; % prob de cara
k = 6; % número de caras
n = 15; % número de lançamentos
lancamentos = rand(n,N) > p;
sucessos = sum(lancamentos) == k;
P = sum(sucessos) / N