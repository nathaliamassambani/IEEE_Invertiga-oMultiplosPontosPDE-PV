function resultado = Metodo_gradiente_refletivo (erromax_ME, contmax, xd, Pd, a, b, e, ft, Pmin, Pmax, n, u, G, h)

% Condição inicial da trajetória de subida
% Reinicializa valores de erro e contador de iterações
erro = 1;
cont = 0;

% Inicio do método de gradiente refletido
while ((erro>erromax_ME) && (cont<contmax))
    
    cont = cont + 1;
    
    % Faz a autoanálise apenas a cada 5 iterações
    if (mod(cont,5)==0)||(cont==1)
        
        % Calcula a Hessiana ao longo da trajetória de subida
        H = Hf(xd,Pd,a,b,e,ft,Pmin,Pmax,n,u,G);
        [V,D] = eig(H);
        [B,C] = sort(diag(D));
        
        % Calcula as matrizes da decomposição
        
        P = zeros(G-1,G-1);
        for i = 1:G-1
            P(:,:,i) = V(:,i)* V(:,i)';
        end
        
        M1 = zeros(G-1,G-1);
        for i = 1:G-1
            if i == 1
                M1 = M1 + P(:,:,i);
            else
                M1 = M1 - P(:,:,i);
            end
        end
        
        dv1 = V(:,1); % Direção para futura descida
        dv = dv1';
    end
    % Sistema dinâmico modificado que transforma os pontos de equilíbrios tipo 1 (pontos de selas) do sistema original em pontos de equilíbrio estáveis do sistema modificado
    
    df = fx(xd,Pd,a,b,e,ft,Pmin,Pmax,n,u,G);
    
    xd_aux = xd' + h * M1 *df';
    xd = xd_aux';
    
    % O erro é a norma do gradiente
    erro_soma = 0;
    for i = 1:G-1
        erro_soma = erro_soma + (df(i))^2;
    end
    erro = sqrt(erro_soma);
    
end % Fim da subida ao ponto de sela
resultado = [xd ; dv];
end