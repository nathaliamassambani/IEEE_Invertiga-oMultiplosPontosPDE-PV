% Define a função que calcula o custo com o módulo e sem a barreira
% para o sistema de 3 geradores

function resultado = fmodulo(x,a,b,c,e,ft,Pmin,G,Pd)

S = 0;
for i = 1:G-1
    S = S + x(i);
end
x(G) = Pd - S;

C = 0;
for i=1:G       % Calcula a somatória do custo
    C = C + ((a(i)*(x(i)^2.0))+(b(i)* x(i))+c(i)+ abs(e(i)*(sin(ft(i)*(Pmin(i)-x(i))))));
end

resultado = C;