% my_conv

function result = my_conv(x, h)
    rev_h = fliplr(h);
    res_len = length(x) + length(h) - 1;
    result = zeros(1, res_len);
    for n = 1:1:res_len
        for t = length(rev_h):-1:1
            i = n + t - length(rev_h);
            if i >= 1 && i <= length(x)
                result(n) = result(n) + rev_h(t) * x(i);
            end
        end
    end
    x_axis = (0:res_len-1);
    stem(x_axis, result, "filled");
end