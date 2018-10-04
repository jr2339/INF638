syms x
P = x^8 + x^4 + x^3 + x +1;
B_0 = 0;
B_5 = 0;
B_10 = 0;
B_15 = 0;

a = 1;
b = x;
c = x+1;

L_0 = [0 1 0 1 1 0 0 0];
L_0 = fliplr(L_0);

for i = 1:length(L_0)
    B_0 = B_0 + L_0(i)* power(x,i-1);
end


L_5 = [1 1 0 1 0 0 0 1];
L_5 = fliplr(L_5);
for i = 1:length(L_5)
    B_5 = B_5 + L_5(i)* power(x,i-1);
end



L_10 = [1 0 1 1 1 0 1 0];
L_10 = fliplr(L_10);
for i = 1:length(L_10)
    B_10 = B_10 + L_10(i)* power(x,i-1);
end



L_15 = [1 1 1 0 0 0 1 1];
L_15 = fliplr(L_15);
for i = 1:length(L_15)
    B_15 = B_15 + L_15(i)* power(x,i-1);
end


A = [b,c,a,a;a,b,c,a;a,a,b,c;c,a,a,b];

B = [B_0;B_5;B_10;B_15];

C = A * B;
C = simplify(C);
disp(C)
disp("============================================")


for i = 1: size(C,1)
    coefficient = sym2poly(C(i));
    coefficient = rem(coefficient,2);
    C(i) = poly2sym(coefficient);
end

[q,r] = quorem(C,P);

for i = 1: size(r,1)
    coefficient = sym2poly(r(i));

    for j = 1:length(coefficient)
        if coefficient(j) < 0
            coefficient(j) = coefficient(j) +  2*(abs(coefficient(j)/2)) + 1; 
        end
     
    end
  
    r(i) = poly2sym(coefficient);
end


disp(r)


for i = 1: size(r,1)
    coefficient = sym2poly(r(i));
    if length(coefficient) < 8
        v = zeros(1,8-length(coefficient));
        coefficient =cat(2,coefficient,v);
    
    end
    disp(coefficient)
end









