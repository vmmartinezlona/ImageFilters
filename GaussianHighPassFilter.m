% ___________________________________________ Gaussian
function imgGHPF = GaussianHighPassFilter( img , D0 , m , n)
    % _____ Discrete Fourier Transform
    imgDFT = fft2(double(img));
    % _____ Mask
    mask = MaskConstruction(m, n);
    % _____ Filter
    H = exp(-(mask.^ 2)./(2 * (D0 ^ 2)));
    H = 1 - H;
    G = H.*imgDFT;
    imgGHPF = real(ifft2(double(G)));
end
