function resultado = Testa_solucao (Minimos, Pmax, Pmin, x, tol, G)

resp = 0;
for j = 1:length(Minimos(:,1))
    if max(abs(x-Minimos(j,1:G-1)))<tol
        resp = 1;
    end
end

fact = 0;
for i = 1:G-1
    if (x(i)<=Pmin(i))||(x(i)>=Pmax(i))
        fact = 1;
    end
end

if (resp == 1)|| (fact == 1)
    resultado = 1;
else
    resultado = 0;
end
end