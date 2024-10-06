function P = ProbCara(nLan, nCara, nExp)
    lancamentos = rand(nLan, nExp) > 0.5;
    sucessos = sum(lancamentos) == nCara;
    P = sum(sucessos) / nExp;
end

function Calc(n, color)
    span = 1:n;
    graph = zeros(n, 1);

    for i = 1 : length(span)
        graph(i) = ProbCara(n, i, 1e5);
    end
    
    stem(span, graph, color)
end

hold on
Calc(20, 'red')
Calc(40, 'blue')
Calc(100, 'green')
hold off