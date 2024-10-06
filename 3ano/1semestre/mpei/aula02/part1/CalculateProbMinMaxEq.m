function P = CalculateProbMinMaxEq(min, max, total, experiences)
    results = rand(total, experiences) > 0.5;
    successes = sum(results) >= min;
    successes = successes <= max;
    P = sum(successes) / experiences;
end