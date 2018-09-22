% ___________________________________________ Ideal
function imgIHPF = IdealHighPassFilter( img , D0 , m , n)
    % _____ Discrete Fourier Transform
    imgDFT = fft2(double(img));
    % _____ Mask
    mask = MaskConstruction(m, n);
    % _____ Filter
    H = double(mask <= D0);
    H = 1 - H;
    G = H.*imgDFT;
    imgIHPF = real(ifft2(double(G)));
end

