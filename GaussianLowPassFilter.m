% ___________________________________________ Gaussian
function imgGLPF = GaussianLowPassFilter( img , D0 , m , n)
    % _____ Discrete Fourier Transform
    imgDFT = fft2(double(img));
    % _____ Mask
    mask = MaskConstruction(m, n);
    % _____ Filter
    H = exp(-(mask.^ 2)./(2 * (D0 ^ 2)));
    G = H.*imgDFT;
    imgGLPF = real(ifft2(double(G)));
end