function[] = bublP
 format long;
 %declaracion de variables globales
 x = 0:0.5:1;   % vector que contiene los valores de x
 tEnCelsius = 25; % temperatura en °C
 tEnKelvin = 298.15; % temperatura en °K
 r = 62363.32;
 a12 = 704.4473;
 a21 = -704.9553;
 alfa12 = 0.4278;
 %...........Valores agua..................................
 tc1 = 647;
 pc1 = 165376;
 vc1 = 56;
 w1 = 0.344;
 momentoDipolar1 = 1.8;
 A1 = 8.07131;
 B1 = 1730.63;
 C1 = 233.426;
 %...........Valores glicerina.............................
 tc2 = 726;
 pc2 = 50160;
 vc2 = 255;
 w2 = 0;
 momentoDipolar2 = 3;
 A2 = 8.069;
 B2 = 2352.252;
 C2 = 164.732;
 
 %-----------Calculo p1 y p2 saturación-------------------
 p1sat = calculop1sat();
 p2sat = calculop2sat();
 %-----------Calculo de gamas-----------------------------
 t12 = a12/(r*tEnKelvin);
 t21 = a21/(r*tEnKelvin);
 g12 = 1.000016199;
 g21 = 0.999983789;
 matrizXyGama = [x;1-x;zeros(1,length(x));zeros(1,length(x))];
 obtenerGamas();
 %primer valor de p*
 arregloP = obtenerp();         %arreglo que contiene los p calculados
 pasterisco = sumarArreglo(arregloP);
 arregloY1 = obtenerY();                    %arreglo con los valores y1 
 arregloY2 = 1-arregloY1;                   %arreglo con los valores y2
 sumatoriaY1 = sumarArreglo(arregloY1);
 sumatoriaY2 = sumarArreglo(arregloY2);
 
 y1Normalizado = arregloY1/sumatoriaY1;        % y1 normalizados
 y2Normalizado = arregloY2/sumatoriaY2;        % y2 normalizados
 
 
 %-----------Calcular valores fi-------------------------
 n1fa = 0;
 b11 = obtenerB11();
 n2fa = 0;
 b22 = obtenerB22();
 b12 = obtenerB12();
 delta12 = 2*b12-b11-b22;
 %disp(delta12);
 fi = obtenerFi();
 %disp(fi);
 arregloPverdadera = pverdadera();
 disp(arregloPverdadera);
 pver = sumarArreglo(arregloPverdadera);        %sumatoria p verdadera
 %----------------calculo del p--------------------------
 tolerancia = 0.01;
 error = abs(pver-pasterisco)/pver;
 disp(error);
 while error > tolerancia 
    arregloP = pverdadera();
    pasterisco = sumarArreglo(arregloP);
    arregloY1 = obtenerY();
    arregloY2 = 1-arregloY1;
    sumatoriaY1 = sumarArreglo(arregloY1);
    
    sumatoriaY2 = sumarArreglo(arregloY2);
    y1Normalizado = arregloY1/sumatoriaY1;        % y1 normalizados
    y2Normalizado = arregloY2/sumatoriaY2;
    fi = obtenerFi();
    
    arregloPverdadera = pverdadera();
    pver = sumarArreglo(arregloPverdadera);
    error = abs(pver-pasterisco)/pver;
    
 end 
 
 pexp = [0.33,2.82,4.00,4.43,5.93,7.45,8.86,9.96,10.96,13.50,14.23,15.69,18.0,18.75,20.15,20.91,22.11,22.56,23.00,23.76];
 xexp = [0.0191, 0.1526, 0.2184, 0.2362, 0.3179,0.3818, 0.4490, 0.4948, 0.5384, 0.6230, 0.6589, 0.7058, 0.7902, 0.8180, 0.8684, 0.8921, 0.9368, 0.9524, 0.9667, 1];
 
  plot(x,arregloPverdadera,y1Normalizado, arregloPverdadera,xexp, pexp,'--')
    xlabel('xcalculado,ycalculado,xexp')
    ylabel('P')
    title('Destilación extractiva agua-glicerina (DATOS CALCULADOS Y EXPERIMENTALES)')
    
 
 
 %------------------FUNCIONES AUXILIARES------------------
 
 % función que calcula p1 saturado        
    function p1 = calculop1sat()
        p1 = 10^(A1-(B1/(tEnCelsius+C1)));
    end
 % funcion que calcula p2 saturado        
    function p2 = calculop2sat()
        p2 = 10^(A2-(B2/(tEnCelsius+C2)));
    end
 % funcion que almacena en la matrizXySigma los valores de x1, x2, sigma 1
 % y sigma 2
    function [] = obtenerGamas()
        for i=1: +1: length(x)
            %formula gama 1:
            auxGama1Izquierda = t21*(g21/(matrizXyGama(1,i)+ matrizXyGama(2,i)*g21))^2;
            auxGama1Derecha = (t12*g12)/((matrizXyGama(2,i)+(matrizXyGama(1,i)*g12))^2);
            gama1 = 10^((auxGama1Derecha+ auxGama1Izquierda)*matrizXyGama(2,i)^2 );
            auxGama2Izquierda = t12*(g12/(matrizXyGama(2,i)+ matrizXyGama(1,i)*g12))^2;
            auxGama2Derecha = (t21*g21)/((matrizXyGama(1,i)+(matrizXyGama(2,i)*g21))^2);
            gama2 = 10^((auxGama2Izquierda+auxGama2Derecha)* matrizXyGama(1,i)^2);
            matrizXyGama(3,i) = gama1;
            matrizXyGama(4,i) = gama2;
        end        
    end

 % función que obtiene los p                
    function p = obtenerp()
        p = zeros(1,length(x));
        for i=1:+1:length(x)
            p(i)= double(matrizXyGama(1,i)*matrizXyGama(3,i)*p1sat + matrizXyGama(2,i)*matrizXyGama(4,i)*p2sat);
        end
    end
 % funcion que suma un arreglo
    function suma = sumarArreglo(arreglo)
        suma = 0;
        for i=1:+1:length(arreglo)
            suma = suma+arreglo(i);
        end
    end

% funcion que obtiene los y 
    function y = obtenerY()
       y = zeros(1,length(x));
       for i=1: +1:length(x)
           y(i) = (matrizXyGama(1,i)*matrizXyGama(3,i)*p1sat)/pasterisco;
       end
    end

 % función que obtiene los fi1 y fi2
    function fi = obtenerFi()
        fi = zeros(2,length(x));
        for i=1: +1:length(x)
           fi(1,i) = exp((b11*(arregloP(i)-p1sat)+arregloP(i)*(y2Normalizado(i)^2)*delta12)/(r*tEnKelvin));
           fi(2,i) = exp((b22*(arregloP(i)-p2sat)+arregloP(i)*(y1Normalizado(i)^2)*delta12)/(r*tEnKelvin));
       end
    end

 % funcion que calcula B11
    function calb11 = obtenerB11()
        tr = tEnKelvin/tc1;
        wh = 0.344;
        n1fa = exp(6.6*(0.7-tr));
        fb1= 0.073+(0.46/tr)-(0.5/(tr^2))-(0.097/(tr^3))-(0.0073/(tr^8));
        fb0 = 0.1445-(0.33/tr)-(0.1385/(tr^2)) - (0.0121/(tr^3));
        b = (r*tc1)/pc1;
        aux = fb0 + (wh*fb1)+n1fa; 
        calb11 = b*aux;
    end
 % función que calcula B22
    function calb22 = obtenerB22()
        tr = tEnKelvin/tc2;
        wh = 0.152;
        n2fa = exp(6.6*(0.7-tr));
        fb1= 0.073+(0.46/tr)-(0.5/(tr^2))-(0.097/(tr^3))-(0.0073/(tr^8));
        fb0 = 0.1445-(0.33/tr)-(0.1385/(tr^2)) - (0.0121/(tr^3));
        b = (r*tc2)/pc2;
        aux = fb0 + (wh*fb1)+n2fa; 
        calb22 = b*aux;
    end
 % función que calcula B12
    function calb12 = obtenerB12()
         tc12 = (tc1*tc2)^(1/2);
         w12 = (0.344+0.152)/2;
         tr12 = tEnKelvin/tc12;
         pc12 = (4*tc12)*((((pc1*vc1)/tc1)+(pc2*vc2)/tc2)/(((vc1^(1/3))+(vc2^(1/3)))^3));
         f1= 0.073+(0.46/tr12)-(0.5/(tr12^2))-(0.097/(tr12^3))-(0.0073/(tr12^8));
         f0 = 0.1445-(0.33/tr12)-(0.1385/(tr12^2)) - (0.0121/(tr12^3));
         n12fa = exp(6.6*(0.7-tr12));
         calb12 = f0+(w12*f1*n12fa); %donde se utiliza b?
    end
    
 % calcular pverdadera                         
    function p = pverdadera()
        p = zeros(1,length(x));
        for i=1:+1:length(x)
            p(i)= ((matrizXyGama(1,i)*matrizXyGama(3,i)*p1sat)/fi(1,i)) + (matrizXyGama(2,i)*matrizXyGama(4,i)*p2sat)/fi(2,i);
        end
    end
end
