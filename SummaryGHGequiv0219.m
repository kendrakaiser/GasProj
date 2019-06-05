clear 
close all

cd '/Users/kek25/Documents/MATLAB/Gas_Project/All_QAQC_data/Cumulatives'
%Cumulatives were determined by linearlly interpolating between
%measurements from 05-29-2013 to 9-12-2013 using CumulativesFull2013.m

%import the cumulative values for the 2013 growing season 
load('/Users/kek25/Documents/MATLAB/Gas_Project/All_QAQC_data/Cumulatives/GWP_CH413g.mat')
load('/Users/kek25/Documents/MATLAB/Gas_Project/All_QAQC_data/Cumulatives/GWP_N2O13g.mat')
load('/Users/kek25/Documents/MATLAB/Gas_Project/All_QAQC_data/Cumulatives/GWP_CO213kg.mat')
load('/Users/kek25/Documents/MATLAB/Gas_Project/All_QAQC_data/Cumulatives/VWC2013sort.mat')
load('/Users/kek25/Documents/MATLAB/Gas_Project/All_QAQC_data/Cumulatives/VWC2013avg.mat')

%Calculation that 
%Calculation that derived each sites average vwc for the year
%s13wc=[];
%for i=1:51;
%a=wc_avg(intersect(ID{i}, y2013));
%s13wc(i,1)=nanmean(a);
%end
%[I, D] = sort(s13wc(1:38)');
%save('VWC2013sort.mat', 'D');
%save('VWC2013avg.mat', 'I');

%The cumulatives exclude site #35 bc something about the Nans make the
%script break

%Remove row of NaNs
CO2=GWP_CO213kg(1:105,:);
CH4=GWP_CH413g(1:105,:);
N2O=GWP_N2O13g(1:105,:);

%subset to make weekly values of fluxes- if you have a cumulative time
%series, then to determine the cumulative flux for the week, you would take
%the last value of the week
c13=[];
cc13=[];
cn13=[];
for j=1:37;
for  i=1:size(CH4,1)/7;
   c13(i,j)=CO2((i*7),j);
  cc13(i,j)=CH4((i*7),j);
  cn13(i,j)=N2O((i*7),j);
end
end
d=D;
%Wh2 is now #35 WH3 is now 36 and WH4 is 37
d(d==35)=[];%remove the site that's not in the cumulatives
%create the new labels
d(d==36)=35;
d(d==37)=36;
d(d==38)=37; 
Ii=I;
%Wh2 is now #35 WH3 is now 36 and WH4 is 37
Ii(Ii==35)=[];%remove the site that's not in the cumulatives
%create the new labels
Ii(Ii==36)=35;
Ii(Ii==37)=36;
Ii(Ii==38)=37; 
Ii=Ii(1:32);
Iir=round(Ii);
%Sort the order of the ts by average annual VWC
C13=c13(:,d);
CH413=cc13(:,d);
N2O13=cn13(:,d);

C13=C13(:,[1:32, 37]);
CH413=CH413(:,[1:32, 37]);
N2O13=N2O13(:,[1:32, 37]);
%Determine the incrimental increase of each week
for i=1:32;
    CO2diff(:,i)=diff(C13(:,i));
    CH4diff(:,i)=diff(CH413(:,i));
    N2Odiff(:,i)=diff(N2O13(:,i));
end

load('MyColormaps.mat', 'dope')
load('MyColormaps.mat', 'dope2')

figure;
subplot(7,1,1)
scatter(1:32,Ii)
xlim([0 33])
ylim([0 65])
ax=gca;
ax.XTick=(1:8:32);
ax.XTickLabel=('');
ylabel('VWC(%)')

subplot (7,1,[2 3]); %CO2
bar(CO2diff','stacked', 'edgecolor','none')
xlim([0 33])
ylabel('Cumulative CO2 flux (kg m^-2)', 'Fontsize', 16);
colormap(gca, dope2)
ax.XTickLabel=('');

subplot (7,1,4); %CH4
bar(CH4diff','stacked', 'edgecolor','none')
xlim([0 33])
ylabel('Cumulative CH4 flux (CO2 equivilants g m^-2)', 'Fontsize', 16)
colormap(gca, dope2)
ylim([-6 2])
ax.XTickLabel=('');

subplot (7,1,5); %CH4
bar(CH4diff','stacked', 'edgecolor','none')
xlim([0 33])
colormap(gca, dope2)
XTick=('null');
ylim([-6 8])

subplot (716); %N2O
z=bar(N2Odiff','stacked', 'edgecolor','none');
xlim([0 33])
ylabel('Cumulative N2O flux (CO2 equivilants g m^-2)', 'Fontsize', 16)
colormap(gca, dope2)
ylim([-2 11])
ax=gca;
ax.XTick=(1:1:32);
ax.XTickLabel=ya;

subplot (717);
f=bar(N2Odiff','stacked', 'edgecolor','none');
xlim([0 33])
colormap(gca, dope2)
ylim([-2 30])
 XTick=('null');

legend('5/29', '6/04', '6/11', '6/18', '6/25', '7/02', '7/09', '7/16', '7/23', '7/30', '8/06', '08/13', '8/20', '8/27', '9/03', '09/10');


GHG=[(C13(15,:).*1000); CH413(15,:); N2O13(15,:)];
[co2s, cs]=sort(GHG(1,:));
[n2os, ns]=sort(GHG(3,:));
CS=GHG(:,cs);
NS=GHG(:,ns);

figure;
subplot(211)
bar(CS', 'stacked')
ylabel('Cumulative Fluxes (CO2 equivilants g m^-2)')
xlim([0 33])
ylim([550 2300])
legend('CO2','CH4', 'N2O')
subplot(212)
bar(CS(2:3,:)', 'stacked')
xlim([0 33])
legend('CH4', 'N2O')
xlabel('Ranked Order of CO2 Flux')


figure;
subplot(311)
bar(NS', 'stacked')
xlim([0 33])
subplot(312)
bar(NS(2:3,:)', 'stacked')
xlim([0 33])
legend('CH4', 'N2O')
subplot(313)
bar(NS(2,:)')
xlim([0 33])
%ax = gca;
%dope2 = colormap(ax); 
%save('MyColormaps2','dope2')
%CREATE legened that denotes weeks


Site_name={'T1W4','T1W3','T1W2','T1W1','T1E1','T1E2', 'T1E3', 'T1E4', 'T2W4','T2W3','T2W2', 'T2W1','T2E1', 'T2E2','T2E3', 'T2E4', 'SW1', 'SW2', 'SW3', 'SW4', 'SW5', 'SW6','NWC4', 'NWC1', 'NWC2', 'NWC3', 'NWC4', 'NWC5', 'NWC6', 'NWD1', 'NWD2', 'NWD3', 'NWD4','NWD5', 'NWD6','WH1','WH2', 'WH3', 'WH4','WH5', 'WH6', 'WH7'};

ya={};
for i=1:37
    ya{i}=Site_name{d(i)};
end