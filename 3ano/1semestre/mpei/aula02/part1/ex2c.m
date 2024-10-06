N = 1e5;           % Numero de experiencias
dArr = 10:10:100;


prob_array = zeros(length(dArr), 1);
for d = 1:length(dArr)
    dardos = randi(1000,dArr(d),N);
    res = zeros(1,N);

    for i = 1:N
        res(i) = not(length(unique(dardos(:,i))) == dArr(d));
    end

    prob = sum(res) / N;

    prob_array(d) = prob;
end

subplot(2,1,1);
plot(dArr, prob_array, "-o");
title('m = 1000');
xlabel('Numero de dardos');
ylabel("Probabilidade");
grid on

prob_array = zeros(length(dArr), 1);
for d = 1:length(dArr)
    dardos = randi(100000,dArr(d),N);
    res = zeros(1,N);

    for i = 1:N
        res(i) = not(length(unique(dardos(:,i))) == dArr(d));
    end

    prob = sum(res) / N;

    prob_array(d) = prob;
end

subplot(2,1,2);
plot(dArr, prob_array, "-o");
title('m = 100000');
xlabel('Numero de dardos');
ylabel("Probabilidade");
grid on