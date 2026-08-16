% Adaptação do Método do Chinag e Chu (1996) para o PDE_PV com 3, 6, 10, 13, 19 e 40 geradores
tic

close all
clear all
clc
format short

%%
% Dados básicos
% Quantidades de geradores na unidade ESCOLHA E DESCOMENTE SOMENTE UM

% G = 3;
% G = 6;
% G = 10;
G = 13;
% G = 19;
% G = 40;

if G == 3
    %__________________________________________________________________________
    % 3 geradores
    %__________________________________________________________________________
    Pmin = [100,50,100];               % Potência Minima
    Pmax = [600,200,400];              % Potência Máximo
    Pd = 850;                          % Potência Demandada
    a = [0.001562,0.00482,0.00194];
    b = [7.92,7.97,7.85];
    c = [561,78,310];
    e = [300,150,200];
    ft = [0.0315,0.063,0.042];
    
    x = [500, 120];  % Solução inicial
    
    %Parâmetros
    %__________________________________________________________________________
    n = 10;  % Parâmetro de suavização
    p1 = 2.5; % Fatores de redução do parâmetro de suavização
    p2 = 5; % Fatores de redução do parâmetro de suavização
    n_limite = 10^-8; % Limitante da atualização do parâmetro de suavização
    u = 20; % Parâmetro de barreira/relaxação inicial
    t1 = 0.5; % Fatores de atualização do parâmetro de barreira
    h = 0.1; % Passo de integração
    delta = 1.2;  % Peteleco nos autovetores, dependendo do tamanho pode
    tol = 0.01;  % Tolerância para considerar dois pontos iguais
    contmax_ME = 1100; % Número máximo de pontos das trajetórias
    contmax_NR = 15; % Número máximo de pontos das trajetórias
    erromax_ME = 0.02; % Erro Método de Euller
    erromax_NR = 0.1; % Erro Método de Newton Raphson
    min_descida = 2000; %  Minimo de pontos por descida
    %__________________________________________________________________________
end

if G == 6
    %__________________________________________________________________________
    % 6 geradores
    %__________________________________________________________________________
    Pmin = [50,20,15,10,10,12];
    Pmax = [200,80,50,35,30,40];
    Pd = 283;
    a = [0.00375,0.0175,0.0625,0.00834,0.025,0.025];
    b = [2,1.75,1,3.25,3,3];
    c = [0,0,0,0,0,0];
    e = [120,50,30,25,25,30];
    ft = [0.073,0.032,0.051,0.026,0.026,0.048];
    
    x = [130, 55, 35, 25, 18]; % Solução inicial
    
    %Parâmetros
    %__________________________________________________________________________
    n = 75;  % Parâmetro de suavização
    p1 = 6.1; % Fatores de redução do parâmetro de suavização
    p2 = 12; % Fatores de redução do parâmetro de suavização
    n_limite = 10^-4; % Limitante da atualização do parâmetro de suavização
    u = 2;  % % Parâmetro de barreira/relaxação inicial
    t1 = 0.5; % Fatores de atualização do parâmetro de barreira
    h = 0.1; % Passo de integração
    delta = 2.3;  % Peteleco nos autovetores, dependendo do tamanho pode
    tol = 0.01;  % Tolerância para considerar dois pontos iguais
    contmax_ME = 200; % Número máximo de pontos das trajetórias
    contmax_NR = 100; % Número máximo de pontos das trajetórias
    erromax_ME = 0.01; % Erro Método de Euller
    erromax_NR = 0.9; % Erro Método de Newton Raphson
    min_descida = 1000; % Minimo de pontos por descida
    %__________________________________________________________________________
end

if G == 10
    %__________________________________________________________________________
    % 10 geradores
    %__________________________________________________________________________
    Pmin = [10,20,47,20,50,70,60,70,135,150];       % Potência Minima
    Pmax = [55,80,120,130,160,240,300,340,470,470];  % Potência Máximo
    Pd = 2000;                          % Potência Demandada
    a = [0.12951,0.10908,0.12511,0.12111,0.15247,0.10587,0.03546,0.02803,0.02111,0.01799];
    b = [40.5407,39.5904,36.5104,39.5104,38.5390,46.1592,38.3055,40.3978,36.3178,38.2704];
    c = [100.4030,950.606,900.705,800.705,756.799,451.325,1243.531,1049.998,1658.569,1356.659];
    e = [33,35,32,30,30,20,20,30,60,40];
    ft = [0.0174,0.0178,0.0162,0.0168,0.0148,0.0163,0.0152,0.0128,0.0136,0.0141];
    
    x = [30,70,100,110,110,210,260,300,410];  % Solução inicial 
    
    %Parâmetros
    %__________________________________________________________________________
    n = 7;  % Parâmetro de suavização
    p1 = 2; % Fatores de redução do parâmetro de suavização
    p2 = 5; % Fatores de redução do parâmetro de suavização
    n_limite = 10^-2; % Limitante da atualização do parâmetro de suavização
    u = 100; % Parâmetro de barreira/relaxação inicial
    t1 = 0.2; % Fatores de atualização do parâmetro de barreira
    h = 0.01; % Passo de integração
    delta = 1.2;  % Peteleco nos autovetores, dependendo do tamanho pode
    tol = 0.01;  % Tolerância para considerar dois pontos iguais
    contmax_ME = 50; % Número máximo de pontos das trajetórias
    contmax_NR = 100; % Número máximo de pontos das trajetórias
    erromax_ME = 0.02; % Erro Método de Euller
    erromax_NR = 0.9; % Erro Método de Newton Raphson
    min_descida = 1000; %  Minimo de pontos por descida
    %__________________________________________________________________________
end

if G == 13
    %__________________________________________________________________________
    %13 geradores
    %__________________________________________________________________________
    Pmin = [0,0,0,60,60,60,60,60,60,40,40,55,55];
    Pmax = [680,360,360,180,180,180,180,180,180,120,120,120,120];
    Pd = 2520;
    a = [0.00028,0.00056,0.00056,0.00324,0.00324,0.00324,0.00324,0.00324,0.00324,0.00284,0.00284,0.00284,0.00284];
    b = [8.1,8.1,8.1,7.74,7.74,7.74,7.74,7.74,7.74,8.6,8.6,8.6,8.6];
    c = [550,309,307,240,240,240,240,240,240,126,126,126,126];
    e = [300,200,200,150,150,150,150,150,150,100,100,100,100];
    ft = [0.035,0.042,0.042,0.063,0.063,0.063,0.063,0.063,0.063,0.084,0.084,0.084,0.084];
    
    x = [620, 300, 330, 140, 155, 150, 155, 170, 170, 65, 105, 95]; % Solução inicial
    
    %
    %Parâmetros
    %__________________________________________________________________________
    n = 100;  % Parâmetro de suavização
    p1 = 2; % Fatores de redução do parâmetro de suavização
    p2 = 5; % Fatores de redução do parâmetro de suavização
    n_limite = 10^-2; % Limitante da atualização do parâmetro de suavização
    u = 54; % Parâmetro de barreira/relaxação inicial
    t1 = 0.2; % Fatores de atualização do parâmetro de barreira
    h = 0.01; % Passo de integração
    delta = 0.002;  % 4.1 Peteleco nos autovetores
    tol = 0.001;  % Tolerância para considerar dois pontos iguais
    contmax_ME = 100; % Número máximo de pontos das trajetórias
    contmax_NR = 100; % Número máximo de pontos das trajetórias
    erromax_ME = 0.010; % Erro Método de Euller
    erromax_NR = 0.9; % Erro Método de Newton Raphson
    min_descida = 1000; % Minimo de pontos por descida
    %__________________________________________________________________________
end

if G == 19
    %__________________________________________________________________________
    % 19 geradores
    %__________________________________________________________________________
    Pmin = [100,120,100,8,50,150,50,100,200,15,50,25,50,0,20,15,15,50,400];
    Pmax = [300,438,250,25,63.75,300,63.75,500,600,40,150,75,63.75,95,220,80,80,230,500];
    Pd = 2908;
    a = [0.0097,0.0055,0.0055,0.0025,0,0.008,0,0.0075,0.0085,0.009,0.0045,0.0025,0,0.0045,0.0065,0.0045,0.0025,0.0045,0.008];
    b = [6.8,4,4,0.85,5.28,3.5,5.439,6,6,5.2,1.6,0.85,2.55,1.6,4.7,1.4,0.85,1.6,5.5];
    c = [119,90,45,0,0.891,110,21,88,55,90,65,78,49,85,80,90,10,25,90];
    e = [90,79,0,0,0,0,0,50,0,0,0,58,0,0,92,0,0,0,0];
    ft = [0.72,0.05,0,0,0,0,0,0.52,0,0,0,0.02,0,0,0.75,0,0,0,0];
    
  x = [170, 300, 160, 9, 53, 211, 51, 305, 300, 25, 80, 42, 50.5, 10, 210, 40, 40, 200];

    %Parâmetros
    %__________________________________________________________________________
    n = 130 ;  % Parâmetro de suavização
    p1 = 2; % Fatores de redução do parâmetro de suavização
    p2 = 4; % Fatores de redução do parâmetro de suavização
    n_limite = 10^-8; % Limitante da atualização do parâmetro de suavização
    u = 10; % Parâmetro de barreira/relaxação inicial
    t1 = 0.5; % Fatores de atualização do parâmetro de barreira
    h = 0.001; % Passo de integração
    delta = 0.001;  % Peteleco nos autovetores, dependendo do tamanho pode
    tol = 0.01;  % Tolerância para considerar dois pontos iguais
    contmax_ME = 305; % Número máximo de pontos das trajetórias
    contmax_NR = 100; % Número máximo de pontos das trajetórias
    erromax_ME = 0.01; % Erro Método de Euller
    erromax_NR = 0.9; % Erro Método de Newton Raphson
    min_descida = 500; %  Minimo de pontos por descida
    %__________________________________________________________________________
end

if G == 40
    %__________________________________________________________________________
    % 40 geradores
    %__________________________________________________________________________
    Pmin = [36,36,60,80,47,68,110,135,135,130,94,94,125,125,125,125,220,220,242,242,254,254,254,254,254,254,10,10,10,47,60,60,60,90,90,90,25,25,25,242];
    Pmax = [114,114,120,190,97,140,300,300,300,300,375,375,500,500,500,500,500,500,550,550,550,550,550,550,550,550,150,150,150,97,190,190,190,200,200,200,110,110,110,550];
    Pd = 10500;
    a = [0.00690,0.00690,0.02028,0.00942,0.01140,0.01142,0.00357,0.00492,0.00573,0.00605,0.00515,0.00569,0.00421,0.00752,0.00752,0.00752,0.00313,0.00313,0.00313,0.00313,0.00298,0.00298,0.00284,0.00284,0.00277,0.00277,0.52124,0.52124,0.52124,0.01140,0.00160,0.00160,0.00160,0.00010,0.00010,0.00010,0.01610,0.01610,0.01610,0.00313];
    b = [6.73,6.73,7.07,8.18,5.35,8.05,8.03,6.99,6.60,12.9,12.9,12.8,12.5,8.84,8.84,8.84,7.97,7.95,7.97,7.97,6.63,6.63,6.66,6.66,7.10,7.10,3.33,3.33,3.33,5.35,6.43,6.43,6.43,8.95,8.62,8.62,5.88,5.88,5.88,7.97];
    c = [94.705,94.705,309.540,369.030,148.890,222.330,287.710,391.980,455.760,722.820,635.200,654.690,913.400,1760.400,1760.400,1760.400,647.850,649.690,647.830,647.810,785.960,785.960,794.530,794.530,801.320,801.320,1055.100,1055.100,1055.100,148.890,222.920,222.920,222.920,107.870,116.580,116.580,307.450,307.450,307.450,647.830];
    e = [100,100,100,150,120,100,200,200,200,200,200,200,300,300,300,300,300,300,300,300,300,300,300,300,300,300,120,120,120,120,150,150,150,200,200,200,80,80,80,300];
    ft = [0.084,0.084,0.084,0.063,0.077,0.084,0.042,0.042,0.042,0.042,0.042,0.042,0.035,0.035,0.035,0.035,0.035,0.035,0.035,0.035,0.035,0.035,0.035,0.035,0.035,0.035,0.077,0.077,0.077,0.077,0.063,0.063,0.063,0.042,0.042,0.042,0.098,0.098,0.098,0.035];
    
    x = [80, 90, 92, 150, 60, 80, 280, 270, 280, 250, 105 , 105, 400, 400, 400, 400, 450, 450, 450, 450, 450, 450, 450, 450, 450, 300, 30, 30, 30, 90, 80, 80, 80, 180, 140, 115, 75, 90, 80];

    %Parâmetros
    %__________________________________________________________________________
    n = 100;  % Parâmetro de suavização 
    p1 = 2; % Fatores de redução do parâmetro de suavização 
    p2 = 5; % Fatores de redução do parâmetro de suavização 
    n_limite = 10^-2; % Limitante da atualização do parâmetro de suavização 
    u = 54; % Parâmetro de barreira/relaxação inicial
    t1 = 0.2; % Fatores de atualização do parâmetro de barreira
    h = 0.001; % Passo de integração
    delta = 0.002;  % 4.1 Peteleco nos autovetores
    tol = 0.001;  % Tolerância para considerar dois pontos iguais
    contmax_ME = 1000; % Número máximo de pontos das trajetórias
    contmax_NR = 100; % Número máximo de pontos das trajetórias 
    erromax_ME = 0.010; % Erro Método de Euller 
    erromax_NR = 0.9; % Erro Método de Newton Raphson 
    min_descida = 235; %  Minimo de pontos por descida 
    %__________________________________________________________________________
end

% Teste dos resultados iniciais

 s = sum(x)
 m = fmodulo(x,a,b,c,e,ft,Pmin,G,Pd)

%% Inicialização dos conjuntos de mínimos e condições iniciais

Minimos = [x,Pd-sum(x),fmodulo(x,a,b,c,e,ft,Pmin,G,Pd),0] % Conjunto de minimos
Descida = x; % Inicializa a descida em um ponto "chute"
x_min = [x,Pd-sum(x)]; % Acrescenta esse ponto nos pontos minimos (soluções)
contD = 0; %Inicializa a variavel que conta as descidas

%% Solução

[bestsol,soma_bestsol,bestobj,n_x_min,n_Descida, Minimos] = SDA(Pmin, Pmax, Pd, a, b, c, e, ft, x, n, u, h, delta, tol, contmax_ME, contmax_NR, erromax_ME, erromax_NR, min_descida, G, Minimos, Descida, x_min, contD, p1, p2, t1, n_limite);
fprintf('\n----------------------PDE PV SDA---------------------\n|*Resultado Final:\n|')
fprintf('*Geradores =¨%d',G)
fprintf('\n|*Demanda = %d',round(Pd))
fprintf('\n|*Somatoria da geração = %g',soma_bestsol)
for i = 1:G
    fprintf('\n|*Pg(%d) = %g',i, bestsol(i))
end
fprintf('\n|*f_obj = %g',bestobj)
fprintf('\n|*n° mínimos = %g',n_x_min(1))
fprintf('\n|*n° Descidas = %g',n_Descida(1))
fprintf('\n-----------------------------------------------------\n')

obj = Minimos(:,G+1);

toc
%% Inicio

function [bestsol,soma_bestsol,bestobj,n_x_min,n_Descida, Minimos] = SDA(Pmin, Pmax, Pd, a, b, c, e, ft, x, n, u, h, delta, tol, contmax_ME, contmax_NR, erromax_ME, erromax_NR, min_descida, G, Minimos, Descida, x_min, contD, p1, p2, t1, n_limite)

% Repetição do método: busca entre os petelecos de descida que ainda não foram testados
while contD < min(length(Descida(:,1)),min_descida) % Condição em que o contador (contD) está dentro do valor de descidas encontrado
    
    % Busca pontos na região de estabilidade de dois pontos de equilíbrio diferentes
    % Assim encontra-se pontos de decomposição através do método do gradiente refletido, descendo para um ponto de mínimo
    
    % Condição inicial da descida
    contD = contD+1 % Contador de descidas
    x = Descida(contD,:); % Ponto de descida que será explorado
    
    erro = 1;   % Inicializa váriavel de erro
    cont = 0;   % Contador do número de pontos das trajetórias
        
    % Descida para um ponto de mínimo (ponto de equilíbrio) através do método de Euler e refinamento com Newton-Raphson
    x = Metodo_Euler (erro, erromax_ME, erromax_NR, cont, contmax_ME, x, Pd, a, b, e, ft, Pmin, Pmax, n, u, G, h, p1, p2, t1, n_limite);
    
    % Acrescenta o ponto de mínimo ao conjunto de mínimos se ele ainda não estiver no conjunto
    resp = Testa_solucao (Minimos, Pmax, Pmin, x, tol, G); % Testa se a solução encontrada é nova e factivel
    
    % Verifica se está na região de factibilidade
    if (resp==0) % É factivel e um novo ponto
        Minimos = [Minimos;[x,Pd-sum(x)],fmodulo(x, a, b, c, e, ft, Pmin, G, Pd),cont]; % Acrescenta o ponto de mínimo ao conjunto
        x_min = [x_min;x,Pd-sum(x)];
    end
    
    % Busca novos pontos de mínimo integrando o sistema dinâmico quase-gradiente negativo na direção dos 2 vizinhos (seguindo o autovetor instável)
    
    % Subida ao ponto de decomposição usando o gradiente refletido
    df = fx(x, Pd, a, b, e, ft, Pmin, Pmax, n, u, G);
    
    H = Hf(x, Pd, a, b, e, ft, Pmin, Pmax, n, u, G);  % Calcula a Hessiana
    
    % Encontra autovalores e autovetores da Hessiana
    [v,d]= eig(H);
    
    % Encontra novo mínimo a partir de uma sela
    % A condição inicial para encontrar a sela é um peteleco na direção de cada autovetor e em ambos os sentidos
    Descida = Encontra_novo_minimo (G, x, delta, v, erromax_ME, contmax_ME, Pd, a, b, e ,ft, Pmin, Pmax, n, u, h, Descida, tol);
    
end % Fim da busca por pontos de mínimo

% Determina melhor valor encontrado
obj = Minimos(:,G+1);
[bestobj,int] = min (obj);
bestsol = x_min(int,:);
soma_bestsol = sum(bestsol);
n_x_min = size(x_min);
n_Descida = size(Descida);
end
