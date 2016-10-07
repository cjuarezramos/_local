% Programa probado el 19 de agosto de 2016 _ Datos Distintos
%David Bresch 
clear
clc
startup % inicializa Climada

%requiere 'FL_entity_Acelhuate_TEST.xls' 
%NOTA: Requiere abrir el excel para quitarle la protección por ser enviado
%por la web.
hazard=climada_hazard_load('Salvador_hazard_FL_2015');
entity=climada_entity_read('FL_entity_Acelhuate_TEST',hazard);
measures_impact=climada_measures_impact(entity,hazard,'no');
climada_adaptation_cost_curve(measures_impact);


% load the hazard event set it into memory (you might call without any argument, which opens a file dialogue):
hazard=climada_hazard_load('Salvador_Garrobo_hazard_FL_depth_2015'); 
climada_hazard_plot(hazard,0); % plot the max intensity at each centroid, for Acelhuate, this looks like:

% % load the hazard event set it into memory (you might call without any argument, which opens a file dialogue):
% hazard=climada_hazard_load('Salvador_hazard_FL_2015'); 
% climada_hazard_plot(hazard,0); % plot the max intensity at each centroid, for Acelhuate, this looks like:
% 
% % Los datos por maxime
% hazard=climada_hazard_load('Salvador_hazard_FL_2015');
% hazard_ext=climada_hazard_load('Salvador_hazard_FL_2040_extreme_cc');
% hazard_maxint=climada_hazard_plot(hazard,0);
% hazard_ext_maxint=climada_hazard_plot(hazard_ext,0);
% delta_hazard_intensity=hazard_ext_maxint.VALUE-hazard_maxint.VALUE;
% contourf(hazard_maxint.X,hazard_maxint.Y,delta_hazard_intensity,'edgecolor','none')
% hold on; climada_plot_world_borders(0.5)
% axis equal
% colorbar
