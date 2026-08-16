% Define a função que calcula a derivada em relação a x do custo com
% aproximante de raiz quadrada e barreira logaritma para o sistema de 3
% geradores

function resultado = fx(x, Pd, a, b, e, ft, Pmin, Pmax, n, u, G)

S = 0;
for i = 1:G-1
    S = S + x(i);
end
S_x = Pd - S;

for i = 1:G-1
    
    dx_f1 = 2*a(i)*x(i)+b(i)-(e(i)^2*ft(i)*sin(2*ft(i)*(Pmin(i)-x(i))))/(2*sqrt((e(i)*sin(ft(i)*(Pmin(i)-x(i))))^2+n));
    dx_f2 = -2*a(G)*(S_x)-b(G)+(e(G)^2*ft(G)*sin(2*ft(G)*(Pmin(G)-(S_x))))/(2*sqrt((e(G)*sin(ft(G)*(Pmin(G)-(S_x))))^2+n));
    dx_b1 = u*(1/(Pmin(i)-x(i))+1/(x(i)-Pmax(i)));
    dx_b2 = u*(1/(Pmin(G)-(S_x))+1/((S_x)-Pmax(G)));
    
    dg_x(i) = dx_f1 + dx_f2 + dx_b1 + dx_b2;
    
end

resultado = dg_x;
