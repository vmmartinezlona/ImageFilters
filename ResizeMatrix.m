function imgResized = ResizeMatrix( img, km, kn )
 [m n] = size(img);
 
 padm = 0; padn = 0;
 % ___________________________ 
 if mod(m, km) ~= 0 
     padm = ((floor(m / km) + 1) * km) - m;
     
 end
 if mod(n, kn) ~= 0 
     padn = ((floor(n / kn) + 1) * kn) - n;
 end
 
 imgResized = img;
  
  if padm ~= 0
      for i = 1 : padm
          imgResized = [imgResized ; imgResized(m, :)];
      end
  end
  if padn ~= 0
      for i = 1 : padn
          imgResized = [imgResized, imgResized(: , n)];
      end
  end

end

