clc;clear;
% 读取音频信号
[x,fs]=audioread('firstdeath.mp3',[1,2^16]);
x=(x(:,1))';
% 求出信号长度
% 频域变换
FS=length(x);
% 求解 DFT
X=myfft(x);
% 求解时间
t=(0:FS-1)/fs;
figure(1)
% 绘制时域波形
subplot(4,1,1);plot(t,x);
title('原始语音信号时域波形');
xlabel('时间');
ylabel('幅值');
grid on;
% 绘制频域波形
yy=abs(X);
subplot(4,1,2);plot(yy(1:length(yy)/2));
axis([0 length(yy)/2 0 2000]);
title('原始语音信号频谱');
xlabel('频率');
ylabel('幅度');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%% 低通滤波
% 性能指标
Fp=1000;
Fs=1200;
Ft=130000;
As=100;
Ap=1;
% 频率归一化
wp=2*pi*Fp/Ft;
ws=2*pi*Fs/Ft;
% 求解阶数和截止频率
[n,wn]=ellipord(wp,ws,Ap,As);
% 运用 FIR 函数完成设计
hn=fir1(n-1,wn,hann(n));
% 完成滤波
y1=filter(hn,1,x);
% 绘制时域波形
subplot(4,1,3);plot(t,y1);
title('低通滤波后信号时域波形');
xlabel('时间');
ylabel('幅值');
grid on;
% 绘制频域波形
yy=abs(fft(y1));
subplot(4,1,4);plot(yy(1:length(yy)/2));
axis([0 length(yy)/2 0 2000]);
title('低通滤波后信号频谱');
xlabel('频率');
ylabel('幅度');
%%%%%%%%%%%%%%%%%%%%%%%% 高通滤波
figure(2)
% 绘制时域波形
subplot(4,1,1);plot(t,x);
title('原始语音信号时域波形');
xlabel('时间');
ylabel('幅值');
grid on;
% 绘制频域波形
yy=abs(X);
subplot(4,1,2);plot(yy(1:length(yy)/2));
axis([0 length(yy)/2 0 2000]);
title('原始语音信号频谱');
xlabel('频率');
ylabel('幅度');
grid on;
% 高通滤波
% 性能指标
Fp=4800;
Fs=5000;
Ft=130000;
As=100;
Ap=1;
% 频率归一化
wp=2*pi*Fp/Ft;
ws=2*pi*Fs/Ft;
% 求解阶数和截止频率
[n,wn]=ellipord(wp,ws,Ap,As);
% 运用 FIR 函数完成设计
hn=fir1(n-1,wn,'high',hann(n));
% 完成滤波
y2=filter(hn,1,x);
% 绘制时域波形
subplot(4,1,3);plot(t,y2);
title('高通滤波后信号时域波形');
xlabel('时间');
ylabel('赋值');
grid on;
% 绘制频域波形
yy=abs(fft(y2));
subplot(4,1,4);plot(yy(1:length(yy)/2));
axis([0 length(yy)/2 0 2000]);
title('高通滤波后信号频谱');
xlabel('频率');
ylabel('幅度');
%%%%%%%%%%%%%%%%%%%%%%%% 实验二中完成的 FFT
function ret=W(N, n)
ret=exp(-1i*2*pi/N*n);
end
function ret=myfft(x)
% 补齐为 2 的幂次倍长度
sz = size(x,2);
% 存储结果
ret=zeros(1,size(x,2));
% 边界情况,只有两个元素
if (size(x,2) == 2)
ret = [x(1)+x(2), x(1)-x(2)];
return
end
% 求奇偶子序列的 DFT
odd=myfft(x(1:2:size(x,2)));
even=myfft(x(2:2:size(x,2)));
for n = 1:sz/2
% 按照公式叠加
ret(n)=odd(n)+even(n)*W(sz, n-1);
ret(n+sz/2)=odd(n)-even(n)*W(sz, n-1);
end
return
end
