function r = round_function(encrpt_key, r)

    % Shifting
    encrpt_key = circshift(encrpt_key,[0,3]);
    
    % Byte Substitution
    out_byte = byte_subs(encrpt_key,'e');

    % Round coefficient values.
    switch (r)
       case 1
          RC = 1;
       case 2
          RC = 2;
       case 3
          RC = 4;
       case 4
          RC = 8;
       case 5
          RC = 16;
       case 6
          RC = 32;
       case 7
          RC = 64;
       case 8
          RC = 128;
       case 9
          RC = 27;
       case 10
          RC = 54;     
       otherwise
          disp('Maximum round exceeded.')
    end
    % Output
    r = [bitxor(out_byte(1),RC) out_byte(2) out_byte(3) out_byte(4)];

end

