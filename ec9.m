clc;
clear all;
n=10000;
SNR=[-5 0 5 10];
source_real=randi([0,1],1,n);       
source_imag=randi([0,1],1,n);
source=source_real+1i*source_imag;
IN_QPSK=source*2-(1+1i);
for i=1:length(SNR)
    Y(i,:)=awgn(IN_QPSK,SNR(i));
end
Y_RE_real=real(Y);
Y_RE_real(Y_RE_real>0)=1;
Y_RE_real(Y_RE_real<0)=0;
Y_RE_imag=imag(Y);
Y_RE_imag(Y_RE_imag>0)=1;
Y_RE_imag(Y_RE_imag<0)=0;
Y_RE=Y_RE_real+Y_RE_imag*1i;
for i=1:length(SNR)
    Y_ERRO(i,:)=abs(Y_RE_real(i,:)-real(source))+abs(Y_RE_imag(i,:)-imag(source));
    Y_BIT(i)=sum(Y_ERRO(i,:))/(length(source)*2);
end
semilogy(SNR,Y_BIT);
grid on;
title('ÎóÂëÂÊ');

scatterplot(Y(1,:));title('SNR=-5dB');

scatterplot(Y(2,:));title('SNR=0dB');

scatterplot(Y(3,:));title('SNR=5dB');

scatterplot(Y(4,:));title('SNR=10dB');

