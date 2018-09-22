% ___________________________________________ Butterworth
function imgBLPF = ButterworthLowPassFilter( img, D0, m, n)
    % _____ Discrete Fourier Transform
    imgDFT = fft2(double(img));
    % _____ Mask
    mask = MaskConstruction(m, n);
    % _____ Filter
    H = 1./(1 + (mask./D0).^(2 * 2));
    G = H.*imgDFT;
    imgBLPF = real(ifft2(double(G)));
end