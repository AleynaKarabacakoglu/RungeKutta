%Aleyna Karabacakoglu 
%RUNGE KUTTE DEGISKENLER?N?N ZAMANA GORE CIZDIRILMESI
A=[ -3 -3; 1 -9];   % A - durum matrisi
B=[1 0; 0 1];       %B - giris katsayi vektörü
C=[ 1 0]; 
u1=100.0; 
u2=0;
dt=0.01;            % dt :zamana gore artis
tend=1;             %tend dongudeki bitis suresini verir(zaman siniri)
t0=0;               %baslangic zamani= t0
k=1;    
u=[u1;u2];          %u1 ve u2 degerleri ile U matrisi olusturdum.
BOY=size(A);        %A matrisinin boyu hesaplandi.
satir=BOY(1); 
sutun=BOY(2);

for n=1:satir
    x0(n)=0;  %x  matrisi olusturup 0'a setledim.
end;



while t0<tend    
    [x]=myrunge(A,B,u,x0,dt);
    x1(k)=x(1);
    x2(k)=x(2);
    x0=x;
    t(k)=t0+dt;
    t0=t(k);
    k=k+1;
       
end;
subplot(211)
plot(t,x1);                 %x1 ve x2 degiskenlerini zamana gore cizdirdim.
title('x1');
xlabel('time in seconds');
ylabel('x1');
grid
subplot(212)
plot(t,x2);
title('x2');
xlabel('time in seconds');
ylabel('x2');
grid



