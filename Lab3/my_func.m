function my_func()
%原信号
[x,fs]=audioread('firstdeath.mp3',[1,2^16]);
%sound(x,fs);
X=fft(x);
aX=abs(X);
figure;
n=length(x);
t=(0:n-1)/fs;
f_d=(0:n-1)*fs/n;
subplot(611);plot(t,x);
xlabel('s');
title('原信号时域波形图');
subplot(612);plot(f_d, X);
title('原始信号频谱');
%低通滤波
fs=44100;
f=[1000,1200];
n=[1,0];
rip=[0.05,0.01];
[N,fo,mo,w]=firpmord(f,n,rip,fs);
N=N+1;
hn=firpm(N,fo,mo,w);
z1=fftfilt(hn,x);
%sound(z1,fs);
m1=fft(z1);
subplot(613);plot(t,z1);
xlabel('s');
title('低通滤波后信号时域波形图');
subplot(614);plot(f_d, m1);
title('原低通滤波后信号频谱');
%高通滤波
rp=1;rs=100;
p=1-10.^(-rp/20);
s=10.^(-rs/20);
wp=0.9;ws=0.7;
fpts=[ws wp];
mag=[0 1];
dev=[p s];
[n3,wn3,beta,ftype]=kaiserord(fpts,mag,dev);
b3=fir1(n3,wn3,'high');
z3=fftfilt(b3,x);
%sound(z3,fs);
m3=fft(z3);
subplot(615);plot(t,z3);
xlabel('s');
title('高通滤波后信号时域波形图');
subplot(616);plot(f_d, m3);
title('高低通滤波后信号频谱');
end