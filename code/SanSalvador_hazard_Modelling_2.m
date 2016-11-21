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
year_pass=2015;
year_today=2016; % reference year
year_future=2040; % future reference year as used in the study
year_future_new=2050; % new future reference year
porcentaje_correccion=0.0;
intensity_percentage_increase_2040=[0.04 0.1]; % moderate(1) and extreme(2) increase until year_future
intensity_percentage_increase_2050=[0.05 0.12]; % moderate(1) and extreme(2) increase until year_future


frequency_2040_RCP45=[0.32 0.2 0.2 .05 0.02 0.01];
frequency_2040_RCP85=[0.3 0.2 0.2 .05 0.02 0.02];

frequency_2050_RCP45=[0.25 0.17 0.20 .05 0.02 0.01];
frequency_2050_RCP85=[0.23 0.16 0.20 .05 0.02 0.02];
%
hazard_2016_file=[climada_global.hazards_dir filesep 'Salvador_hazard_FL_2016_today_mdf'];
hazard_moderate_2040_file=[climada_global.hazards_dir filesep 'Salvador_hazard_FL_2040_moderate_mdf'];
hazard_extreme_2040_file=[climada_global.hazards_dir filesep 'Salvador_hazard_FL_2040_extreme_mdf'];
hazard_moderate_2050_file=[climada_global.hazards_dir filesep 'Salvador_hazard_FL_2050_moderate_mdf'];
hazard_extreme_2050_file=[climada_global.hazards_dir filesep 'Salvador_hazard_FL_2050_extreme_mdf'];

% load the hazard set
hazard_pass=climada_hazard_load('Salvador_hazard_FL_2015');


% Reconsiderando el Escenario Actual
hazard=hazard_pass;
hazard.intensity=hazard.intensity*(1+porcentaje_correccion);
hazard.reference_year=2016;
hazard.windfield_comment=[];
fprintf('saving %s\n',hazard_2016_file);
save(hazard_2016_file,'hazard');


% -------------------------
hazard_actual=climada_hazard_load('Salvador_hazard_FL_2016_today_mdf');

% hazard moderado 2040
hazard=hazard_actual;
hazard.intensity=hazard.intensity*(1+intensity_percentage_increase_2040(1));
hazard.frequency=frequency_2040_RCP45;
hazard.reference_year=2016;
hazard.windfield_comment=[];
hazard.date= '17-Aug-2016 11:24:00';
fprintf('saving %s\n',hazard_moderate_2040_file);
save(hazard_moderate_2040_file,'hazard');

% hazard extremo 2040
hazard=hazard_actual;
hazard.intensity=hazard.intensity*(1+intensity_percentage_increase_2040(2));
hazard.frequency=frequency_2040_RCP85;
hazard.reference_year=2016;
hazard.windfield_comment=[];
hazard.date= '17-Aug-2016 11:24:00';
fprintf('saving %s\n',hazard_extreme_2040_file);
save(hazard_extreme_2040_file,'hazard');


% hazard moderado 2050
hazard=hazard_actual;
hazard.intensity=hazard.intensity*(1+intensity_percentage_increase_2050(1));
hazard.frequency=frequency_2050_RCP45;
hazard.reference_year=2016;
hazard.windfield_comment=[];
hazard.date= '17-Aug-2016 11:24:00';
fprintf('saving %s\n',hazard_moderate_2050_file);
save(hazard_moderate_2050_file,'hazard');


% hazard extremo 2050
hazard=hazard_actual;
hazard.intensity=hazard.intensity*(1+intensity_percentage_increase_2050(2));
hazard.frequency=frequency_2050_RCP85;
hazard.reference_year=2016;
hazard.windfield_comment=[];
hazard.date= '17-Aug-2016 11:24:00';
fprintf('saving %s\n',hazard_extreme_2050_file);
save(hazard_extreme_2050_file,'hazard');
