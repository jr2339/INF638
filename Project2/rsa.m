disp('==============================Original Message====================================');
plain = 'abcdefghijklmnopqrstuvwxxyz';
disp(plain);
disp(' ');

disp('===============================Key Generation=====================================');
[d,e,n] = rsa_keygeneration();
disp('********************************************');
fprintf('Generated keys: e=%d, d=%d, n=%d\n',e,d,n);
disp('********************************************');
fprintf('Public Key ---> (e=%d,n=%d)\n',e,n);
disp('********************************************');
fprintf('Private Key ---> (d=%d,n=%d)\n',d,n);
disp(' ');

disp('===============================Encryption=====================================');

c = rsa_crypt(plain,e,n);
fprintf('Cipher Text in Hex: \n');
for i= 1: length(c)
    fprintf('%s ------->%x-------> %x\n',plain(i),plain(i),c(i));
end
disp(' ');

disp('===============================Decryption=====================================');
plain = rsa_crypt(c,d,n);
fprintf(' Plain Text: %s\n',plain);


% Below code if for plotting graph of plain text --> cipher text. 
disp('===============================Graphic=====================================');
temp = (length(c));
for i=(1:length(c))
    temp(i) = mod(c(i),26)+97;
end

freq(temp,plain);

