function [ Faeggs,Fseggs,Maeggs,Mseggs ] = Flygen( Fa,Fs,Ma,Ms,cs,ca )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

p= Ma/(Ma+Ms);

Faeggs=1/4*Fs*p*cs;
Fseggs=1/4*Fs*p*cs+1/2*Fs*(1-p)*cs;
Maeggs=1/4*Fs*p*cs+Fa*ca;
Mseggs=1/4*Fs*p*cs+1/2*Fs*(1-p);




 s=Faeggs+Fseggs+Maeggs+Ms; Faeggs=Faeggs/s; Fseggs=Fseggs/s;Maeggs=Maeggs/s;Mseggs=Mseggs/s;
end