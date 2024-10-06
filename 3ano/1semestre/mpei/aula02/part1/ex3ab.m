N = 500;
T = 1000;
n_keys = 10;
prob_array = zeros(1,n_keys);

for n = 1:n_keys
    prob = 0;
    for i = 1:N
        hash_exp = randi([0,T-1],n,T);
        colisions = 0;
        for j = 1:T
            if n > length(unique(hash_exp(:,j)))
                colisions = colisions + 1;
            end
        end
        prob = prob + colisions / T;
    end
    prob_array(n) = prob / N;
end

fprintf("a) = %.4f\n", prob_array(10));

plot(1:n_keys, prob_array, "-o")
title("Ex3 b)");
xlabel("Numero de keys");
ylabel("Prob. de colisao");