function z = deriv(fx)

x = fx(2:end);
y = fx(1:end-1);
z = x-y;

end