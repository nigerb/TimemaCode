function [feggs,meggs,virginity,virgintime,nonvirgintime]=onegen(F,M,teta,alpha,beta)
% how many asexual eggs and sexual eggs of each type does a population produce if female &
% male densities are F and M, where each has two numbers: r and R haplotype

%assume that females can produce females only while they're parthenogenetic, 
% and do 1:1 once fertilized

% assume resistance = teta or 1
% Note that frequency of R among female offspring differs from that among male offspring, because high-R females overproduce females

% Rate of mating (that actually stops virginity) is 
% M/1 = M for r females and M/teta for R females.
% Mating or death can stop this virgin time.
% Resisting females have mortality 1+a*(teta-1)*M 
% and nonresisting ones have 1(which is the same as 1+a*(teta-1)*M, with teta=1)

% Expected time as virgin = 1/(M/teta+1+a*(teta-1)*M)
% Expected time as non-virgin
% = prob(mating rather than death)*expected time alive after first mating
% = M/R/(M/teta+1+a*(teta-1)*M * 1/(1+a*(teta-1)*M)

% Virgin females when reproducing produce females who all copy their mothers' R
% Non-virgins produce females half of whom copy their mother's R, half is determined by R in the male proportion
% Non-virgins also produce males half of whom copy their mother's R, half is determined by R in the male proportion

msum=sum(M)^beta;

if msum>0
    virgintime=1./(msum./[1 teta]+1+alpha*([1 teta]-1)*msum);
    nonvirgintime=(msum./[1 teta])./(msum./[1 teta]+1+alpha*([1 teta]-1)*msum)*1./(1+alpha*([1 teta]-1)*msum);
    virginity=sum(F.*virgintime)./sum(F.*(virgintime+nonvirgintime));
    pRm=M(2)/sum(M); % proportion R among males
    feggs(1)=F(1)*virgintime(1) + F(1)*1/2*nonvirgintime(1)*(1/2+1/2*(1-pRm)) + F(2)*1/2*nonvirgintime(2)*1/2*(1-pRm);
    feggs(2)=F(2)*virgintime(2) + F(1)*1/2*nonvirgintime(1)*1/2*pRm + F(2)*1/2*nonvirgintime(2)*(1/2+1/2*pRm);
     meggs(1)=F(1)*1/2*nonvirgintime(1)*(1/2+1/2*(1-pRm)) + F(2)*1/2*nonvirgintime(2)*1/2*(1-pRm);
    meggs(2)=F(1)*1/2*nonvirgintime(1)*1/2*pRm + F(2)*1/2*nonvirgintime(2)*(1/2+1/2*pRm);
else % no males left, so calculations are simpler
    virgintime=1;
    nonvirgintime=0;
    virginity=1;
     feggs(1)=F(1);
    feggs(2)=F(2);
    meggs=[0 0];
end

% normalize by the sum of feggs+meggs
s=sum(feggs)+sum(meggs);


feggs=feggs/s; meggs=meggs/s;
