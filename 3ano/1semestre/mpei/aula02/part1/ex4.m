function n = Calc(p)
    N = 1e5;
    for pessoas = 2 : 366
        a = randi(365, pessoas, N);
        for i = 1:N
            res(i) = length(unique(a(:, i))) < pessoas;
        end
        prob = sum(res)/N;
        if (prob > p)
            n = pessoas;
            break
        end
    end
end

fprintf("a) = %.4f\n", Calc(0.5))
fprintf("b) = %.4f\n", Calc(0.9))
