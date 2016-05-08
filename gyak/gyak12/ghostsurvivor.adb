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
    helps: Natural:=0;   -- eddigi segítségek száma
 begin
    loop 
       select
	   when helps<3 => accept Help do  -- csak ha még 3-nál kevesebbszer segítettünk
	     helps:=helps+1;               -- ++segítségek
	     OutPut.Puts("*************Joe "&Natural'Image(helps) &". alkalommal segit.********************",1);  -- helyzetjelentés
         end Help;
          or terminate;                  -- ha 3-nál többször segítettünk, akkor "felszabadulunk" a fénybe :)
       end select;
       delay 3.0; -- Joe takarítja büntetésbõl a kastélyt, amiért segített
    end loop;
 end Joe;

  -- királylány taszk
 task Princess is
    entry Frightens(pos: Position; num:Positive);  -- "meghall" egy ijesztést egy helyrõl, és azt, hogy kitõl jött
 end Princess;

 task body Princess is
     current_pos: Position:=(1,3);  -- pozíció a kastélyban
     life: Natural:= 3;             -- életerõ

      type Direction is (left,right,up,down);    -- irányok
      package Dir_Generator is new tools.Random_Generator(Direction); -- irány-randomgenerátor
 
     procedure Step is   -- ellépteti a királylányt egy következõ legális pozícióba (folyósó vagy szoba)
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
        exit when hauntedhouse.IsCorrect(tmp_pos);  -- amíg nem egy megléphetõ helyre mennénk
        end loop;  
	  current_pos:=tmp_pos;
     end step;
     
      procedure Startled(num:Positive) is   -- "begyullad"
      begin
       life:=life-1;      -- életerõt veszít
	 Output.Puts("***Jaj! Megijesztett a Szellem_"&Positive'Image(num)&"! *** Eleterom: "&Natural'Image(life)&" ***",1);  -- jelentés :)
      end Startled;
 
  begin
    loop	
       Output.Puts("Kiralylany: ("&Positive'Image(current_pos.x) &","&Positive'Image(current_pos.y)&") helyiseg: "&Fields'Image(GetField(current_pos)),1);
       -- helyzetjelentés :)
                                             
      select
	 when GetField(current_pos)/=R => accept Frightens(pos:Position; num:Positive)  -- szobában nem ijeszthetnek meg
	 do
 	   if pos=current_pos then  -- ha onnan jött az ijesztgetés, ahol épp vagyunk
	      if Joe'Callable then  -- ha Joe még "él"...
	         select 
	           Joe.Help;           -- ... akkor segítséget próbálunk kérni
	         else 
	            Startled(num);     -- ha nem sikerül "begyulladunk"
	         end select;
	      else                -- pláne, ha Joe már nem is "él"
		   Startled(num);
	      end if;
         end if;
	 end Frightens;
	
       or delay 1.0;  -- eddig maradunk egy helyen
	 end select;
        Step;  -- tovább haladunk a kastélyban
    exit when life<1 or GetField(current_pos)=E;  -- "meghal" a királylány, vagy kijut
    end loop;

     if life<1 then
        Output.Puts("Halalra remultem. Beadom a kulcsot.",1);
     else
        Output.Puts("Kijutottam!",1);
     end if;
  exception when others => Output.Puts("Error with Princess.",1);
 end Princess;

  type Dur_Ptr is access Duration;

  -- szellem taszk típus
 task type Ghost(my_num:Positive; wait: Dur_Ptr) is
 end Ghost;

 task body Ghost is
    current_pos: Position;   -- pozíció a kastélyban
 begin
    while Princess'Callable loop  -- amíg a királylány él és még a kastélyban van
	current_pos:=hauntedhouse.GetRandPos;  -- átugrunk egy random helyre (fal is lehet)

     	if Princess'Callable then
         Output.Puts("Szellem_"&Positive'Image(my_num)&": ("&Positive'Image(current_pos.x) &","&Positive'Image(current_pos.y)&") Huh!!!",1);  -- helyzetjelentés
         select
             Princess.Frightens(current_pos,my_num);  -- ijesztünk egyet 
         or 
             delay wait.all;
         end select;  
	end if;

      --delay wait.all;                   -- kipihenjük magunkat
    end loop;
    exception when others =>
    Output.Puts("Szellem_"&Positive'Image(my_num)&" kiszall.",1);
 end Ghost;

  -- varázsló taszk típus
 task type Wizard(ghost_num: Positive; wait: access Duration) is
 end Wizard;

 task body Wizard is
    type Ghost_Ptr is access Ghost;  -- szellem-taszk pointer típus
    ptr: Ghost_Ptr;   -- szellem-taszk pointer
    dur: Dur_Ptr;     -- várakozási idõ
 begin
    for I in 1..ghost_num loop   -- létrehozunk ghost_num-nyi szellemet
      delay wait.all;            -- felkészül a szellemidézésre
	dur:= new Duration'(Duration(I)*wait.all); -- sorszám*dur lesz a szellem szusszanási ideje
      ptr:=new Ghost(I,dur);      -- új szellem megidézése
    end loop;
 end Wizard;

 --tmp: array(1..2) of Ghost;  -- statikus szellemek :)
  dur: Dur_Ptr:=new Duration'(0.2);
 Count_Kartoffel: Wizard(9,dur);

begin  -- fõprogram
 null;
 
exception
   when others => Output.Puts("Catched an exception in main.");
end GhostSurvivor;







