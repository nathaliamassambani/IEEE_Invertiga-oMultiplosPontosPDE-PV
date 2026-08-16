function resultado = Metodo_Euler (erro, erromax_ME, erromax_NR, cont, contmax, x, Pd, a, b, e, ft, Pmin, Pmax, n, u, G, h, p1, p2, t1, n_limite)

% Descida para o mínimo pelo Método de Euler
while ((erro>erromax_ME) && (cont<contmax))
    
    cont = cont + 1;
    
    % Calcula o gradiente da função custo com aproximante e barreira que é usado no Euler Simples e no Modificado
    
    df = fx(x, Pd, a, b, e, ft, Pmin, Pmax, n, u, G);
    
    if G <= 13  % Método de Euler Simples
        
        for i = 1:G-1
            x(i) = x(i) - h*df(i);
        end
        
    else   % Método de Euler Modificado usado para maiores dimensões
        
        % Guarda o ponto e o gradiente originais
        xo = zeros(size(x));
        dfo = zeros(size(x));
        
        for i = 1:G-1
            xo(i) = x(i);
            dfo(i) = df(i);
        end
        
        % Calcula o ponto intermediário
        for i = 1:G-1
            x(i) = x(i) - h*df(i);
        end
        
        % Calcula o ponto final a partir do gradiente médio
        if G == 19
            
            for i = 1:G-1
                x(i) = xo(i) - 0.03*h*(df(i)+dfo(i));
            end
        else
            for i = 1:G-1
                x(i) = xo(i) - 0.5*h*(df(i)+dfo(i));
            end
        end
        
    end % Fim do se <=13
    
    % Calcula o gradiente no ponto intermediário
    
    df = fx(x, Pd, a, b, e, ft, Pmin, Pmax, n, u, G);
    % O erro é a norma do gradiente
    erro_soma = 0;
    for i = 1:G-1
        erro_soma = erro_soma + (df(i))^2;
    end
    erro = sqrt(erro_soma);
    
    % Atualização do parâmetro de suavização e barreira
    %     n = n * p;
    %     u = u * p;
    
    if n > n_limite
        
        pk = 1/(p1+(p2/cont));
        n = pk*n;
        
    else
        n = n_limite;
        
    end
    
    u = t1*u;
    
    resultado = x;
end % Fim da descida