% ___________________________________________ Butterworth
function imgBHPF = ButterworthHighPassFilter( img, D0, m, n)
    % _____ Discrete Fourier Transform
    imgDFT = fft2(double(img));
    % _____ Mask
    mask = MaskConstruction(m, n);
    % _____ Filter
    H = 1./(1 + (D0./mask).^(2 * 2));
    G = H.*imgDFT;
    imgBHPF = real(ifft2(double(G)));
end