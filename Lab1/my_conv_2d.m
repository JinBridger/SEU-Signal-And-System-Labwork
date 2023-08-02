% my_conv_2d

function result = my_conv_2d(x, h)
    % add padding
    h_size = size(h);
    x_size = size(x);
    padd_l = h_size(1) - 1;
    padd_c = h_size(2) - 1;
    x_l = x_size(1);
    x_c = x_size(2);
    padd_x = zeros(padd_l * 2 + x_l, padd_c * 2 + x_c);
    for i = padd_l + 1:1:padd_l + x_l
        for j = padd_c + 1:1:padd_c + x_c
            padd_x(i, j) = x(i - padd_l, j - padd_c);
        end
    end

    % begin conv
    result = zeros(padd_l + x_l, padd_c + x_c);

    for i = 1:1:padd_l + x_l
        for j = 1:1:padd_c + x_c
            for m = 1:1:h_size(1)
                for n = 1:1:h_size(2)
                    result(i, j) = result(i, j) + padd_x(i + m - 1, j + n - 1) * h(m, n);
                end
            end
        end
    end
end