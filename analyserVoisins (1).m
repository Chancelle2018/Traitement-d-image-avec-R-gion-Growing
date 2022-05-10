function [Etats,RG] = analyserVoisins(x,y,im, Etats, RG)

  [line,col] = size(im);

  %Analyser le pixel du voisin d'en haut 

  if (x>=2)
    if (Etats(x-1,y)==0)
      Etats(x-1,y) = 1;
      if im(x,y) == im(x-1,y)
        RG(x-1,y)=1;
        [Etats,RG] = analyserVoisins(x-1,y,im,Etats,RG);
      end
    end
  end

  % Analyser le pixel du voisin du bas 

  if (x<line)
    if (Etats(x+1,y)==0)
      Etats(x+1,y) = 1;
      if im(x,y) == im(x+1,y)
        RG(x+1,y)=1;
        [Etats,RG] = analyserVoisins(x+1,y,im,Etats,RG);
      end
    end
  end

   % Analyser le pixel du voisin de gauche  

  if (y>=2)
    if (Etats(x,y-1)==0)
      Etats(x,y-1) = 1;
      if im(x,y) == im(x,y-1)
        RG(x,y-1)=1;
        [Etats,RG] = analyserVoisins(x,y-1,im,Etats,RG);
      end
    end
  end

  %Analyser le voisin de droite  

  if (y<col)
    if (Etats(x,y+1)==0)
      Etats(x,y+1) = 1;
      if im(x,y) == im(x,y+1)
        RG(x,y+1)=1;
        [Etats,RG] = analyserVoisins(x,y+1,im,Etats,RG);
      end
    end
  end

  imshow(RG), pause(0.002)

end