N = 1e5;           % Numero de experiencias
m = [200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 100000];

prob_array = zeros(1, length(m));
for i = 1:length(m)
    m_value = m(i);
    dardos = randi(m_value,100,N);
    res = zeros(1,N);

    for j = 1:N
        res(j) = not(length(unique(dardos(:,j))) == 100);
    end

    prob = sum(res) / N;

    prob_array(i) = prob;
end

figure;
plot(m, prob_array, "-o");
title('Muitos graficos');
xlabel('Numero de alvos');
ylabel("Probabilidade");
grid on