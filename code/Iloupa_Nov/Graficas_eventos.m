function varargout = Graficas_eventos(varargin)
% GRAFICAS_EVENTOS MATLAB code for Graficas_eventos.fig
%      GRAFICAS_EVENTOS, by itself, creates a new GRAFICAS_EVENTOS or raises the existing
%      singleton*.
%
%      H = GRAFICAS_EVENTOS returns the handle to a new GRAFICAS_EVENTOS or the handle to
%      the existing singleton*.
%
%      GRAFICAS_EVENTOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAFICAS_EVENTOS.M with the given input arguments.
%
%      GRAFICAS_EVENTOS('Property','Value',...) creates a new GRAFICAS_EVENTOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Graficas_eventos_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Graficas_eventos_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Graficas_eventos

% Last Modified by GUIDE v2.5 19-Sep-2016 19:30:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Graficas_eventos_OpeningFcn, ...
    'gui_OutputFcn',  @Graficas_eventos_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
global hazard_data entity_data EDS_data climada_global
% End initialization code - DO NOT EDIT


% --- Executes just before Graficas_eventos is made visible.
function Graficas_eventos_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Graficas_eventos (see VARARGIN)
inicializacion_gui

ilohuapa_info_run
handles.output = hObject;


% Update handles structure
guidata(hObject, handles);


% UIWAIT makes Graficas_eventos wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Graficas_eventos_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in escenarios.
function escenarios_Callback(hObject, eventdata, handles)
% hObject    handle to escenarios (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns escenarios contents as cell array
%        contents{get(hObject,'Value')} returns selected item from escenarios


% --- Executes during object creation, after setting all properties.
function escenarios_CreateFcn(hObject, eventdata, handles)
% hObject    handle to escenarios (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in grafica.
function grafica_Callback(hObject, eventdata, handles)
global Data_ref hazard_data entity_data EDS_data
% hObject    handle to grafica (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Programa para graficar los Hazard . intensity en Ilohuapa
% inicializa Climada

% Lectura de las coordenadas del Ilohuapa q nosostros estamos utilizando

escenario=get(handles.escenarios,'Value');
switch escenario
    case 1
        % hazard actual
        hazard=hazard_data.actual_2015;
        entity=entity_data.actual_2015;
        EDS=EDS_data.actual_2015;
    case 2
        % hazard moderado
        hazard=hazard_data.moderado_2040;
        entity=entity_data.moderado_2040;
        EDS=EDS_data.moderado_2040;
    case 3
        %hazard extremo
        hazard=hazard_data.extremo_2040;
        entity=entity_data.extremo_2040;
        EDS=EDS_data.extremo_2040;
    case 4
        hazard=hazard_data.moderado_2050;
        entity=entity_data.moderado_2050;
        EDS=EDS_data.moderado_2050;
    case 5
        hazard=hazard_data.extremo_2050;
        entity=entity_data.extremo_2050;
        EDS=EDS_data.extremo_2050;
end
Data_ref.hazard=hazard;
Data_ref.entity=entity;
Data_ref.EDS=EDS;
% Data=xlsread('viviendas01');
Lon=Data_ref.entity.pre_bie.assets.lon;
Lat=Data_ref.entity.pre_bie.assets.lat;
Cat=Data_ref.entity.pre_bie.assets.Category;
LonmaxE=max(Lon);
LonminE=min(Lon);
LatmaxE=max(Lat);
LatminE=min(Lat);



% Datos completos del sistema, longitud, latitud, intensidad de  6
% escenarios
LonG=hazard.lon;
LatG=hazard.lat;
IntentG=hazard.intensity;



%------------ Graficación de Eventos----------------
Evento=get(handles.select_evento,'Value');

% Extrayendo del Hazard la región de interés
idx_part=find(LonG<=LonmaxE&LonG>=LonminE&LatG<=LatmaxE&LatG>=LatminE);
LonG_part=LonG(idx_part); % Parte de Longitudes del hazard original
LatG_part=LatG(idx_part); % Parte de Latitudes del hazard original
Inten_part=IntentG(Evento,idx_part); %parte de intensidades del hazard original

% Contrucción de la Grilla
LonG_x=unique(LonG_part);
LatG_y=unique(LatG_part);
[LonG_X,LatG_Y]=meshgrid(LonG_x,LatG_y);

% Valor de Intesidad por cada par de coordenadas.
Z=zeros(size(LonG_X));
for i=1:length(LonG_x)
    j=i-1;
    Z(1:150,i)= Inten_part(150*j+1:150*i);
end



% Graficos
axes(handles.axes2)

steps10=10;
c_ax = [0.05 1.15];
startcolor   = [0.89	0.93	0.89];
middlecolor1 = [0.55	0.78	0.59];
middlecolor2 = [0.43	0.84	0.78];
endcolor     = [0.05	0.37	0.55];
for i=1:3
    cmap1(:,i)= startcolor(i):(middlecolor1(i)-startcolor(i))/(ceil(steps10/2)-1):middlecolor1(i);
    cmap2(:,i)= middlecolor2(i):(endcolor(i)-middlecolor2(i))/(ceil(steps10/2)-1):endcolor(i);
end
cmap = [1.0 1.0 1.0; cmap1; cmap2];
set(handles.axes2,'color','none')

contourf(LonG_X,LatG_Y,Z,'edgecolor','none')
c=colorbar;
colormap(cmap)


% Ploteo de los puntos de interés
hold on
% AUP Housing
[a,b]=find(Cat==1);
plot(Lon(b),Lat(b),'.r')
% Housing
[a,b]=find(Cat==2);
plot(Lon(b),Lat(b),'.b')

% Hospitals
[a,b]=find(Cat==3);
plot(Lon(b),Lat(b),'.y')

% Escuelas
[a,b]=find(Cat==4);
plot(Lon(b),Lat(b),'.g')

% Carteras
[a,b]=find(Cat==5);
plot(Lon(b),Lat(b),'.c')

% Edificioes
[a,b]=find(Cat==6);
plot(Lon(b),Lat(b),'.p')
legend('','Viviendas AUP','Viviendas','Edificacions Especiales','Escuelas','Location','Best')


set(handles.axes2,'color','white')
hold off;
title(['Intensidad (m) - Evento ' num2str(Evento)])


% '1	Housing AUPs'
% '2	Housing'
% '3	Hospitals'
% '4	Schools'
% '5	Roads'
% '6	Buildings'


set(handles.results, 'data', {num2str(EDS.pre_con.ED,'% 12.2f'); num2str(EDS.pre_bie.ED,'% 12.2f'); num2str(EDS.pre_rec.ED,'% 12.2f');...
    num2str(EDS.pre_con.Value,'%#12.2f');num2str(EDS.pre_bie.Value,'% 12.2f');num2str(EDS.pre_rec.Value,'%12.2f')})



idx_1= entity.pre_con.assets.Category==1;
ED_cat{1,1}=num2str(sum(EDS.pre_con.ED_at_centroid(idx_1)),'%#12.2f');
ED_cat{1,2}=sum(EDS.pre_bie.ED_at_centroid(idx_1));
ED_cat{1,3}=sum(EDS.pre_rec.ED_at_centroid(idx_1));
idx_2= entity.pre_con.assets.Category==2;
ED_cat{2,1}=sum(EDS.pre_con.ED_at_centroid(idx_2));
ED_cat{2,2}=sum(EDS.pre_bie.ED_at_centroid(idx_2));
ED_cat{2,3}=sum(EDS.pre_rec.ED_at_centroid(idx_2));
idx_3= entity.pre_con.assets.Category==3;
ED_cat{3,1}=sum(EDS.pre_con.ED_at_centroid(idx_3));
ED_cat{3,2}=sum(EDS.pre_bie.ED_at_centroid(idx_3));
ED_cat{3,3}=sum(EDS.pre_rec.ED_at_centroid(idx_3));
idx_4= entity.pre_con.assets.Category==4;
ED_cat{4,1}=sum(EDS.pre_con.ED_at_centroid(idx_4));
ED_cat{4,2}=sum(EDS.pre_bie.ED_at_centroid(idx_3));
ED_cat{4,3}=sum(EDS.pre_rec.ED_at_centroid(idx_3));
idx_5= entity.pre_con.assets.Category==5;
ED_cat{5,1}=sum(EDS.pre_con.ED_at_centroid(idx_5));
ED_cat{5,2}=sum(EDS.pre_bie.ED_at_centroid(idx_5));
ED_cat{5,3}=sum(EDS.pre_rec.ED_at_centroid(idx_5));
idx_6= entity.pre_con.assets.Category==6;
ED_cat{6,1}=sum(EDS.pre_con.ED_at_centroid(idx_6));
ED_cat{6,2}=sum(EDS.pre_bie.ED_at_centroid(idx_6));
ED_cat{6,3}=sum(EDS.pre_rec.ED_at_centroid(idx_6));


set(handles.results_cat, 'data', ED_cat)

% Información utilizada en el cáluclo de puntos específicos
Data_ref.LonG_X=LonG_X;
Data_ref.LatG_Y=LatG_Y;
Data_ref.Z=Z;

myCursor = datacursormode(handles.figure1);
set(myCursor,'Enable','on')

disp('---- Gráfica terminada ----')


% --------------------------------------------------------------------
function graph_Callback(hObject, eventdata, handles)
% hObject    handle to graph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in info_punto.
function info_punto_Callback(hObject, eventdata, handles)
global Data_ref
% hObject    handle to info_punto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.info_pts, 'data', {})
Lon=Data_ref.entity.pre_con.assets.lon;
Lat=Data_ref.entity.pre_con.assets.lat;
for i=1:length(Lon)
    d=sqrt((Data_ref.LonG_X-Lon(i)).^2+(Data_ref.LatG_Y-Lat(i)).^2);
    den=1./(d.^3);
    num=Data_ref.Z.*den;
    Z_punto(i,1)=sum(sum(num))/sum(sum(den));
end


menu = findall(get(gcf,'Children'),'Type','uicontextmenu');
menuCallback = get(menu,'Callback');
dataCursor = menuCallback{2};
% Get the coordinates if a datatip exists.
info = getCursorInfo(dataCursor);
if ~isempty(info)
    Lon_pt=info.Position(1);
    Lat_pt=info.Position(2);
    idx=find(Data_ref.LonG_X==Lon_pt&Data_ref.LatG_Y==Lat_pt);
    if ~isempty(idx)
        info_p(2,1)={Data_ref.Z(idx)};
        set(handles.info_pts, 'data', info_p)
    else
        idx= Lon==Lon_pt&Lat==Lat_pt;
        cat=char('Viviendas AUP',...
            'Viviendas',...
            'Edificacions Especiales',...
            'Escuelas',...
            'Carreteras',...
            'Edificios');
        info_p(1,1)={cat(Data_ref.EDS.pre_con.assets.Category(idx),:)};
        info_p(2,1)={Z_punto(idx)};
        info_p(3,1)={Data_ref.EDS.pre_con.ED_at_centroid(idx)};
        info_p(4,1)={Data_ref.EDS.pre_bie.ED_at_centroid(idx)};
        info_p(5,1)={Data_ref.EDS.pre_rec.ED_at_centroid(idx)};
        info_p(6,1)={Data_ref.EDS.pre_con.assets.Value(idx)};
        info_p(7,1)={Data_ref.EDS.pre_bie.assets.Value(idx)};
        info_p(8,1)={Data_ref.EDS.pre_rec.assets.Value(idx)};
        
        set(handles.info_pts, 'data', info_p)
        %         inten=(Data(idx,18));
        %         set(handles.intensidad,'string',num2str(inten));
        %         set(handles.pre_con_p,'string',num2str(Data(idx,15)));
        %         set(handles.pre_rec_p,'string',num2str(Data(idx,16)));
        %         set(handles.pre_bie_p,'string',num2str(Data(idx,17)));
    end
end


% --- Executes on selection change in select_evento.
function select_evento_Callback(hObject, eventdata, handles)
% hObject    handle to select_evento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns select_evento contents as cell array
%        contents{get(hObject,'Value')} returns selected item from select_evento


% --- Executes during object creation, after setting all properties.
function select_evento_CreateFcn(hObject, eventdata, handles)
% hObject    handle to select_evento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
