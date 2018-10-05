
%==========================================================================
% The Communications Systems Toolbox is used to achieve Galois Field
% arithmetic for a GF(2^8) field using x^8 + x^4 + x^3 + x + 1 
%==========================================================================


%This file is the main function
%close all warning in the Matlab
warning('off','all');

global m prim_poly fixM fixM_d sbox_table inv_sbox_table; 

%preallocations;

% sbox lookup table. Indexing is (input+1)
sbox_vector = csvread('sbox.csv');
sbox_table = transpose(reshape(sbox_vector(1:256), [16,16]));

% inv_sbox lookup table. Indexing is (input+1)
inv_sbox_vector = csvread('inv_sbox.csv');
inv_sbox_table = reshape(inv_sbox_vector(1:256), [16,16]);
%setGlobal(sbox_table, inv_sbox_table)

%Constant
m = 8; % GF(2^m)
prim_poly = input('Please input a PRIM_POLY  between 2^M+1(257)and 2^(M+1)-1(513).:\n');


%Constant matrix for MixColumn Layer
fixM = [02 03 01 01;
        01 02 03 01;
        01 01 02 03;
        03 01 01 02];
    
%Constant matrix for Inv MixColumn Layer
fixM_d = [14 11 13 09;
          09 14 11 13;
          13 09 14 11;
          11 13 09 14];


% Initial input plaintext
plaintext = input('Type in an input message (16 characters or less):\n','s');
%Check the format of the plaintext
plaintext = check_format(plaintext); 
% Initial key
key = input('Type in a secret key/password (16 characters or less):\n','s');
%Check the format of the key
key = check_format(key);

                           
X= sprintf('%s will be in this matrix:',key);
disp(X);
disp(reshape(double(key),[4,4]));
       
% Key Schedule
round_keys = key_schedule(double(key));



% Message Encryption
ciphertext = aes_encryption(plaintext,round_keys);

% Message Decryption
plaintext_recov = aes_decryption(ciphertext, round_keys);



