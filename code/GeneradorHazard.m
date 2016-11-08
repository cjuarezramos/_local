% Este programa genera Hazards apartir del diseñado en 2015.
clear
clc
% Inicilializando CLIMADA
direc=cd;
direc=direc(1:end-27);
run([direc 'climada\startup.m'])

% Hazard Original.
hazard_data.actual_2015=climada_hazard_load('Salvador_hazard_FL_2015');


% Datos Generados de Viviendas.
load('datos_vivienda_ilohuapa')