% ___________________________________________ Low-Pass High Filter
% _____ Auxiliar function

function mask = MaskConstruction( m, n)
    u = 0 : (m - 1);
    v = 0 : (n - 1);
    idx = find( u > m/2);
    u(idx) = u(idx) - m;
    %
    idy = find( v > n / 2);
    v(idy) = v(idy) - n;
    %
    [V, U] = meshgrid(v, u);
    mask = sqrt(U.^2 + V.^2);
end
