function round_key = key_schedule(key)
    fprintf('\n***********************************Start AES Key Round***********************************\n\n');
    key = double(key);

    %round key 0
    
    round_key  = reshape(double(key), [4 4])';

   
    % round key 1-10
   
    for round = 1:10
     
       fprintf('@@@@@@@@@@@@@@@@@@@round %d@@@@@@@@@@@@@@@@@@@\n',round);
                
        r = round_function(round_key(4,:,1),round);
        round_key_temp = bitxor(round_key (1,:,1), r); 
        for j = 1:3
           
            if j == 1
                round_key(j,:,1) = round_key_temp;
            elseif j == 2
                round_key(j,:,1) = bitxor(round_key_temp, round_key (j,:,1));
            else
                round_key(j,:,1) = bitxor(round_key (j,:,1),round_key (j,:,1));
            end
        end
        disp(round_key);
           
    end
   fprintf('\n***********************************End AES Key Round***********************************\n\n');
end

