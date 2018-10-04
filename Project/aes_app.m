
%==========================================================================
% The Communications Systems Toolbox is used to achieve Galois Field
% arithmetic for a GF(2^8) field using x^8 + x^4 + x^3 + x + 1 
%==========================================================================


%This file is the main function
% Initial input plaintext
plaintext = input('Type in an input message (16 characters or less):\n','s');
%Check the format of the plaintext
plaintext = check_format(plaintext);
% Initial key
key = input('Type in a secret key/password (16 characters or less):\n','s');
%Check the format of the key
key = check_format(key);

% Key Schedule
round_keys = key_schedule(double(key));

% Message Encryption
ciphertext = aes_encryption(plaintext,round_keys);

% Message Decryption
plaintext_recov = aes_decryption(ciphertext, round_keys);