% ___________________________________________ Ideal
function imgILPF = IdealLowPassFilter( img , D0 , m , n)
    % _____ Discrete Fourier Transform
    imgDFT = fft2(double(img));
    % _____ Mask
    mask = MaskConstruction(m, n);
    % _____ Filter
    H = double(mask <= D0);
    G = H.*imgDFT;
    imgILPF = real(ifft2(double(G)));
end




