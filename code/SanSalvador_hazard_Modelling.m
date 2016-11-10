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
porcentaje_correccion=-0.03;
intensity_percentage_increase_2040=[0.04 0.1]; % moderate(1) and extreme(2) increase until year_future
intensity_percentage_increase_2050=[0.057 0.14]; % moderate(1) and extreme(2) increase until year_future
%
hazard_2016_file=[climada_global.hazards_dir filesep 'Salvador_hazard_FL_2016_today_rd'];
hazard_moderate_2040_file=[climada_global.hazards_dir filesep 'Salvador_hazard_FL_2040_moderate_rd'];
hazard_extreme_2040_file=[climada_global.hazards_dir filesep 'Salvador_hazard_FL_2040_extreme_rd'];
hazard_moderate_2050_file=[climada_global.hazards_dir filesep 'Salvador_hazard_FL_2050_moderate_rd'];
hazard_extreme_2050_file=[climada_global.hazards_dir filesep 'Salvador_hazard_FL_2050_extreme_rd'];

% load the hazard set
hazard_pass=climada_hazard_load('Salvador_hazard_FL_2015');


% Reconsiderando el Escenario Actual
hazard=hazard_pass;
hazard.intensity=hazard.intensity*(1+porcentaje_correccion);
fprintf('saving %s\n',hazard_2016_file);
save(hazard_2016_file,'hazard');


% -------------------------
hazard_actual=climada_hazard_load('Salvador_hazard_FL_2016_today_rd');

% hazard moderado 2040
hazard=hazard_actual;
hazard.intensity=hazard.intensity*(1+intensity_percentage_increase_2040(1));
fprintf('saving %s\n',hazard_moderate_2040_file);
save(hazard_moderate_2040_file,'hazard');

% hazard extremo 2040
hazard=hazard_actual;
hazard.intensity=hazard.intensity*(1+intensity_percentage_increase_2040(2));
fprintf('saving %s\n',hazard_extreme_2040_file);
save(hazard_extreme_2040_file,'hazard');


% hazard moderado 2050
hazard=hazard_actual;
hazard.intensity=hazard.intensity*(1+intensity_percentage_increase_2050(1));
fprintf('saving %s\n',hazard_moderate_2050_file);
save(hazard_moderate_2050_file,'hazard');


% hazard extremo 2050
hazard=hazard_actual;
hazard.intensity=hazard.intensity*(1+intensity_percentage_increase_2050(2));
fprintf('saving %s\n',hazard_extreme_2050_file);
save(hazard_extreme_2050_file,'hazard');
