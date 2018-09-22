function img = AlternativeModeFilter( img , km, kn )
    [orgm orgn] = size(img);

    img = ResizeMatrix(img, km, kn); 
  
    [m n] = size(img); 

    for i = 1 : km : m
        for j = 1 : kn : n
            kernel = img(i : i + km - 1, j : j + kn - 1);
            kernel_ = reshape(kernel, km * kn, 1);
            kernelmode = mode(kernel_);
            img(i : i + km - 1, j : j + kn - 1) = kernelmode;
        end
    end
    
    img = img( 1 : orgm , 1 : orgn);
end

