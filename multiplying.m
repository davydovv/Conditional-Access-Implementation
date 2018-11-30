function x = multiplying(A, B, n)
C = A;
for i=1:1:8
    for j=1:1:8
        if ((i >= n(i,j))||(j >= n(i,j)))
            C(i,j) = A(i,j) * B(i,j);
        end
    end
end
x = C;