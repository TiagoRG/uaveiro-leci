function P = CalculateProbMaxEq(partial, total, experiences)
    results = rand(total, experiences) > 0.5;
    successes = sum(results) <= partial;
    P = sum(successes) / experiences;
end