function ilohuapa_info_run(a,handles)

global_ilohuapa
if a==0
    % Lecturas de hazard actual
    hazard_data.actual_2016=climada_hazard_load('Salvador_hazard_FL_2016_today_mdf');
    
    % hazard moderado
    hazard_data.moderado_2040=climada_hazard_load('Salvador_hazard_FL_2040_moderate_mdf');
    hazard_data.moderado_2050=climada_hazard_load('Salvador_hazard_FL_2050_moderate_mdf');
    
    %hazard extremo
    hazard_data.extremo_2040=climada_hazard_load('Salvador_hazard_FL_2040_extreme_mdf');
    hazard_data.extremo_2050=climada_hazard_load('Salvador_hazard_FL_2050_extreme_mdf');
    
    
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
    
    % % ORIGINALES SOLO INTENSIDADES MODIFICADOS
    % % Lecturas de hazard actual
    % hazard_data.actual_2015=climada_hazard_load('Salvador_hazard_FL_2015_today');
    %
    % % hazard moderado
    % hazard_data.moderado_2040=climada_hazard_load('Salvador_hazard_FL_2040_moderate_cc');
    % hazard_data.moderado_2050=climada_hazard_load('Salvador_hazard_FL_2050_moderate_cc');
    %
    % %hazard extremo
    % hazard_data.extremo_2040=climada_hazard_load('Salvador_hazard_FL_2040_extreme_cc');
    % hazard_data.extremo_2050=climada_hazard_load('Salvador_hazard_FL_2050_extreme_cc');
    % %
    
    % Entity
    entity_data.actual_2016.pre_con=climada_entity_read('FL_entity_Ilohuapa_prec_con_to.xlsx',hazard_data.actual_2016);
    entity_data.actual_2016.pre_rec=climada_entity_read('FL_entity_Ilohuapa_prec_rec_to.xlsx',hazard_data.actual_2016);
    entity_data.actual_2016.pre_bie=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to.xlsx',hazard_data.actual_2016);
    
    
    % Entidades Futuras,
    % A�o 2040
    Crecimiento=2.6/100;
    present_year=2016;
    future_year=2040;
    delta_years                = future_year-present_year;
    growth_factor              = (1+Crecimiento)^delta_years;
    
    
    entity_future=entity_data.actual_2016.pre_con;
    entity_future.assets.Value = entity_future.assets.Value.*growth_factor;
    entity_future.assets.Cover = entity_future.assets.Value;
    entity_data.moderado_2040.pre_con=entity_future;
    entity_data.extremo_2040.pre_con=entity_future;
    
    
    entity_future=entity_data.actual_2016.pre_rec;
    entity_future.assets.Value = entity_future.assets.Value.*growth_factor;
    entity_future.assets.Cover = entity_future.assets.Value;
    entity_data.moderado_2040.pre_rec=entity_future;
    entity_data.extremo_2040.pre_rec=entity_future;
    
    
    entity_future=entity_data.actual_2016.pre_bie;
    entity_future.assets.Value = entity_future.assets.Value.*growth_factor;
    entity_future.assets.Cover = entity_future.assets.Value;
    entity_data.moderado_2040.pre_bie=entity_future;
    entity_data.extremo_2040.pre_bie=entity_future;
    
     % A�o 2050
    Crecimiento=2.6/100;
    present_year=2016;
    future_year=2050;
    delta_years                = future_year-present_year;
    growth_factor              = (1+Crecimiento)^delta_years;
    
    
    entity_future=entity_data.actual_2016.pre_con;
    entity_future.assets.Value = entity_future.assets.Value.*growth_factor;
    entity_future.assets.Cover = entity_future.assets.Value;
    entity_data.moderado_2050.pre_con=entity_future;
    entity_data.extremo_2050.pre_con=entity_future;
    
    
    entity_future=entity_data.actual_2016.pre_rec;
    entity_future.assets.Value = entity_future.assets.Value.*growth_factor;
    entity_future.assets.Cover = entity_future.assets.Value;
    entity_data.moderado_2050.pre_rec=entity_future;
    entity_data.extremo_2050.pre_rec=entity_future;
    
    entity_future=entity_data.actual_2016.pre_bie;
    entity_future.assets.Value = entity_future.assets.Value.*growth_factor;
    entity_future.assets.Cover = entity_future.assets.Value;
    entity_data.moderado_2050.pre_bie=entity_future;
    entity_data.extremo_2050.pre_bie=entity_future;
    
    %     entity_data.moderado_2040.pre_con=climada_entity_read('FL_entity_Ilohuapa_prec_con_to.xlsx',hazard_data.moderado_2040);
    %     entity_data.moderado_2040.pre_rec=climada_entity_read('FL_entity_Ilohuapa_prec_rec_to.xlsx',hazard_data.moderado_2040);
    %     entity_data.moderado_2040.pre_bie=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to.xlsx',hazard_data.moderado_2040);
    %
    %     entity_data.moderado_2050.pre_con=climada_entity_read('FL_entity_Ilohuapa_prec_con_to.xlsx',hazard_data.moderado_2050);
    %     entity_data.moderado_2050.pre_rec=climada_entity_read('FL_entity_Ilohuapa_prec_rec_to.xlsx',hazard_data.moderado_2050);
    %     entity_data.moderado_2050.pre_bie=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to.xlsx',hazard_data.moderado_2050);
    %
    %     entity_data.extremo_2040.pre_con=climada_entity_read('FL_entity_Ilohuapa_prec_con_to.xlsx',hazard_data.extremo_2040);
    %   2  entity_data.extremo_2040.pre_rec=climada_entity_read('FL_entity_Ilohuapa_prec_rec_to.xlsx',hazard_data.extremo_2040);
    %     entity_data.extremo_2040.pre_bie=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to.xlsx',hazard_data.extremo_2040);
    %
    %     entity_data.extremo_2050.pre_con=climada_entity_read('FL_entity_Ilohuapa_prec_con_to.xlsx',hazard_data.extremo_2050);
    %     entity_data.extremo_2050.pre_rec=climada_entity_read('FL_entity_Ilohuapa_prec_rec_to.xlsx',hazard_data.extremo_2050);
    %     entity_data.extremo_2050.pre_bie=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to.xlsx',hazard_data.extremo_2050);
    
    
    % C�lculo EDS
    filename=[climada_global.results_dir '\' 'FL_Expecte_Damage_Ilohuapa.mat'];
    if  ~exist(filename,'file')
        
        EDS_data.actual_2016.pre_con=climada_EDS_calc(entity_data.actual_2016.pre_con,hazard_data.actual_2016);
        EDS_data.actual_2016.pre_rec=climada_EDS_calc(entity_data.actual_2016.pre_rec,hazard_data.actual_2016);
        EDS_data.actual_2016.pre_bie=climada_EDS_calc(entity_data.actual_2016.pre_bie,hazard_data.actual_2016);
        
        
        EDS_data.moderado_2040.pre_con=climada_EDS_calc(entity_data.moderado_2040.pre_con,hazard_data.moderado_2040);
        EDS_data.moderado_2040.pre_rec=climada_EDS_calc(entity_data.moderado_2040.pre_rec,hazard_data.moderado_2040);
        EDS_data.moderado_2040.pre_bie=climada_EDS_calc(entity_data.moderado_2040.pre_bie,hazard_data.moderado_2040);
        
        E2DS_data.extremo_2040.pre_con=climada_EDS_calc(entity_data.extremo_2040.pre_con,hazard_data.extremo_2040);
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
elseif a==1
    % Lecturas de hazard actual
    hazard_data.actual_2016=climada_hazard_load('Salvador_hazard_FL_2016_today_mdf');
    
    % hazard moderado
    hazard_data.moderado_2040=climada_hazard_load('Salvador_hazard_FL_2040_moderate_mdf');
    hazard_data.moderado_2050=climada_hazard_load('Salvador_hazard_FL_2050_moderate_mdf');
    
    %hazard extremo
    hazard_data.extremo_2040=climada_hazard_load('Salvador_hazard_FL_2040_extreme_mdf');
    hazard_data.extremo_2050=climada_hazard_load('Salvador_hazard_FL_2050_extreme_mdf');
    
    
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
    
    % % ORIGINALES SOLO INTENSIDADES MODIFICADOS
    % % Lecturas de hazard actual
    % hazard_data.actual_2015=climada_hazard_load('Salvador_hazard_FL_2015_today');
    %
    % % hazard moderado
    % hazard_data.moderado_2040=climada_hazard_load('Salvador_hazard_FL_2040_moderate_cc');
    % hazard_data.moderado_2050=climada_hazard_load('Salvador_hazard_FL_2050_moderate_cc');
    %
    % %hazard extremo
    % hazard_data.extremo_2040=climada_hazard_load('Salvador_hazard_FL_2040_extreme_cc');
    % hazard_data.extremo_2050=climada_hazard_load('Salvador_hazard_FL_2050_extreme_cc');
    % %
    % Entity
  % Entity
    entity_data.actual_2016.pre_con=climada_entity_read('FL_entity_Ilohuapa_prec_con_to.xlsx',hazard_data.actual_2016);
    entity_data.actual_2016.pre_rec=climada_entity_read('FL_entity_Ilohuapa_prec_rec_to.xlsx',hazard_data.actual_2016);
    entity_data.actual_2016.pre_bie=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to.xlsx',hazard_data.actual_2016);
    
    
    % Entidades Futuras,
    % A�o 2040
    Crecimiento=2.6/100;
    present_year=2016;
    future_year=2040;
    delta_years                = future_year-present_year;
    growth_factor              = (1+Crecimiento)^delta_years;
    
    
    entity_future=entity_data.actual_2016.pre_con;
    entity_future.assets.Value = entity_future.assets.Value.*growth_factor;
    entity_future.assets.Cover = entity_future.assets.Value;
    entity_data.moderado_2040.pre_con=entity_future;
    entity_data.extremo_2040.pre_con=entity_future;
    
    
    entity_future=entity_data.actual_2016.pre_rec;
    entity_future.assets.Value = entity_future.assets.Value.*growth_factor;
    entity_future.assets.Cover = entity_future.assets.Value;
    entity_data.moderado_2040.pre_rec=entity_future;
    entity_data.extremo_2040.pre_rec=entity_future;
    
    
    entity_future=entity_data.actual_2016.pre_bie;
    entity_future.assets.Value = entity_future.assets.Value.*growth_factor;
    entity_future.assets.Cover = entity_future.assets.Value;
    entity_data.moderado_2040.pre_bie=entity_future;
    entity_data.extremo_2040.pre_bie=entity_future;
    
     % A�o 2050
    Crecimiento=2.6/100;
    present_year=2016;
    future_year=2050;
    delta_years                = future_year-present_year;
    growth_factor              = (1+Crecimiento)^delta_years;
    
    
    entity_future=entity_data.actual_2016.pre_con;
    entity_future.assets.Value = entity_future.assets.Value.*growth_factor;
    entity_future.assets.Cover = entity_future.assets.Value;
    entity_data.moderado_2050.pre_con=entity_future;
    entity_data.extremo_2050.pre_con=entity_future;
    
    
    entity_future=entity_data.actual_2016.pre_rec;
    entity_future.assets.Value = entity_future.assets.Value.*growth_factor;
    entity_future.assets.Cover = entity_future.assets.Value;
    entity_data.moderado_2050.pre_rec=entity_future;
    entity_data.extremo_2050.pre_rec=entity_future;
    
    entity_future=entity_data.actual_2016.pre_bie;
    entity_future.assets.Value = entity_future.assets.Value.*growth_factor;
    entity_future.assets.Cover = entity_future.assets.Value;
    entity_data.moderado_2050.pre_bie=entity_future;
    entity_data.extremo_2050.pre_bie=entity_future;
    %     % Entity
    %     entity_data.actual_2015.pre_con=climada_entity_read('FL_entity_Ilohuapa_prec_con_to.xlsx',hazard_data.actual_2015,1);
    %     entity_data.actual_2015.pre_rec=climada_entity_read('FL_entity_Ilohuapa_prec_rec_to.xlsx',hazard_data.actual_2015,1);
    %     entity_data.actual_2015.pre_bie=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to.xlsx',hazard_data.actual_2015,1);
    %
    %     entity_data.moderado_2040.pre_con=climada_entity_read('FL_entity_Ilohuapa_prec_con_to.xlsx',hazard_data.moderado_2040,1);
    %     entity_data.moderado_2040.pre_rec=climada_entity_read('FL_entity_Ilohuapa_prec_rec_to.xlsx',hazard_data.moderado_2040,1);
    %     entity_data.moderado_2040.pre_bie=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to.xlsx',hazard_data.moderado_2040,1);
    %
    %     entity_data.moderado_2050.pre_con=climada_entity_read('FL_entity_Ilohuapa_prec_con_to.xlsx',hazard_data.moderado_2050,1);
    %     entity_data.moderado_2050.pre_rec=climada_entity_read('FL_entity_Ilohuapa_prec_rec_to.xlsx',hazard_data.moderado_2050,1);
    %     entity_data.moderado_2050.pre_bie=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to.xlsx',hazard_data.moderado_2050,1);
    %
    %     entity_data.extremo_2040.pre_con=climada_entity_read('FL_entity_Ilohuapa_prec_con_to.xlsx',hazard_data.extremo_2040,1);
    %     entity_data.extremo_2040.pre_rec=climada_entity_read('FL_entity_Ilohuapa_prec_rec_to.xlsx',hazard_data.extremo_2040,1);
    %     entity_data.extremo_2040.pre_bie=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to.xlsx',hazard_data.extremo_2040,1);
    %
    %     entity_data.extremo_2050.pre_con=climada_entity_read('FL_entity_Ilohuapa_prec_con_to.xlsx',hazard_data.extremo_2050,1);
    %     entity_data.extremo_2050.pre_rec=climada_entity_read('FL_entity_Ilohuapa_prec_rec_to.xlsx',hazard_data.extremo_2050,1);
    %     entity_data.extremo_2050.pre_bie=climada_entity_read('FL_entity_Ilohuapa_prec_bie_to.xlsx',hazard_data.extremo_2050,1);
    
    
    % C�lculo EDS
    filename=[climada_global.results_dir '\' 'FL_Expecte_Damage_Ilohuapa.mat'];
    
    
    EDS_data.actual_2016.pre_con=climada_EDS_calc(entity_data.actual_2016.pre_con,hazard_data.actual_2016);
    EDS_data.actual_2016.pre_rec=climada_EDS_calc(entity_data.actual_2016.pre_rec,hazard_data.actual_2016);
    EDS_data.actual_2016.pre_bie=climada_EDS_calc(entity_data.actual_2016.pre_bie,hazard_data.actual_2016);
    
    
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
    
    
end




% Eventos disponibles en Hazard
for ii=1:hazard_data.actual_2016.event_count;
    if ii==1
        disp_evento=['Evento ' num2str(ii)];
    else
        disp_evento=char(disp_evento,['Evento ' num2str(ii)]);
    end
end
% Escenarios disponibles pra el gr�fico
set(handles.select_evento,'string',disp_evento)
escenarios=char('Actual   - 2016','Moderado - 2040','Extremo  - 2040','Moderado - 2050',...
    'Extremo  - 2050');
set(handles.escenarios,'string',escenarios)

%nombre de columnas y filas de los resultados
set(handles.results, 'rowname', {'Da�o Experado (con)', 'Da�o Esperado (bie)', 'Da�o Esperado (rec)','Precio Construccion Total',...
    'Precio Bienes Total','Precio Recontruccion Total'})
set(handles.results,'columnname',{'Valores $'})

% por tipo
set(handles.results_cat, 'rowname',{...
    'Viviendas AUP'
    'Viviendas '
    'Edificacions Especiales'
    'Escuelas'
    %     '5	Roads'
    %     '6	Buildings'
    })

% set(handles.results_cat, 'rowname', { 'Da�o Esperado AUP','Da�o Esperado Casas','Da�o Esperado Edficios','Da�o Esperado Escuelas'})
set(handles.results_cat,'columnname',{'Construcci�n' 'Bienes' 'Reconstrucci�n'})

% Nombre de filas y comunas de los puntos espec�ficos
set(handles.info_pts, 'rowname', {'Categor�a','Inundaciones (m)','Da�o Esperado (con)',...
    'Da�o Esperado (bie)','Da�o Esperado (recn)','Precio Construccion Total',...
    'Precio Bienes Total','Precio Recontruccion Total'})
set(handles.info_pts,'columnname',{'Valores'})
