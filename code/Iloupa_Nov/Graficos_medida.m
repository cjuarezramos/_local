load datos

entity_present=entity_data.actual_2016.pre_bie;
hazard_present=hazard_data.actual_2016;

entity_future=entity_data.moderado_2040.pre_bie;
hazard_future=hazard_data.moderado_2040;

EDS_present         = climada_EDS_calc(entity_present, hazard_present, 'present');
EDS_economic_growth = climada_EDS_calc(entity_future , hazard_present, 'present');
EDS_future          = climada_EDS_calc(entity_future , hazard_future , 'present');

risk_today          = EDS_present.ED;
risk_econ_growth    = EDS_economic_growth.ED - EDS_present.ED;
risk_climate_change = EDS_future.ED          - EDS_economic_growth.ED;
total_climate_risk  = EDS_future.ED;




factor=1;


for box_i=1:4
    if box_i==1
        x = [0,1];
        y = [risk_today,risk_today]*factor;
        level     = 0*factor;
        FaceColor = [255 215   0]/255; %yellow
        textcolor = 'k';
        %FaceColor = [224 238 224 ]/255; grey %FaceColor = [0.3 0.01 .0];
    end
    if box_i==2 %economic growth
        x = [1.5,2.5];
        y = [risk_today+risk_econ_growth,risk_today+risk_econ_growth]*factor;
        level     = risk_today*factor;
        FaceColor = [255 127   0 ]/255; %orange
        textcolor = 'w';
        %FaceColor = [180 238 180  ]/255;light green %[205 201 165]/255; %FaceColor = [0.5 .1 .1];
    end
    if box_i==3 %climate change
        x = [3,4];
        y = [total_climate_risk,total_climate_risk]*factor;
        level     = (risk_today+risk_econ_growth)*factor;
        FaceColor = [238  64   0 ]/255; %dark orange
        textcolor = 'w';
        %FaceColor = [155 205 155 ]/255; %green %FaceColor = [0.8 .1 .1];
    end
    if box_i==4
        x = [4.5,5.5];
        y = [total_climate_risk,total_climate_risk]*factor;
        level     = 0*factor;
        FaceColor = [205   0   0 ]/255; %red
        textcolor = 'w';
        %FaceColor = [105 139 105 ]/255; %dark green %FaceColor = [0.9 .1 .1];
    end
    %%FaceColor=FaceColor/max(FaceColor);
    %area('v6',x,y,level,'FaceColor',FaceColor,'EdgeColor',FaceColor);
    %area(x,y,level,'FaceColor',FaceColor,'EdgeColor',FaceColor);
    area(x,y,'BaseValue',level,'FaceColor',FaceColor,'EdgeColor',FaceColor);
    if level>0,area(x,[level level],'BaseValue',0,'FaceColor',[1 1 1],'EdgeColor',[1 1 1]);end
    text(mean(x), y(1)*0.9, num2str(y(1)-level(1),'%2.0f'),'horizontalalignment','center','fontweight','bold','color',textcolor)
end % box_i
% xlim([-0.2 5.7])
% hold on
% set(gca,'XTick',[0.5,2,3.5,5]);
% set(gca,'XTickLabel',xticklabel_,'fontsize',fontsize_);
% ylim_  = get(gca,'ylim');
% text_y = -diff(ylim_)*0.1;
% 
% text(0.5, text_y, 'Risk today'        ,'fontsize',fontsize_, 'horizontalalignment','center')
% text(2.0, text_y, 'economic growth'   ,'fontsize',fontsize_, 'horizontalalignment','center')
% text(3.5, text_y, 'climate change'    ,'fontsize',fontsize_, 'horizontalalignment','center')
% text(5.0, text_y, 'Total climate risk','fontsize',fontsize_, 'horizontalalignment','center')
% 
% ylabel(ylabel_str)
% %axis tight
% box off
% set(gca,'XGrid','off')
% set(gca,'TickLength',[0,0],'layer','top')