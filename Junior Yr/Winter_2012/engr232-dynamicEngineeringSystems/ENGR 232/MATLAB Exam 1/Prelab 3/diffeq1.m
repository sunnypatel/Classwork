function h = diffeq1(t)
[rows_t cols_t] = size(t);
h = zeros(rows_t,cols_t);

for k = 1:numel(t)
    if t(k) <= sqrt(3)/0.0133 && t(k) >= 0
        h(k) = (-0.0133*t(k)+sqrt(3))^2;
    else
        h(k) = 0;
    end
end
