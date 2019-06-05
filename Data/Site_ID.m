% Simple site classification with linear cell array


%Outputs vector of row indicies
T1=strmatch('T1', transect);
T2=strmatch('T2', transect);
NWD=strmatch('NWD', transect);
NWC=strmatch('NWC', transect);
SW=strmatch('SW', transect);
WH=strmatch('WH', transect);
SPC=strmatch('SPC', transect);

CC= strmatch('CC', site);
CC3= strmatch('CC3', site);
CC2= strmatch('CC2', site);
CC1= strmatch('CC1', site);
CC0= strmatch('CC0', site);
TR= strmatch('T', site);
TR1= strmatch('T1', site);
TR2= strmatch('T2', site);
TR3= strmatch('T3', site);
F= strmatch('F', site);
F1= strmatch('F1', site);
F2= strmatch('F2', site);
F3= strmatch('F3', site);

E1=strmatch('E1', site);
E2=strmatch('E2', site);
E3=strmatch('E3', site);
E4=strmatch('E4', site);
W1=strmatch('W1', site);
W2=strmatch('W2', site);
W3=strmatch('W3', site);
W4=strmatch('W4', site);


one=strmatch('1', site);
two=strmatch('2', site);
three=strmatch('3', site);
four=strmatch('4', site);
five=strmatch('5', site);
six=strmatch('6', site);
seven=strmatch('7', site);

ID={};
ID{1}=intersect(T1, W4);
ID{2}=intersect(T1, W3);
ID{3}=intersect(T1, W2);
ID{4}=intersect(T1, W1);
ID{5}=intersect(T1, E1);
ID{6}=intersect(T1, E2);
ID{7}=intersect(T1, E3);
ID{8}=intersect(T1, E4);

ID{9}=intersect(T2, W4);
ID{10}=intersect(T2, W3);
ID{11}=intersect(T2, W2);
ID{12}=intersect(T2, W1);
ID{13}=intersect(T2, E1);
ID{14}=intersect(T2, E2);
ID{15}=intersect(T2, E3);
ID{16}=intersect(T2, E4);

%--SW
ID{17}=intersect(SW, one);
ID{18}=intersect(SW, two);
ID{19}=intersect(SW, three);
ID{20}=intersect(SW, four);
ID{21}=intersect(SW, five);
ID{22}=intersect(SW, six);

%---NWC--
ID{23}=intersect(NWC, one); 
ID{24}=intersect(NWC, two); 
ID{25}=intersect(NWC, three);
ID{26}=intersect(NWC, four); %2013 23 
ID{27}=intersect(NWC, five); %2013 24
ID{28}=intersect(NWC, six);  %2013 25

%---NWD
ID{29}=intersect(NWD, one);%2013 26
ID{30}=intersect(NWD, two);%2013 27
ID{31}=intersect(NWD, three);
ID{32}=intersect(NWD, four); 
ID{33}=intersect(NWD, five);%2013 28
ID{34}=intersect(NWD, six); %2013 29

%---WH
ID{35}=intersect(WH, one);
ID{36}=intersect(WH, two); %30
ID{37}=intersect(WH, three); %31
ID{38}=intersect(WH, four); %32
ID{39}=intersect(WH, five);
ID{40}=intersect(WH, six);
ID{41}=intersect(WH, seven);

ID{42}=intersect(SPC, CC0);
ID{43}=intersect(SPC, CC1);
ID{44}=intersect(SPC, CC2);
ID{45}=intersect(SPC, CC3);
ID{46}=intersect(SPC, TR1);
ID{47}=intersect(SPC, TR2);
ID{48}=intersect(SPC, TR3);
ID{49}=intersect(SPC, F1);
ID{50}=intersect(SPC, F2);
ID{51}=intersect(SPC, F3);


Site_name={};
Site_name={'T1W4','T1W3','T1W2','T1W1','T1E1','T1E2', 'T1E3', 'T1E4', 'T2W4','T2W3','T2W2', 'T2W1','T2E1', 'T2E2','T2E3', 'T2E4', 'SW1', 'SW2', 'SW3', 'SW4', 'SW5', 'SW6', 'NWC1', 'NWC2', 'NWC3','NWC4', 'NWC5', 'NWC6', 'NWD1', 'NWD2', 'NWD3', 'NWD4','NWD5', 'NWD6','WH1','WH2', 'WH3', 'WH4','WH5', 'WH6', 'WH7','SPC-CC0', 'SPC-CC1', 'SPC-CC2', 'SPC-CC3', 'SPC-T1', 'SPC-T2', 'SPC-T3', 'SPC-F1', 'SPC-F2', 'SPC-F3'};

riparian=cat(1, ID{4}, ID{3}, ID{5}, ID{11}, ID{12}); % T1W1, T1W2, T1E1, T2W2,T2W1
nstream=[3 4 5 13 12 10 11];
hilz=[1 2 6 7 8 9 14];
hilz_all=[1 2 6 7 8 9 14:22, 26:30, 33, 34, 36:38];
hillzz=[1 2 6 7 8 9 14:32]; %this is for once the empy cells are removed

%%Moved T1E2 to transistional (uplands when only two distinctions 04/05/16 and T2E1 to riparian

nearstream=cat(1, ID{3}, ID{4}, ID{5}, ID{10}, ID{11}, ID{12}, ID{13});
tr=cat(1, ID{13}, ID{6}, ID{10});%transistional T2E1, T1E2, T2W3, 
hillslope=cat(1,ID{1}, ID{2}, ID{7}, ID{8}, ID{9}, ID{14});
hillslope_all=cat(1,ID{1}, ID{2},ID{6}, ID{7}, ID{8}, ID{9}, ID{14}, ID{15}, ID{16}, ID{17}, ID{18}, ID{19}, ID{20}, ID{21}, ID{22}, ID{23}, ID{24}, ID{25}, ID{26}, ID{27}, ID{28}, ID{29}, ID{30}, ID{31}, ID{32}, ID{33}, ID{34}, ID{35}, ID{36}, ID{37}, ID{38}, ID{39}, ID{40}, ID{41}, ID{42}, ID{43}, ID{44}, ID{45}, ID{46}, ID{47}, ID{48}, ID{49}, ID{50}, ID{51});
clearcut=cat(1,ID{42}, ID{43}, ID{44}, ID{45});
cctransition=cat(1,ID{46}, ID{47}, ID{48});
forest=cat(1,ID{49}, ID{50}, ID{51});

H13=intersect(hillslope_all, y2013);
R13=intersect(riparian, y2013);
N13=intersect(nearstream, y2013); % all sites near the stream
H12=intersect(hillslope_all, y2012);
R12=intersect(riparian, y2012);
N12=intersect(nearstream, y2012);
TR13=intersect(tr, y2013);% transisional sites
TR12=intersect(tr, y2012);% transisional sites
T1E12013=intersect(ID{5}, y2013);
ID=ID';
ID(cellfun(@isempty, ID))=[];

%get rid of minutes/hours for simplification
flux_date=floor(timestamp);

sitemedVWC=[];
siteavgVWC=[];
siteavgTemp=[];
for i=1:39      
C=intersect(y2013, (ID{i,:}));
siteVWC=nanmean(wc_avg(C));
siteavgVWC=[siteavgVWC, siteVWC];
siteTemp=nanmean(soil_temp_C_avg(C));
siteavgTemp=[siteavgTemp, siteTemp];
sitemed=nanmedian(wc_avg(C));
sitemedVWC=[sitemedVWC, sitemed];
end

sed=cat(1,T1, T2, WH);
rock2= cat(1, SW, NWC);
sed13=intersect(sed, y2013);
Rock2=intersect(rock2, y2013);
NWD13=intersect(NWD, y2013);
sw13=intersect(SW, y2013);
NWC13=intersect(NWC, y2013);
WH13=intersect(WH, y2013);

new=zeros(1172,1);
new(H13)=1;
new(R13)=2;

newCH4=CH4_fluxCug;
newCH4(new==0)=[];
new(new==0)=[];

foo=anova1(newCH4, new)

%measurement={};
%for i=1:51; 
 %   measurement{i}=flux_date(ID{i,:}); 
%end;
%measurement=measurement';

%round1=find(timestamp>datenum('04-11-2013') & timestamp<datenum('05-23-2013'));
%round2=find(timestamp>datenum('05-28-2013') & timestamp<datenum('05-30-2013'));
%round3=find(timestamp>=datenum('06-03-2013') & timestamp<datenum('06-05-2013'));
%round4=find(timestamp>=datenum('06-05-2013') & timestamp<=datenum('06-09-2013'));
%round5=find(timestamp>datenum('06-09-2013') & timestamp<datenum('06-11-2013'));
%round6=find(timestamp>=datenum('06-12-2013') & timestamp<datenum('06-14-2013'));
%round7=find(timestamp>datenum('06-16-2013') & timestamp<datenum('06-20-2013'));
%round8=find(timestamp>=datenum('06-23-2013') & timestamp<datenum('06-28-2013'));
%round9=find(timestamp>datenum('06-30-2013') & timestamp<datenum('07-03-2013'));
%round10=find(timestamp>=datenum('07-08-2013') & timestamp<datenum('07-12-2013'));
%round11=find(timestamp>=datenum('07-14-2013') & timestamp<datenum('07-18-2013'));
%round12=find(timestamp>=datenum('07-22-2013') & timestamp<datenum('07-26-2013'));
%round13=find(timestamp>=datenum('07-28-2013') & timestamp<=datenum('07-31-2013'));
%round14=find(timestamp>=datenum('08-04-2013') & timestamp<datenum('08-07-2013'));
%round15=find(timestamp>=datenum('08-18-2013') & timestamp<datenum('08-21-2013'));
%round16=find(timestamp>=datenum('09-09-2013') & timestamp<datenum('09-13-2013'));%

%R=[datenum('05-22-2013')*ones(size(round1)); datenum('05-29-2013')*ones(size(round2)); datenum('06-04-2013')*ones(size(round3)); datenum('06-07-2013')*ones(size(round4)); datenum('06-10-2013')*ones(size(round5)); datenum('06-13-2013')*ones(size(round6));datenum('06-18-2013')*ones(size(round7));datenum('06-25-2013')*ones(size(round8)); datenum('07-02-2013')*ones(size(round9)); datenum('07-10-2013')*ones(size(round10)); datenum('07-16-2013')*ones(size(round11)); datenum('07-24-2013')*ones(size(round12)); datenum('07-30-2013')*ones(size(round13));datenum('08-06-2013')*ones(size(round14)); datenum('08-19-2013')*ones(size(round15)); datenum('09-11-2013')*ones(size(round16))];
%Rtemp=[soil_temp_C_avg(round1);soil_temp_C_avg(round2);soil_temp_C_avg(round3);soil_temp_C_avg(round4);soil_temp_C_avg(round5);soil_temp_C_avg(round6);soil_temp_C_avg(round7);soil_temp_C_avg(round8);soil_temp_C_avg(round9);soil_temp_C_avg(round10);soil_temp_C_avg(round11);soil_temp_C_avg(round12);soil_temp_C_avg(round13);soil_temp_C_avg(round14);soil_temp_C_avg(round15);soil_temp_C_avg(round16)];