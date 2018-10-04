function round_key = key_schedule(key)

    key = double(key);

    %round key 0
    %Base 16, convert it to 4 x 4 matrix 
    round_key  = reshape(double(key), [4 4])';

   
    % round key 1-10
   
    for round = 1:10
        % Update encrpt_key with: encrpt_key[4*i] = encrpt_key[4*(i-1)] xor round_function(x) where x = encrpt_key[4*i] - 1
        %start from the 4th row
        
        r = round_function(round_key(4,:,1),round);
        round_key_temp = bitxor(round_key (1,:,1), r); 
        for j = 1:3
            % Update w with: w[4*i+j] = w[4*i+j?1] + w[4*(i?1)+j]
            if j == 1
                round_key(j,:,1) = round_key_temp;
            elseif j == 2
                round_key(j,:,1) = bitxor(round_key_temp, round_key (j,:,1));
            else
                round_key(j,:,1) = bitxor(round_key (j,:,1),round_key (j,:,1));
            end
        end
    end
   
end

