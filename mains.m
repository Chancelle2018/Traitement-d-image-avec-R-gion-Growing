%% TP1 KIZIMA Chancelle
%% Nettoyer l'environnement
clc, clear, close all;

%% Version 1

%% 1 Créer une matrice de taille NxN 
imOrig = zeros(200,200);
imshow(imOrig);

%% 2 Créer un ou plusieurs objets de manière synthétique
imOrig(24:47,24:45) = 1;
imOrig(110:140,100:135) = 1;
imOrig(90:100,85:125) = 1;


%% 3- Afficher l image originale
imshow(imOrig);

%% 4, 5 6- Créer les seeds de manière aléatoire
[y,x] = ginput(1);
x = uint8(x);
y = uint8(y);

while(imOrig(x,y)~=1)
  [y,x] = ginput(1);
  x = uint8(x);
  y = uint8(y);
end

Etats = zeros(200,200);
RG = zeros(150,150);

Etats(x,y) = 1;
RG(x,y) = 1;

analyserVoisins(x,y,imOrig,Etats,RG);

%% 

% 7- Quel est la condition d arrêt du processus d évolution ?
% lorsqu'on clique sur l'objet à segmenter avec la region de growing, il va
% analysé les pixels voisin en haut et l'intensité de cette pixel est la meme 
% que la region dejà analyser on met l'état à jour 1 et on continu à celui avec le voisin d'en bas 
% ainsi de suite jusqu'à ce que on se retrouve au bordure de l'objet  et l'intensité de pixel change
% la processus s'arrete on sort de la boucle 