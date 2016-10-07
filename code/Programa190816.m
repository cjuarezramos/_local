% Programa probado el 19 de agosto de 2016
%David Bresch 
clear
clc
direc=cd;
direc=direc(1:end-15);
run([direc 'startup.m']) % inicializa Climada

%requiere 'FL_entity_Acelhuate_TEST.xls' 
%NOTA: Requiere abrir el excel para quitarle la protección por ser enviado
%por la web.
hazard=climada_hazard_load('Salvador_hazard_FL_2015');
% hazard=climada_hazard_load('Salvador_hazard_FL_2040_extreme_cc');
% hazard=climada_hazard_load('Salvador_hazard_FL_2040_moderate_cc');
% entity=climada_entity_read('FL_entity_Acelhuate_TEST',hazard);
% entity=climada_entity_read('FL_entity_garrobo_TEST',hazard);
entity=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to',hazard);
measures_impact=climada_measures_impact(entity,hazard,'no');
climada_adaptation_cost_curve(measures_impact);

EDS=climada_EDS_calc(entity,hazard)

