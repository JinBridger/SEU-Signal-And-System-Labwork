% 通带和阻带截止频率
wp=0.2*pi;
ws=0.4*pi;
% 过渡带带宽
width=ws-wp;
% 滤波器阶次
N=ceil(8*pi/width);
n=0:N-1;
% 3db 截止频率
wc=(ws+wp)/2;
% 单位响应对称中心
alpha=(N-1)/2;
m=n-alpha;
% 理想低通滤波器单位响应
hd=sin(wc*m)./(pi*m);
w_ham=(hamming(N))';
% 实际滤波器单位响应
h=hd.*w_ham;
w=0:0.01:pi;
% 实际滤波器幅频特性，同时画出图像
freqz(h,1,w);
% 以下为作图
% 变为分贝单位
figure(2);
dbH=20*log10(abs(h)/max(abs(h)));
subplot(2,2,1);stem(n,hd,'.');title('理想单位响应');
xlabel('n');ylabel('hd(n)');
subplot(2,2,2);stem(n,w_ham,'.');title('海明窗');
xlabel('n');ylabel('w(n)');
subplot(2,2,3);stem(n,h,'.');title('实际单位响应');
xlabel('n');ylabel('h(n)');