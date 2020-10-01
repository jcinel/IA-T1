%Regras e fatos (ambiente completo 1)
	
%inicio(X,Y)
inicio(1,1).

%escada(X,Y), onde Y é a base da escada, que permite subir um andar.
escada(5,1).
escada(5,2).
escada(9,2).
escada(9,3).
escada(10,3).
escada(10,4).
escada(1,3).
escada(1,4).
escada(3,4).
escada(3,5).
escada(5,4).
escada(5,5).
escada(9,4).
escada(9,5).

%pedrinha(X,Y), onde é permitido pular para o outro lado de X, contanto que esta posição não contenha outro objeto.
pedrinha(4,2).
pedrinha(7,2).
pedrinha(4,4).
pedrinha(7,4).
pedrinha(6,5).

%parede(X,Y)
parede(3,3).
parede(7,5).

%extintor(X,Y)
extintor(2,3).

%foguinho(X,Y).
foguinho(10,5).
foguinho(9,1).

