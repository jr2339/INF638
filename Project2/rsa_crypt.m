function [crypt_msg] = rsa_crypt(message,key,n)

message = int64(message);
crypt_msg = (length(message));
for i=(1:length(message))
    crypt_msg(i) = int64(powermod(message(i),key,n));
end
end