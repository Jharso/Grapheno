#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define alumnos 3
#define curso 3            //considerar esta constante  -1, porque almacena en su posición 0 la ID del alumno
#define promocion 2

void gennotas(float [alumnos][curso][promocion]);
void impnotas(float [alumnos][curso][promocion]);
void ordenarnotas(float [alumnos][curso][promocion]);
void detallenotas(float [alumnos][curso][promocion]);

int main(){
    float datos[alumnos][curso][promocion];            //declaro el arreglo como float para controlar los decimales de cada nota.
      
    gennotas(datos);
    impnotas(datos);
    //ordenarnotas(datos);
    //printf("\n\n\nNOTAS ORDENADAS\n");
    //impnotas(datos);
    detallenotas(datos);

    return 0;
}

void gennotas(float datos[alumnos][curso][promocion]){
    int i,j,k;
    float id=1800,aux;
    srand(time(NULL));
    i=0;
    while(i<promocion){
        j=0;
        while(j<curso){
            k=0;            
            while(k<alumnos){
                if(j==0){
                    datos[k][j][i]=id+1;
                    id++;                
                }
                else{
                    aux=(rand()%600)+100;
                    datos[k][j][i]=aux/100;                   
                }                
                k++;
            }
            j++;
        }
        i++;
    }
}

void impnotas(float datos[alumnos][curso][promocion]){
    int i,j,k;
    i=0;
    while(i<promocion){
        j=1;
        printf("\n\n\nPromocion %i",i+1);
        while(j<curso){
            k=0;
            printf("\n\nCurso: %i",j);
            while(k<alumnos){
                printf("\nID");
                printf("\n%.0f:  %.2f \n", datos[k][0][i],datos[k][j][i]);
                k++;
            }
            j++;
        }
        i++;
    }
}

/*void ordenarnotas(float datos[alumnos][curso][promocion]){
    int i,j,k,flag,id2;
    float valor;
    i=0;
    while(i<promocion){
        j=1;
        while(j<curso){
            k=0;
            while(k<alumnos){
                id2=datos[k][0][i];
                valor=datos[k][j][i];
                flag=k;
                while(flag>0 && datos[flag-1][j][i]>valor){
                    datos[flag][j][i]=datos[flag-1][j][i];
                    datos[flag][0][i]=datos[flag-1][0][i];
                    flag--;                    
                }                
                datos[flag][j][i]=valor;
                datos[flag][0][i]=id2;
                k++;
            } 
            j++;               
        }
        i++;
    }    
}

void detallenotas(float datos[alumnos][curso][promocion]){
    //El mejor y peor alumno por año con su ID
    //La mejor y peor nota por año con su ID
    int i,j,k;
    float ma,pa,paid,maid,maprom;
    i=0;
    ma=0;
    maid=0;
    while(i<promocion){
        j=1;        
        ma=datos[k][j][i];
        maid=datos[k][0][i];
        while(j<curso){
            k=0;            
            while(k<alumnos){
                            
                if(datos[k][j][i]>ma){
                    ma=datos[alumnos-1][j][i];
                    maid=datos[alumnos-1][0][i];
                    //pa=datos[0][j][i];
                    //paid=datos[0][0][i];
                    maprom=i;
                    }
                    k++;                
            }        
            j++;  
            printf("\nMAID: %.0f",maid);    
            printf("\nMAa: %.2f\n",ma); 
        }
        printf("\nLa mejor nota de la promoción %i es: %.2f correspondiente al alumno ID: %.0f",i+1,ma,maid);
        printf("\nLa peor nota de la promoción %i es: %.2f correspondiente al alumno ID: %.0f\n",i+1,pa,paid);
        i++;
    }
    printf("\nLa mejor calificación de todos los cursos y todas las promociones es: Alumno ID: %.0f, nota: %.2f, promocion %.0f.\n",maid,ma,maprom+1);

}*/

void detallenotas(float datos[alumnos][curso][promocion]){
    //El mejor y peor alumno por año con su ID
    //La mejor y peor nota por año con su ID
    int i,j,k,z,d=curso-1;
    float ma,maid,mn,mnid,prom1[alumnos][2]={0};
    i=0,    j=1,    k=0;    
    while(i<promocion){
        j=1,        mn=0,        mnid=0;
        while(j<curso){            
            k=0;
            while(k<alumnos){               
                if(datos[k][j][i]>mn){
                    mn=datos[k][j][i];
                    mnid=datos[k][0][i];
                }               
                k++;
            }
            j++;            
        }  

        printf("\nLa mejor nota del año %i es: %.2f del alumno ID: %.0f", i+1, mn, mnid);        
        i++;
    }
    i=0,    j=1,    k=0;    
    while(i<promocion){
        j=1;
        mn=7;
        mnid=7;
        while(j<curso){            
            k=0;
            while(k<alumnos){               
                if(datos[k][j][i]<mn){                                //solo cambia evaluación lógica para buscar el menor
                    mn=datos[k][j][i];
                    mnid=datos[k][0][i];                    
                }              
                k++;
            }
            j++;            
        }           
        printf("\nLa peor nota del año %i es: %.2f del alumno ID: %.0f", i+1, mn, mnid);
        i++;
    }
    
    i=0;   
    while(i<promocion){
        j=1;  z=0;
        while(z<alumnos){
            prom1[z][1]=0;
            prom1[z][0]=0;
            z++;
        }        
        ma=0;
        maid=0;
        while(j<curso){
            printf("\n");
            k=0;
            while(k<alumnos){
                printf("\nalumno n° %i ",k);  
                printf("\n promedio en arreglo prom1 sin sumar 1 ID: %.0f  %.2f",prom1[k][0],prom1[k][1]);              
                prom1[k][1]=prom1[k][1]+datos[k][j][i];
                prom1[k][0]=datos[k][0][i];                    
                printf("\n promedio en arreglo datos           2 ID: %.0f  %.2f",datos[k][0][i],datos[k][j][i]);            
                printf("\n promedio en arreglo prom1           3 ID: %.0f  %.2f\n",prom1[k][0],prom1[k][1]);
                k++;               
                
            }
            j++;        
        }
        
        z=0;
        while(z<alumnos){
            prom1[z][1]=prom1[z][1]/d;
            printf("\npromedio en arreglo 4 %.2f",prom1[z][1]);
            z++;
        }        
        z=0;
        while(z<alumnos){
            
            if(prom1[z][1]>ma){
                ma=prom1[z][1];
                maid=prom1[z][0];
            }
            
                
            printf("\nvalor de ma %.2f",ma);
            z++;
        }   
        printf("\nEl alumno ID:%.0f del año: %i, es el mejor alumno con promedio: %.2f", maid, i+1, ma); 
        i++;                
    }                 
}
