% Prueba Uno Ilohuapa
clear
clc
direc=cd;
direc=direc(1:end-27);
run([direc 'climada\startup.m']) % inicializa Climada


% hazard_actual=climada_hazard_load('Salvador_hazard_FL_2015');
% entity_con_actual=climada_entity_read('FL_entity_Ilohuapa_prec_con_to_DMFmodf',hazard_actual);
% EDS_con_actual=climada_EDS_calc(entity_con_actual,hazard_actual);

% Escenarios Actuales
hazard_actual=climada_hazard_load('Salvador_hazard_FL_2015');

entity_con_actual=climada_entity_read('FL_entity_Ilohuapa_prec_con_to',hazard_actual);
EDS_con_actual=climada_EDS_calc(entity_con_actual,hazard_actual);

entity_rec_actual=climada_entity_read('FL_entity_Ilohuapa_prec_rec_to',hazard_actual);
EDS_rec_actual=climada_EDS_calc(entity_rec_actual,hazard_actual);

entity_bie_actual=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to',hazard_actual);
EDS_bie_actual=climada_EDS_calc(entity_bie_actual,hazard_actual);




% Escenarios Moderados 2040
hazard_moderado=climada_hazard_load('Salvador_hazard_FL_2040_moderate_cc');

entity_con_moderado=climada_entity_read('FL_entity_Ilohuapa_prec_con_to',hazard_moderado);
EDS_con_moderado=climada_EDS_calc(entity_con_moderado,hazard_moderado);

entity_rec_moderado=climada_entity_read('FL_entity_Ilohuapa_prec_rec_to',hazard_moderado);
EDS_rec_moderado=climada_EDS_calc(entity_rec_moderado,hazard_moderado);

entity_bie_moderado=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to',hazard_moderado);
EDS_bie_moderado=climada_EDS_calc(entity_bie_moderado,hazard_moderado);


% Escenarios EXtremo 2040
hazard_extremo=climada_hazard_load('Salvador_hazard_FL_2040_extreme_cc');
entity_con_extremo=climada_entity_read('FL_entity_Ilohuapa_prec_con_to',hazard_extremo);
EDS_con_extremo=climada_EDS_calc(entity_con_extremo,hazard_extremo);

entity_rec_extremo=climada_entity_read('FL_entity_Ilohuapa_prec_rec_to',hazard_extremo);
EDS_rec_extremo=climada_EDS_calc(entity_rec_extremo,hazard_extremo);

entity_bie_extremo=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to',hazard_extremo);
EDS_bie_extremo=climada_EDS_calc(entity_bie_extremo,hazard_extremo);
