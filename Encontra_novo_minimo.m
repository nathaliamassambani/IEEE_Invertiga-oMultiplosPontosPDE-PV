function resultado = Encontra_novo_minimo (G, x, delta, v, erromax_ME, contmax, Pd, a, b, e ,ft, Pmin, Pmax, n, u, h, Descida, tol)

for k = 1:G-1  % Busca na direção dos autovetores
        
        for sinaldv = -1:2:1    % Busca em ambas as direções
            
            % Ponto inicial para subida ao ponto de decomposição
            for i = 1:G-1
                xd(i) = x(i)+sinaldv*delta*v(i,k);
            end
            
            % Subida para uma sela
            r = Metodo_gradiente_refletivo (erromax_ME, contmax, xd, Pd, a, b, e, ft, Pmin, Pmax, n, u, G, h);
            xd = abs(r(1,:));
            dv = r(2,:);
            
            % Peteleco na direção de cada autovetor e em ambos os sentidos
            Descida = Peteleco_autovetores (xd, delta, dv, Descida, Pmax, Pmin, tol, G);  
            
        end % Fim dos petelecos para subida em ambos os sentidos
    end % Fim dos petelecos para subida em ambas as direções
    resultado = Descida;
    % Fim da busca por selas para novos pontos de mínimo
end