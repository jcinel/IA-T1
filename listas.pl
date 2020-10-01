% Exemplos de manipulação de listas em Prolog

% Toda lista é no formato: 
% [Cabeça | Cauda]
% Por exemplo, em: 

p([a, b, c, d]).

% Quando fazemos as consultas
% ?- P([Head | Tail])
% Temos:
% Head = a,
% Tail = [b, c, d].


% Adicionando itens à lista com o predicado append

append([],List,List).
append([Head|Tail],List2,[Head|Result]):- append(Tail,List2,Result).

% Retirar itens da lista com o predicado remove_itens

retirar_elemento(Elem,[Elem|Cauda],Cauda).
retirar_elemento(Elem,[Elem1|Cauda],[Elem1|Cauda1]) :- retirar_elemento(Elem,Cauda,Cauda1).

concatena([ ],L,L).
concatena([Cab|Cauda],L2,[Cab|Resultado]) :- concatena(Cauda,L2,Resultado).

pertence(Elem,[Elem|_ ]).
pertence(Elem,[ _| Cauda]) :- pertence(Elem,Cauda).

% --- BFS ---
% Solucao por busca em largura (bl)
solucao_bl(Inicial, Solucao) :- 
    bl([[Inicial]], Solucao).

% 1. Se o primeiro estado de F for meta, então o retorna com o caminho
bl([[Estado|Caminho]|_], [Estado|Caminho]) :- meta(Estado).

% 2. Falha ao encontrar a meta, então estende o primeiro estado até seus 
% sucessores e os coloca no final da lista de fronteira
bl([Primeiro|Outros], Solucao) :- 
    estende(Primeiro, Sucessores), 
    concatena(Outros, Sucessores, NovaFronteira), 
    bl(NovaFronteira, Solucao).

% 2.1. Metodo que faz a extensao do caminho até os nós filhos do estado
estende([Estado|Caminho], ListaSucessores):- 
    bagof(
        [Sucessor, Estado|Caminho], 
        (s(Estado, Sucessor), not(pertence(Sucessor, [Estado|Caminho]))), 
        ListaSucessores
    ), !.

% 2.2. Se o estado não tiver sucessor, falha e não procura mais (corte)
estende( _ ,[]).


% --- DFS ---
% Solucao por busca em profundidade (bp)
solucao_bp(Inicial, Solucao) :- 
    bp([], Inicial, Solucao).

% 1. Encontra a meta
bp(Caminho, Estado, [Estado|Caminho]) :- meta(Estado).

% 2. Senão, coloca o no caminho e continua a busca
bp(Caminho, Estado, Solucao) :- 
    s(Estado, Sucessor), 
    not(pertence(Sucessor, Caminho)), 
    bp([Estado|Caminho], Sucessor, Solucao).