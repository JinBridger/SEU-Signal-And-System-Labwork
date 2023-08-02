% Pascal's Triangle

function pascal_triangle(x)
    pascal_mat = zeros(x);
    pascal_mat(1, 1) = 1;
    fprintf('1\n')
    for l = 2:1:x
        for c = 1:1:l
            if c == 1 || c == l
                pascal_mat(l, c) = 1;
            else
                pascal_mat(l, c) = pascal_mat(l-1, c-1) + pascal_mat(l-1, c);
            end
            fprintf('%d ', pascal_mat(l, c));
        end
        fprintf('\n');
    end
end