% Define a função que calcula a matriz Hessiana do custo com aproximante
% de raiz quadrada e barreira logaritma para o sistema de 3 geradores

function resultado = Hf(x,Pd,a,b,e,ft,Pmin,Pmax,n,u,G)

d = 0.001;
x1 = x;

for i = 1:G-1
    fx0(i,:) = fx(x,Pd,a,b,e,ft,Pmin,Pmax,n,u,G);
    x1 = x;
    x1(i) = x1(i)+d;
    fx1(i,:) = fx(x1,Pd,a,b,e,ft,Pmin,Pmax,n,u,G);
end

resultado = -(fx0 - fx1)/d;
