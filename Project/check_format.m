function out_text = check_format(in_text)

    if(length(in_text) >= 1 && length(in_text) < 16)
        for i = length(in_text)+1:16
            in_text(i) = 0;
        end
    elseif(length(in_text) > 16)
        error('Input plaintext has to be between 1 and 16 characters.');
    elseif(isempty(in_text))
        error('Input message is empty');        
    end
    
    out_text = in_text;

end

