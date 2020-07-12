%Aleyna Karabacakoglu 330090
%Asagida olusturdugum myrunge fonksiyonunu adim adim acikladim.

function [x]=myrunge(A,B,U,X,dt)


uzunluk=size(A);
satir=uzunluk(1);
sutun=uzunluk(2);
%------------RUNGE KUTTA 1.ADIM--------------------------
for n=1:satir
    K1(n)=0;    %  2X2 lik K1 Matrisini 0'a setledim.
    x0(n)=X(n); %parametreden aldigim  X girisini x0 a esitledim.
    
end
for n=1:satir
    for m=1:sutun
        AA(n,m)=A(n,m)*x0(m);  %A matrisindeki degerleri x ile carptim.
        BB(n)=B(n,n)*U(n);     %B matrisindeki degerleri u ile carptim.
     end
end
%Asagidaki dongunun yaptigi islem:
%x(1)=AA(1,1)*X(1)+AA(1,2)*X(2)+BB(1,1)*U(1)+B(1,2)*U(2)
%x(2)=AA(2,1)*X(1)+AA(2,2)*X(2)+BB(2,1)*U(1)+B(2,2)*U(2)
%Yukaridaki ifade matris çarpimlariyla yeni x1 ve x2 degerlerimi buldurmaya
%yarar.

for q=1:satir
    K1(q)=K1(q)+ dt*(sum(AA(q,:))+sum(BB(q)));
end
%------------RUNGE KUTTA 2.ADIM--------------------------    

for n=1:satir
    x0(n)=X(n)+K1(n)/2;  %burada yeni x degeri hesaplattim. 
    K2(n)=0; %Yeni bir deger buldurmak icin öncelikle 2x2 lik K2 matrisimi 0'a setledim.
end

for n=1:satir
    for m=1:sutun
        AA(n,m)=A(n,m)*x0(m); %Burada yine 1. adimdaki islemlerin aynisini uyguladim fakat bu sefer 
        BB(n)=B(n,n)*U(n);    %x0 degeri guncellendiginden yeni x'imiz ustunde islemler yapildi.
     end
end
for q=1:satir
    K2(q)=K2(q)+ dt*(sum(AA(q,:))+sum(BB(q)));
end
%------------RUNGE KUTTA 3.ADIM--------------------------      
for n=1:satir
    x0(n)=X(n)+K1(n)/2;
    K3(n)=0;
end
for n=1:satir
    for m=1:sutun
        AA(n,m)=A(n,m)*x0(m);
        BB(n)=B(n,n)*U(n);
     end
end
for q=1:satir
    K3(q)=K3(q)+ dt*(sum(AA(q,:))+sum(BB(q)));
end
%------------RUNGE KUTTA 4.ADIM--------------------------   
for n=1:satir
    x0(n)=X(n)+K3(n);
    K4(n)=0;
end
for n=1:satir
    for m=1:sutun
        AA(n,m)=A(n,m)*x0(m);
        BB(n)=B(n,n)*U(n);
     end
end
for q=1:satir
    K4(q)=K4(q)+ dt*(sum(AA(q,:))+sum(BB(q)));
end
%--------------------SONUC-------------------------------------    
for n=1:satir
    x(n)=X(n)+(K1(n)+2*K2(n)+2*K3(n)+K4(n))/6;    
end

