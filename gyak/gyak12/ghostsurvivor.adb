with hauntedhouse, tools;
use hauntedhouse, tools;

procedure GhostSurvivor is

-- procedure Print(pos: Position) is
-- begin
--    Output.Puts("("&Positive'Image(pos.x) &","&Positive'Image(pos.y)&")");
-- end Print;

 task Joe is
    entry Help;
 end Joe;

 task body Joe is
    helps: Natural:=0;   -- eddigi seg�ts�gek sz�ma
 begin
    loop 
       select
	   when helps<3 => accept Help do  -- csak ha m�g 3-n�l kevesebbszer seg�tett�nk
	     helps:=helps+1;               -- ++seg�ts�gek
	     OutPut.Puts("*************Joe "&Natural'Image(helps) &". alkalommal segit.********************",1);  -- helyzetjelent�s
         end Help;
          or terminate;                  -- ha 3-n�l t�bbsz�r seg�tett�nk, akkor "felszabadulunk" a f�nybe :)
       end select;
       delay 3.0; -- Joe takar�tja b�ntet�sb�l a kast�lyt, ami�rt seg�tett
    end loop;
 end Joe;

  -- kir�lyl�ny taszk
 task Princess is
    entry Frightens(pos: Position; num:Positive);  -- "meghall" egy ijeszt�st egy helyr�l, �s azt, hogy kit�l j�tt
 end Princess;

 task body Princess is
     current_pos: Position:=(1,3);  -- poz�ci� a kast�lyban
     life: Natural:= 3;             -- �leter�

      type Direction is (left,right,up,down);    -- ir�nyok
      package Dir_Generator is new tools.Random_Generator(Direction); -- ir�ny-randomgener�tor
 
     procedure Step is   -- ell�pteti a kir�lyl�nyt egy k�vetkez� leg�lis poz�ci�ba (foly�s� vagy szoba)
       tmp_pos:Position;
       dir: Direction;
     begin
        loop
          tmp_pos:=current_pos;
          dir:=Dir_Generator.GetRandom;  
        
          case dir is
             when up => tmp_pos.y:=current_pos.y-1;
             when right => tmp_pos.x:=current_pos.x+1;
	       when down => tmp_pos.y:=current_pos.y+1;
	       when left => tmp_pos.x:=current_pos.x-1;
          end case;
        exit when hauntedhouse.IsCorrect(tmp_pos);  -- am�g nem egy megl�phet� helyre menn�nk
        end loop;  
	  current_pos:=tmp_pos;
     end step;
     
      procedure Startled(num:Positive) is   -- "begyullad"
      begin
       life:=life-1;      -- �leter�t vesz�t
	 Output.Puts("***Jaj! Megijesztett a Szellem_"&Positive'Image(num)&"! *** Eleterom: "&Natural'Image(life)&" ***",1);  -- jelent�s :)
      end Startled;
 
  begin
    loop	
       Output.Puts("Kiralylany: ("&Positive'Image(current_pos.x) &","&Positive'Image(current_pos.y)&") helyiseg: "&Fields'Image(GetField(current_pos)),1);
       -- helyzetjelent�s :)
                                             
      select
	 when GetField(current_pos)/=R => accept Frightens(pos:Position; num:Positive)  -- szob�ban nem ijeszthetnek meg
	 do
 	   if pos=current_pos then  -- ha onnan j�tt az ijesztget�s, ahol �pp vagyunk
	      if Joe'Callable then  -- ha Joe m�g "�l"...
	         select 
	           Joe.Help;           -- ... akkor seg�ts�get pr�b�lunk k�rni
	         else 
	            Startled(num);     -- ha nem siker�l "begyulladunk"
	         end select;
	      else                -- pl�ne, ha Joe m�r nem is "�l"
		   Startled(num);
	      end if;
         end if;
	 end Frightens;
	
       or delay 1.0;  -- eddig maradunk egy helyen
	 end select;
        Step;  -- tov�bb haladunk a kast�lyban
    exit when life<1 or GetField(current_pos)=E;  -- "meghal" a kir�lyl�ny, vagy kijut
    end loop;

     if life<1 then
        Output.Puts("Halalra remultem. Beadom a kulcsot.",1);
     else
        Output.Puts("Kijutottam!",1);
     end if;
  exception when others => Output.Puts("Error with Princess.",1);
 end Princess;

  type Dur_Ptr is access Duration;

  -- szellem taszk t�pus
 task type Ghost(my_num:Positive; wait: Dur_Ptr) is
 end Ghost;

 task body Ghost is
    current_pos: Position;   -- poz�ci� a kast�lyban
 begin
    while Princess'Callable loop  -- am�g a kir�lyl�ny �l �s m�g a kast�lyban van
	current_pos:=hauntedhouse.GetRandPos;  -- �tugrunk egy random helyre (fal is lehet)

     	if Princess'Callable then
         Output.Puts("Szellem_"&Positive'Image(my_num)&": ("&Positive'Image(current_pos.x) &","&Positive'Image(current_pos.y)&") Huh!!!",1);  -- helyzetjelent�s
         select
             Princess.Frightens(current_pos,my_num);  -- ijeszt�nk egyet 
         or 
             delay wait.all;
         end select;  
	end if;

      --delay wait.all;                   -- kipihenj�k magunkat
    end loop;
    exception when others =>
    Output.Puts("Szellem_"&Positive'Image(my_num)&" kiszall.",1);
 end Ghost;

  -- var�zsl� taszk t�pus
 task type Wizard(ghost_num: Positive; wait: access Duration) is
 end Wizard;

 task body Wizard is
    type Ghost_Ptr is access Ghost;  -- szellem-taszk pointer t�pus
    ptr: Ghost_Ptr;   -- szellem-taszk pointer
    dur: Dur_Ptr;     -- v�rakoz�si id�
 begin
    for I in 1..ghost_num loop   -- l�trehozunk ghost_num-nyi szellemet
      delay wait.all;            -- felk�sz�l a szellemid�z�sre
	dur:= new Duration'(Duration(I)*wait.all); -- sorsz�m*dur lesz a szellem szusszan�si ideje
      ptr:=new Ghost(I,dur);      -- �j szellem megid�z�se
    end loop;
 end Wizard;

 --tmp: array(1..2) of Ghost;  -- statikus szellemek :)
  dur: Dur_Ptr:=new Duration'(0.2);
 Count_Kartoffel: Wizard(9,dur);

begin  -- f�program
 null;
 
exception
   when others => Output.Puts("Catched an exception in main.");
end GhostSurvivor;







