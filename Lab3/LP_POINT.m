%%%%%%%%%%%%%%%%%%%%%%%%% 加一个过渡点
N=33;n=0:N-1;wc=pi/2;T1=0.4;T2=0.6;T3=0.1;
%3db 截止频率对应采样点
M1=fix(wc/(2*pi/N));
M2=N-2*M1-1;
%理想低通滤波器对应频域采样序列
A1=[ones(1,M1),T1,zeros(1,M2),T1,ones(1,M1-1)];
%第一类线性相位的相角
theta1=-pi*(0:N-1)*(N-1)/N;
%频率采样法得到的 FIR 滤波器的频域序列
Hk1=A1.*exp(1i*theta1);
%频率采样法得到的 FIR 滤波器的单位响应
h1=real(ifft(Hk1));
%频率采样法得到的 FIR 滤波器的幅频响应
[H1, w1]=freqz(h1,1);
%%%%%%%%%%%%%%%%%%%%%%%%% 加两个个过渡点
A2=[ones(1,M1),T2,T3,zeros(1,M2-2),T3,T2,ones(1,M1-1)];
%第一类线性相位的相角
theta2=-pi*(0:N-1)*(N-1)/N;
%频率采样法得到的 FIR 滤波器的频域序列
Hk2=A2.*exp(1i*theta2);
%频率采样法得到的 FIR 滤波器的单位响应
h2=real(ifft(Hk2));
%频率采样法得到的 FIR 滤波器的幅频响应
[H2, w2]=freqz(h2,1);
%%%%%%%%%%%%%%%%%%%%%%%%% 画图
dbH1=20*log10(abs(H1)/max(abs(H1)));
dbH2=20*log10(abs(H2)/max(abs(H2)));
subplot(1,2,1);plot(w1/pi,abs(H1),w2/pi,abs(H2),'r');
grid
xlabel('频率(单位\pi)');ylabel('H(e^{j\omega})');
subplot(1,2,2);plot(w1/pi,dbH1,w2/pi,dbH2,'r');
grid
xlabel('频率(单位\pi)');ylabel('H(e^{j\omega})');