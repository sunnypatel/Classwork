function y = L3PL_b(t)

[rows_t cols_t]=size(t);
y = zeros(rows_t,cols_t);

for k = 1:numel(t)
   if t(k) <= sqrt(3)/0.0133 && t(k) >= 0
       y(k) = (-0.0133*t(k)+sqrt(3))^2;
   else
       y(k) = 0;
   end
end