a = CalculateProbMinEq(1,2,1e5);
d = CalculateProbMinEq(2,2,1e5);
e = CalculateProbEqual(1,4,1e5);
f = CalculateProbMinMaxEq(1,2,4,1e5);

fprintf("a) %.3f\n", a)
fprintf("d) %.3f\n", d)
fprintf("e) %.3f\n", e)
fprintf("f) %.3f\n", f)