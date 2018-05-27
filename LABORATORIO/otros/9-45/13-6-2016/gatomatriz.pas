program gato_de_matriz;
uses Crt;
type matriz=array [1..3,1..3]of char;
Procedure fichas(var ficha_jugador,ficha_maquina:char);
begin
        writeln('............bienvenido al juego del gato');
        writeln;
        writeln('porfabor elegir ficha ya sea X / O');{inicio modulo 1 elegir ficha}
	read (ficha_jugador) ;
        while((ficha_jugador<>'X')and(ficha_jugador<>'O'))do
        begin
                writeln ('error solo se permite ingresar X / O');
    		read (ficha_jugador);
        end;{fin while}
	if(ficha_jugador='X')then
        begin
		ficha_maquina:='O' ;
        end
        else
        begin
		ficha_maquina:='X' ;	
        end;
end;{fin modulo 1 elegir ficha}
procedure turno(var flag:integer);
var turno:Integer;
begin
        writeln ('elija turno en el cual empesar  1 o 2');{inicio modulo 2 elegir turno}
        read (turno);
        while((turno<>1)and(turno<>2))do
        begin 
	        writeln ('ingrese turno 1 si quiere empezar o  2 si quiere el segundo turno');
		readln (turno);
	end;
        if (turno=1)then
        begin
                flag:=1 ;
        end
	else
	begin
	        flag:=0 ;
        end;
end;{fin de elejir turno}
procedure gato(var mat:matriz);
var i,j:integer; 
begin
        i:=1;j:=1;
	while(i<=3)do
    begin
        while(j<=3)do
        begin
            mat[i,j]:='_';j:=j+1;
        end;
        i:=i+1;j:=1;
    end;
end;
   
procedure tablero(mat:matriz);
begin
	writeln();
	writeln(mat[1,1],' | ',mat[2,1],' | ',mat[3,1]);
	writeln('__|___|__');
	writeln(mat[1,2],' | ',mat[2,2],' | ',mat[3,2]);
	writeln('__|___|__');
	writeln(mat[1,3],' | ',mat[2,3],' | ',mat[3,3]);
	writeln('  |   |  ');
        writeln;
        writeln('--------------------------------------');
        writeln;
        writeln();
        writeln(' 1 | 2 | 3 ');
        writeln('___|___|___');
	 	writeln(' 4 | 5 | 6 ');
	    writeln('___|___|___');
        writeln(' 7 | 8 | 9 ');
	    writeln('   |   |   ');
end;
procedure turno_jugador(var flag:integer ; var mat:matriz; ficha_jugador:char);
var   i,j,casilla:integer;
begin
     tablero(mat);
    while(flag=1)do
    begin
        writeln('ingrese casilla del 1 al 9');
        readln(casilla);
        i:=0;j:=0;
        while((casilla>9)or(casilla<1))do
        begin
            writeln('error la casilla tiene que ser del 1 al 9');
            readln (casilla);
        end;
        if (casilla=1)then
        begin
            i:=1;j:=1;
        end; 
        if (casilla=2)then
        begin
            i:=2;j:=1;
        end; 
        if (casilla=3)then
        begin
            i:=3;j:=1;
        end;
        if (casilla=4)then
        begin
            i:=1;j:=2;
        end;
        if (casilla=5)then
        begin
            i:=2;j:=2;
        end;
        if (casilla=6)then
        begin
            i:=3;j:=2;
        end;
        if (casilla=7)then
        begin
            i:=1;j:=3;
        end; 
        if (casilla=8)then
        begin
            i:=2;j:=3;
        end;
        if (casilla=9)then
        begin
            i:=3;j:=3;
        end;
        if(mat[i,j]='_')then
        begin
            flag:=0;mat[i,j]:=ficha_jugador;
        end
        else
        begin
            writeln('ERROR , la casilla esta ocupada  ');
        end;
    end;   
end;   
procedure turno_maquina(var flag:integer ; var mat:matriz; ficha_maquina:char);
var i,j:integer;
begin
        tablero(mat);
        while(flag=0)do
        begin
            i:=1;j:=1;
            while (j<=3)do
            begin
                i:=1;
                while(i<=3)do
                begin
                    if (mat[i,j]='_')then
                    begin
                        mat[i,j]:=ficha_maquina;flag:=1;i:=4;j:=4;
                    end
                    else
                    begin
                        if(i<=3)then
                        begin
                            i:=i+1;
                        end;
                    end;
                end;
                if(j<3)then
                begin
                    j:=j+1;
                end;
            end;
        end; 
end;
procedure empate_ganar(var ganador:integer; var empate:integer; var mat:matriz); 
begin
    if((mat[1,1]=mat[1,2])and(mat[1,2]=mat[1,3])and(mat[1,1]<>'_'))then 
    begin
        ganador:=1;
    end;
    if((mat[1,2]=mat[2,2])and(mat[1,2]=mat[3,2])and(mat[1,2]<>'_'))then 
    begin
        ganador:=1;
    end;
    if((mat[1,3]=mat[2,3])and(mat[3,3]=mat[1,3])and(mat[1,3]<>'_'))then 
    begin
        ganador:=1;
    end;
    if((mat[2,1]=mat[2,2])and(mat[2,3]=mat[2,1])and(mat[2,1]<>'_'))then 
    begin
        ganador:=1;
    end;
    if((mat[3,1]=mat[3,2])and(mat[3,3]=mat[3,2])and(mat[3,2]<>'_'))then 
    begin
        ganador:=1;
    end;
    if((mat[1,1]=mat[2,1])and(mat[2,1]=mat[3,1])and(mat[1,1]<>'_'))then 
    begin
        ganador:=1;
    end;
    if((mat[1,1]=mat[2,2])and(mat[2,2]=mat[3,3])and(mat[1,1]<>'_'))then 
    begin
        ganador:=1;
    end;
    if((mat[3,1]=mat[1,3])and(mat[2,2]=mat[1,3])and(mat[3,1]<>'_'))then 
    begin
        ganador:=1;
    end;
    if(ganador=0)then
    begin         
        if((mat[1,1]<>'_')and(mat[1,2]<>'_')and(mat[1,3]<>'_')and(mat[2,1]<>'_')and(mat[2,2]<>'_')and(mat[2,3]<>'_')and(mat[3,1]<>'_')and(mat[3,2]<>'_')and(mat[3,3]<>'_'))then
        begin
            empate:=1;
        end;
    end;
end;            
var empate,ganador,flag:integer;mat:matriz;ficha_jugador,ficha_maquina:char; 
begin
    empate:=0; ganador:=0; fichas(ficha_jugador,ficha_maquina);turno(flag); gato(mat);
    while((empate=0) and (ganador=0))do
    begin
        if(flag=1)then
        begin
        	turno_jugador(flag,mat,ficha_jugador);
        end
       	else
       	begin
       		turno_maquina(flag,mat,ficha_maquina);
       	end;
       	 empate_ganar(ganador,empate,mat);
    end;
    if(ganador=1)then
    begin
        if(flag=0)then
        begin        
            writeln('ganaste :D');
        end
        else
        begin
            writeln('perdiste >.<');
        end;
    end
    else
    begin
        writeln('empate ');
    end;
end.
