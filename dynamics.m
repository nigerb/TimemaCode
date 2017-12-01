
function data=dynamics(density,teta,alpha,p0,f0,beta,gmax);
% calculates the dynamics for a given density acoording to onegen
%and returns data with the frequency of r and R females and males and the
%virginity(proportion of eggs laid by virgins) for every generation. 
% define initial frequency of both types and males/females in the population
% the first number F(1) refers to r femlaes; F(2) to R females, M(1) to r
% males and M(2) to R males
F=[f0*(1-p0) f0*p0]; M=[(1-p0)*(1-f0) (1-f0)*p0];

data(1,:)=[F M NaN];

% for t generations (in this example 200) calculate the dynamics 
for t=2:gmax;
    s=sum(F+M); F=density*F/s; M=density*M/s;
    [feggs,meggs,v]=onegen(F,M,teta,alpha,beta);
    F=feggs;
    M=meggs;
    %data(t-1,5)=v;
    data(t,:)=[F M NaN];
  
end


%plot(data(:,1:4));
%xlim([0 200])
%ylim([0 1])
%xlabel('generations')
%ylabel('frequency in population')
%legend({'Females_r','Females_R', 'Males_r', 'Males_R'},'FontSize',8,'FontWeight','bold')
end



