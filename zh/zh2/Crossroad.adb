with Ada.Text_IO;
use Ada.Text_IO;

procedure Crossroad is
	-- Colors
	type colors is (red, redyellow, green, yellow);
	
	-- Lamp
	protected Lamp is
		procedure Switch;
      
		function Color return colors;
      
		private
		currentColor : colors := red;
	end Lamp;

	protected body Lamp is
		procedure Switch is
		begin
			if currentColor = yellow then
				currentColor := red;
			else
				currentColor := colors'Succ(currentColor);
			end if;
			
			Put_Line("Lamp switched to " & colors'Image(currentColor));
		end Switch;

		function Color return colors is
		begin
			return currentColor;
		end Color;
		
	end Lamp;

	-- Controller
	task Controller is
		entry Stop;
	end Controller;

	task body Controller is
		stopped : Boolean := false;
	begin
		while not stopped loop
			select 
				accept Stop do
					stopped := true;
				end Stop;
			or
				-- red
				delay 3.0;
				Lamp.Switch;
				-- redyellow
				delay 1.0;
				Lamp.Switch;
				-- green
				delay 3.0;
				Lamp.Switch;
				-- yellow
				delay 2.0;
				Lamp.Switch;
			end select;
		end loop;
	end Controller;

	type String_Access is access String;
	
	task type Vehicle(plate: String_Access);
  
	type Vehicle_Access is access Vehicle;

	task body Vehicle is
		crossed : Boolean := false;
	begin
		Put_Line(plate.all & " arrived");
		
		while not crossed loop
			if Lamp.Color = green then
				Put_Line(plate.all & " crossed");
				crossed := true;
			else
				Put_Line(plate.all & " waiting");
				delay 0.2;
			end if;
		end loop;
	end Vehicle;
	
	vehicles : array(1 .. 10) of Vehicle_Access;
	
	plate : String_Access;

begin
	for i in 1 .. 10 loop
		plate := new String'("CAR" & Integer'Image(i));
		vehicles(i) := new Vehicle(plate);
		delay 0.5;
	end loop;
	
	--Skip_Line();
	
	delay 15.0;
	Controller.Stop;
	
end Crossroad;
