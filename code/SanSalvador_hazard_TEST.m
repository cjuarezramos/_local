% climada SanSalvador_hazard_TEST
% NAME:
%   SanSalvador_hazard_TEST
% PURPOSE:
%   check San Salvador FL hazard sets and create moderate and extreme
%   climate change (cc) hazard event sets for 2050 instead of 2040
%
%   all PARAMETERS set in code
% CALLING SEQUENCE:
%   SanSalvador_hazard_TEST
% EXAMPLE:
%   SanSalvador_hazard_TEST
% INPUTS:
% OPTIONAL INPUT PARAMETERS:
% OUTPUTS:
%   new hazard sets for 2050
% MODIFICATION HISTORY:
% David N. Bresch, david.bresch@gmail.com, 20160916, initial
%-

global climada_global
if ~climada_init_vars,return;end; % init/import global variables

% PARAMETERS
%
year_today=2015; % reference year
year_future=2040; % future reference year as used in the study
year_future_new=2050; % new future reference year
intensity_percentage_increase=[0.04 0.1]; % moderate(1) and extreme(2) increase until year_future
%
hazard_moderate_2050_file=[climada_global.hazards_dir filesep 'Salvador_hazard_FL_2050_moderate_cc'];
hazard_extreme_2050_file=[climada_global.hazards_dir filesep 'Salvador_hazard_FL_2050_extreme_cc'];

% load the hazard sets
hazard_today=climada_hazard_load('Salvador_hazard_FL_2015');
hazard_moderate_2040=climada_hazard_load('Salvador_hazard_FL_2040_moderate_cc');
hazard_extreme_2040=climada_hazard_load('Salvador_hazard_FL_2040_extreme_cc');

% check for frequency change
fprintf('check frequency change moderate:\n');
hazard_moderate_2040.frequency./hazard_today.frequency
fprintf('check frequency change extreme:\n');
hazard_extreme_2040.frequency./hazard_today.frequency

% check for total intensity change
fprintf('check sum of intensity change moderate:\n');
sum(sum(hazard_moderate_2040.intensity-hazard_today.intensity))
fprintf('check sum of intensity change extreme:\n');
sum(sum(hazard_extreme_2040.intensity-hazard_today.intensity))

% show histogram of differences
event_i=4;
diff_field=full(hazard_moderate_2040.intensity(event_i,:)-hazard_today.intensity(event_i,:));
pos=diff_field>0 & diff_field < .4;
figure;hist(diff_field(pos));title('moderate, event 4, intermediate change distribution');

% modify moderate hazard
intensity_percentage_increase=intensity_percentage_increase*(year_future_new-year_today)/(year_future-year_today); % % 2015 until 2050

% scale up hazard moderate
hazard=hazard_moderate_2040;
hazard.intensity=hazard.intensity*(1+intensity_percentage_increase(2));
fprintf('saving %s\n',hazard_moderate_2050_file);
save(hazard_moderate_2050_file,'hazard');

% scale up hazard extreme
hazard=hazard_extreme_2040;
hazard.intensity=hazard.intensity*(1+intensity_percentage_increase(2));
fprintf('saving %s\n',hazard_extreme_2050_file);
save(hazard_extreme_2050_file,'hazard');

% % check for single event intensity change
% for event_i=1:size(hazard_today.intensity,1)
%     
%     subplot(6,1,event_i)
%     diff_field=full(hazard_moderate_2040.intensity(event_i,:)-hazard_today.intensity(event_i,:));
%     climada_circle_plot(diff_field,hazard_today.lon,hazard_today.lat);
%     
% end % event_i