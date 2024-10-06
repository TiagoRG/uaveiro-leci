N = 50;
T = 100:100:1000;
n_keys = 50;
prob_array = zeros(1,length(T));

for i = 1:length(T)
    t = T(i);
    prob = 0;
    for n = 1:N
        hash_exp = randi([1,t-1],n_keys,t);
        colisions = 0;
        for j = 1:t
            if n_keys > length(unique(hash_exp(:,j)))
                colisions = colisions + 1;
            end
        end
        prob = prob + colisions / t;
    end
    prob_array(i) = prob / N;
end

plot(T, prob_array, "-o")
title("Ex3 c)");
xlabel("Tamanho do array");
ylabel("Prob. de colisao");