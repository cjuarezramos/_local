global_ilohuapa

% Lecturas de hazard actual
hazard_data.actual_2015=climada_hazard_load('Salvador_hazard_FL_2015');

% hazard moderado
hazard_data.moderado_2040=climada_hazard_load('Salvador_hazard_FL_2040_moderate_cc');
hazard_data.moderado_2050=climada_hazard_load('Salvador_hazard_FL_2050_moderate_cc');

%hazard extremo
hazard_data.extremo_2040=climada_hazard_load('Salvador_hazard_FL_2040_extreme_cc');
hazard_data.extremo_2050=climada_hazard_load('Salvador_hazard_FL_2050_extreme_cc');


% % Lecturas de hazard actual
% hazard_data.actual_2015=climada_hazard_load('Salvador_hazard_FL_2016_today_rd');
%
% % hazard moderado
% hazard_data.moderado_2040=climada_hazard_load('Salvador_hazard_FL_2040_moderate_rd');
% hazard_data.moderado_2050=climada_hazard_load('Salvador_hazard_FL_2050_moderate_rd');
%
% %hazard extremo
% hazard_data.extremo_2040=climada_hazard_load('Salvador_hazard_FL_2040_extreme_rd');
% hazard_data.extremo_2050=climada_hazard_load('Salvador_hazard_FL_2050_extreme_rd');
%


% Entity
entity_data.actual_2015.pre_con=climada_entity_read('FL_entity_Ilohuapa_prec_con_to.xlsx',hazard_data.actual_2015);
entity_data.actual_2015.pre_rec=climada_entity_read('FL_entity_Ilohuapa_prec_rec_to.xlsx',hazard_data.actual_2015);
entity_data.actual_2015.pre_bie=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to.xlsx',hazard_data.actual_2015);

entity_data.moderado_2040.pre_con=climada_entity_read('FL_entity_Ilohuapa_prec_con_to.xlsx',hazard_data.moderado_2040);
entity_data.moderado_2040.pre_rec=climada_entity_read('FL_entity_Ilohuapa_prec_rec_to.xlsx',hazard_data.moderado_2040);
entity_data.moderado_2040.pre_bie=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to.xlsx',hazard_data.moderado_2040);

entity_data.moderado_2050.pre_con=climada_entity_read('FL_entity_Ilohuapa_prec_con_to.xlsx',hazard_data.moderado_2050);
entity_data.moderado_2050.pre_rec=climada_entity_read('FL_entity_Ilohuapa_prec_rec_to.xlsx',hazard_data.moderado_2050);
entity_data.moderado_2050.pre_bie=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to.xlsx',hazard_data.moderado_2050);

entity_data.extremo_2040.pre_con=climada_entity_read('FL_entity_Ilohuapa_prec_con_to.xlsx',hazard_data.extremo_2040);
entity_data.extremo_2040.pre_rec=climada_entity_read('FL_entity_Ilohuapa_prec_rec_to.xlsx',hazard_data.extremo_2040);
entity_data.extremo_2040.pre_bie=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to.xlsx',hazard_data.extremo_2040);

entity_data.extremo_2050.pre_con=climada_entity_read('FL_entity_Ilohuapa_prec_con_to.xlsx',hazard_data.extremo_2050);
entity_data.extremo_2050.pre_rec=climada_entity_read('FL_entity_Ilohuapa_prec_rec_to.xlsx',hazard_data.extremo_2050);
entity_data.extremo_2050.pre_bie=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to.xlsx',hazard_data.extremo_2050);


% Cálculo EDS
filename=[climada_global.results_dir '\' 'FL_Expecte_Damage_Ilohuapa.mat'];
if  ~exist(filename,'file')
    
    EDS_data.actual_2015.pre_con=climada_EDS_calc(entity_data.actual_2015.pre_con,hazard_data.actual_2015);
    EDS_data.actual_2015.pre_rec=climada_EDS_calc(entity_data.actual_2015.pre_rec,hazard_data.actual_2015);
    EDS_data.actual_2015.pre_bie=climada_EDS_calc(entity_data.actual_2015.pre_bie,hazard_data.actual_2015);
    
    
    EDS_data.moderado_2040.pre_con=climada_EDS_calc(entity_data.moderado_2040.pre_con,hazard_data.moderado_2040);
    EDS_data.moderado_2040.pre_rec=climada_EDS_calc(entity_data.moderado_2040.pre_rec,hazard_data.moderado_2040);
    EDS_data.moderado_2040.pre_bie=climada_EDS_calc(entity_data.moderado_2040.pre_bie,hazard_data.moderado_2040);
    
    EDS_data.extremo_2040.pre_con=climada_EDS_calc(entity_data.extremo_2040.pre_con,hazard_data.extremo_2040);
    EDS_data.extremo_2040.pre_rec=climada_EDS_calc(entity_data.extremo_2040.pre_rec,hazard_data.extremo_2040);
    EDS_data.extremo_2040.pre_bie=climada_EDS_calc(entity_data.extremo_2040.pre_bie,hazard_data.extremo_2040);
    
    EDS_data.moderado_2050.pre_con=climada_EDS_calc(entity_data.moderado_2050.pre_con,hazard_data.moderado_2050);
    EDS_data.moderado_2050.pre_rec=climada_EDS_calc(entity_data.moderado_2050.pre_rec,hazard_data.moderado_2050);
    EDS_data.moderado_2050.pre_bie=climada_EDS_calc(entity_data.moderado_2050.pre_bie,hazard_data.moderado_2050);
    
    EDS_data.extremo_2050.pre_con=climada_EDS_calc(entity_data.extremo_2050.pre_con,hazard_data.extremo_2050);
    EDS_data.extremo_2050.pre_rec=climada_EDS_calc(entity_data.extremo_2050.pre_rec,hazard_data.extremo_2050);
    EDS_data.extremo_2050.pre_bie=climada_EDS_calc(entity_data.extremo_2050.pre_bie,hazard_data.extremo_2050);
    save(filename,'EDS_data')
else
    load(filename)
end
% Eventos disponibles en Hazard
for ii=1:hazard_data.actual_2015.event_count;
    if ii==1
        disp_evento=['Evento ' num2str(ii)];
    else
        disp_evento=char(disp_evento,['Evento ' num2str(ii)]);
    end
end
% Escenarios disponibles pra el gráfico
set(handles.select_evento,'string',disp_evento)
escenarios=char('Actual   - 2016','Moderado - 2040','Extremo  - 2040','Moderado - 2050',...
    'Extremo  - 2050');
set(handles.escenarios,'string',escenarios)

%nombre de columnas y filas de los resultados
set(handles.results, 'rowname', {'Daño Experado (con)', 'Daño Esperado (bie)', 'Daño Esperado (rec)','Precio Construccion Total',...
    'Precio Bienes Total','Precio Recontruccion Total'})
set(handles.results,'columnname',{'Valores $'})

% por tipo
set(handles.results_cat, 'rowname',{...
    'Viviendas AUP'
    'Viviendas '
    'Zoológico'
    'Escuelas'
%     '5	Roads'
%     '6	Buildings'
})

% set(handles.results_cat, 'rowname', { 'Daño Esperado AUP','Daño Esperado Casas','Daño Esperado Edficios','Daño Esperado Escuelas'})
set(handles.results_cat,'columnname',{'Construcción' 'Bienes' 'Reconstrucción'})

% Nombre de filas y comunas de los puntos específicos
set(handles.info_pts, 'rowname', {'Categoría','Inundaciones (m)','Daño Esperado (con)',...
    'Daño Esperado (bie)','Daño Esperado (con)','Precio Construccion Total',...
    'Precio Bienes Total','Precio Recontruccion Total'})
set(handles.info_pts,'columnname',{'Valores'})
