f = input('输入 f');
N = input('输入 N');
T = input('输入 T');
fillZero = input('输入补零个数');
x1 = x(f, N, T);
if (fillZero > 0)
    x1 = [x1, zeros(1, fillZero)];
    N = N + fillZero;
end
ret=myfft(x1);
ret=ret(1:N);
disp(ret);
ret=abs(ret);
ret=ret/max(ret);
freq=(0:N-1);
stem(freq,abs(ret),'filled')
xlabel('k');
ylabel('幅度');

function u = usig(n)
    if (n >= 0)
        u = 1;
    else
        u = 0;
    end
end

function x = x(f, N, T)
    n = (0:N-1);
    x = (usig(n) - usig(n - N)) * sinpi(2 * f * n * T);
end

function ret=W(N, n)
    ret=exp(-1i*2*pi/N*n);
end

function ret=myfft(x)
    sz = size(x,2);
    ret=zeros(1,size(x,2));
    if (size(x,2) == 2)
        ret = [x(1)+x(2), x(1)-x(2)];
        return
    end
    odd=myfft(x(1:2:size(x,2)));
    even=myfft(x(2:2:size(x,2)));
    for n = 1:sz/2
        ret(n)=odd(n)+even(n)*W(sz, n-1);
        ret(n+sz/2)=odd(n)-even(n)*W(sz, n-1);
    end
    return
end