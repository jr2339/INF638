function out_byte = byte_subs(input,encoding )

    global  sbox_table inv_sbox_table; 

    out_byte = zeros(1,length(input));


    if(encoding == 'e')
        
        % Byte substitution
        for i = 1:length(input)
            hexnum = dec2hex(input(i));
            if (length(hexnum) == 1)
                hexnum = cat(2,'0', hexnum);
            end
            % Sbox lookup
            out_byte(i) = sbox_table(hex2dec(hexnum(1))+1,hex2dec(hexnum(2))+1);
        end
    elseif(encoding == 'd') 
        % Byte substitution
        for i = 1:length(input)
            hexnum = dec2hex(input(i));
            if (length(hexnum) == 1)
                hexnum = cat(2,'0', hexnum);
            end
            % Sbox lookup
            out_byte(i)=inv_sbox_table(hex2dec(hexnum(1))+1,hex2dec(hexnum(2))+1);
        end

    else
        disp('No encoding specified');
    end

end
