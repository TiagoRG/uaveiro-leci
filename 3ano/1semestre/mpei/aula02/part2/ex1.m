N = 1e5;
p_paridade = 0.5;
lancamentos = 2;
num_faces = 6;
p_serX = 1/6;

rolls = randi(num_faces, lancamentos, N);

soma9 = 0;
soma = sum(rolls);
for i = 1 : N
    if soma(i) == 9
        soma9 = soma9 + 1;
    end
end
p_a = soma9/N;

soma_par = 0;
roll2 = rolls(2 : N+1);
for i = 1 : N
    if mod(roll2(i), 2) == 0
        soma_par = soma_par + 1;
    end
end
p_b = soma_par/N;

ser5 = 0;
for i = 1 : N
    if rolls(1, i) == 5 || rolls(2, i) == 5
        ser5 = ser5 + 1;
    end
end
p_c = ser5/N;

diff1 = 0;
for i = 1 : N
    if rolls(1, i) ~= 1 && rolls(2, i) ~= 1
        diff1 = diff1 + 1;
    end
end
p_d = diff1/N;

fprintf("P(A) = %.4f\n", p_a)
fprintf("P(B) = %.4f\n", p_b)
fprintf("P(C) = %.4f\n", p_c)
fprintf("P(D) = %.4f\n", p_d)