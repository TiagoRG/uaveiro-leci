N = 1e5;           % Numero de experiencias

dardos = randi(100,20,N);   % Gerar uma matriz 20xN com cada elemento pertencente [1,100]
res = zeros(1, N);          % Criar uma matriz linha de 0

for i = 1:N      
    % unique -> retorna 1 se o campo de dardos selecionado apenas for '1'
    res(i) = length(unique(dardos(:,i))) == 20; % Verificar para coluna
end

probSimul = sum(res) / N;   % Calcular a probabilidade
fprintf("Prob. Simulação: %.4f\n", probSimul);