% Creates Figure 3 from the MS over a density range defined with density 
%(in the example 1000 values between 0 and 100;

density=linspace(0,100,1000); %defines the density range that is explored
gmax=1000; %the number of generations
alpha=0.001;% alpha is the relative cost of Resistance of R females
teta=5;% teta is the strength of resistance of R females
f0=0.5;%f0 is the initial frequency of females 
p0=0.5;%p0 is the initial frequency of R 
beta=1;%beta is the exponent of the Male encounter rate; 
%calculate the dynamics for every density (defined above)

    for i=1:length(density)
        i
        %run dynamics for a certain density; remember dynamics produces
        %data with the frequencies for each type
        d=dynamics(density(i),teta,alpha,p0,f0,beta,gmax);
        %then save the second last generation; 
        %at this generation evolutionary stable frequencies should be obtained (here you can also change the number of generations in the "dynamics file" if this is not the case yet. 
        D(i,:)=d(end-1,:);
           
    end
    
% create Figure 3 in the MS

figure(1);
bar(density,D(:,1:4),'stacked'); xlabel('Population density');
xlim([min(density) max(density)])
ylim([0 1])
xlabel('Population density')
ylabel('Frequency in population')
legend({'Females_r','Females_R', 'Males_r', 'Males_R'},'FontSize',8,'FontWeight','bold')
colormap bone

%create 

