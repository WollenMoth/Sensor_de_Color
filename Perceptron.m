close all
clear
clc

% ENTRENAMIENTO

% 1. Obtain the sample set

dk = xlsread('Datos.xlsx', 'Desire Output');
xk0 = xlsread('Datos.xlsx', 'Samples');
ones = -ones(size(dk));
xk = [ones xk0];

% 2. Asosiate sample and desire output

behave = [xk dk];

% 3. Initialize w with random numbers

theta = rand;
w_1 = rand;
w_2 = rand;
w_3 = rand;
w = [theta w_1 w_2 w_3];
disp(w)

% 4. Specify learning rate

n = 0.01;

% 5. Initialize epoch counter

epoch = 0;

% 6. Training

error = 1;
u = zeros(size(dk));
y = zeros(size(dk));
while error == 1
    % 6.1
    error = 0; % 0 = none
    
    % 6.2
    for i = 1:length(dk)
        u(i) = w * transpose(xk(i,:));
        if u(i) < 0
            y(i) = -1;
        else
            y(i) = 1;
        end
    end      
    if any(y ~= dk)
        w = w + (transpose(n * (dk - y)) * xk);
        error = 1;
    end
    % 6.3
    epoch = epoch + 1;
end
disp(y)
disp(w)


% OPERACIÓN

for i = 1:10
    prompt = "Introduzca el valor de R: ";
    R = input(prompt);

    prompt = "Introduzca el valor de G: ";
    G = input(prompt);

    prompt = "Introduzca el valor de B: ";
    B = input(prompt);

    x = [-1 R G B];

    u(i) = w * transpose(xk(i,:));
    if u(i) < 0
        y = -1;
    else
        y = 1;
    end

    if y == -1
        disp("La fruta es una naranja.")
    else
        disp("La fruta es un limón.")
    end
end
