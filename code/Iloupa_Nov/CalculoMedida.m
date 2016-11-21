load datos


% Cálculo de la Costo/beneficio de la medida.
global_ilohuapa

% Cálculo del valor presente Neto -  NPV
climada_global.present_reference_year;
climada_global.future_reference_year=2040;
climada_global.impact_time_dependence

% Moderado 2040
hazard=hazard_data.moderado_2040;
entity=entity_data.moderado_2040.pre_bie;

impacto_medida_moderado_2040=climada_measures_impact(entity,hazard,'no');

figure(1)
climada_adaptation_cost_curve(impacto_medida_moderado_2040)



% Extremo 2040
hazard=hazard_data.extremo_2040;
entity=entity_data.extremo_2040.pre_bie;

impacto_medida_extremo_2040=climada_measures_impact(entity,hazard,'no');

figure(2)
climada_adaptation_cost_curve(impacto_medida_extremo_2040)


% Cálculo del valor presente Neto -  NPV
climada_global.present_reference_year;
climada_global.future_reference_year=2050;
climada_global.impact_time_dependence

% Moderado 2050
hazard=hazard_data.moderado_2050;
entity=entity_data.moderado_2050.pre_bie;

impacto_medida_moderado_2050=climada_measures_impact(entity,hazard,'no');
figure(3)
climada_adaptation_cost_curve(impacto_medida_moderado_2050)

% Extremo 2050
hazard=hazard_data.extremo_2050;
entity=entity_data.extremo_2050.pre_bie;

impacto_medida_extremo_2050=climada_measures_impact(entity,hazard,'no');

figure(4)
climada_adaptation_cost_curve(impacto_medida_extremo_2050)

ED_medida=[impacto_medida_moderado_2040.ED;
    impacto_medida_extremo_2040.ED;
    impacto_medida_moderado_2050.ED;
    impacto_medida_extremo_2050.ED;];