function resposta = Peteleco_autovetores (xd, delta, dv, Descida, Pmax, Pmin, tol, G)  
for sinald = -1:2:1
                
                % Peteleco para definir a próxima condição inicial para a descida ao mínimo, usa o autovetor associado à variedade instável
                
                for i = 1:G-1
                    xp(i) = xd(i) + sinald*delta*dv(i);
                end
                
                % Verifica se este peteleco já está no conjunto de pontos de descida, caso contrário inclui-lo-á a tolerância é maior pois a autoanálise não é feita em todos os passos e repetir pontos de descida é ruim
                
                resp = Testa_solucao (Descida, Pmax, Pmin, xp, tol, G); % Testa de a solução encontrada é nova e factível
                
                 if (resp == 0) % Caso ainda  não acrescenta no conjunto de descida
                    Descida = [Descida;xp];
                 end
end % Fim dos petelecos para a próxima descida
resposta = Descida;
end