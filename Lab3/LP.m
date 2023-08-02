N1=33;
n1=0:N1-1;
wc=pi/2;
%3db 截止频率对应采样点
M1=fix(wc/(2*pi/N1));
M2=N1-2*M1-1;
%理想低通滤波器对应频域采样序列
A1=[ones(1,M1+1),zeros(1,M2),ones(1,M1)];
%第一类线性相位的相角
theta1=-pi*(N1-1)/N1*(0:N1-1);
%频率采样法得到的 FIR 滤波器的频域序列
Hk1=A1.*exp(1i*theta1);
%频率采样法得到的 FIR 滤波器的单位响应
h1=real(ifft(Hk1));
%频率采样法得到的 FIR 滤波器的幅频响应
[H1,w1]=freqz(h1,1);
K1=(N1-1)/2;wal=(0:K1-1)/K1;
%%%%%%%%%%%%%%%%%%%%%%%%% 画图
subplot(2,2,1);plot(wal,A1(1:K1),'-',w1/pi,abs(H1));
xlabel('频率(单位\pi)');ylabel('H(e^{j\omega})');
subplot(2,2,3);stem(n1,h1,'.');title('实际滤波器的单位响应');
xlabel('n');ylabel('h1(n)');
N1=63;
n1=0:N1-1;
wc=pi/2;
%3db 截止频率对应采样点
M1=fix(wc/(2*pi/N1));
M2=N1-2*M1-1;
%理想低通滤波器对应频域采样序列
A1=[ones(1,M1+1),zeros(1,M2),ones(1,M1)];
%第一类线性相位的相角
theta1=-pi*(N1-1)/N1*(0:N1-1);
%频率采样法得到的 FIR 滤波器的频域序列
Hk1=A1.*exp(1i*theta1);
%频率采样法得到的 FIR 滤波器的单位响应
h1=real(ifft(Hk1));
%频率采样法得到的 FIR 滤波器的幅频响应
[H1,w1]=freqz(h1,1);
K1=(N1-1)/2;wal=(0:K1-1)/K1;
%%%%%%%%%%%%%%%%%%%%%%%%% 画图
subplot(2,2,2);plot(wal,A1(1:K1),'-',w1/pi,abs(H1));
xlabel('频率(单位\pi)');ylabel('H(e^{j\omega})');
subplot(2,2,4);stem(n1,h1,'.');title('实际滤波器的单位响应');
xlabel('n');ylabel('h1(n)');