% Figure1
% reproduces the dynamics over several generations(gmax)
%at a given density 
density=13;

gmax=200
teta=5;%strenth of resistance
alpha=0.01;%relative mortaliy of R females
p0=0.5;% initial frequency of R
f0=0.5; %initial frequency of females
beta=1;%beta is the exponent of the Male encounter rate


data=dynamics(density,teta,alpha,p0,f0,beta,gmax);

% create Figure
figure(2);
plot(data(:,1:4));
ylim([0 1])
xlabel('generations')
ylabel('frequency in population')
legend({'Females_r','Females_R', 'Males_r', 'Males_R'},'FontSize',8,'FontWeight','bold')
colormap bone


