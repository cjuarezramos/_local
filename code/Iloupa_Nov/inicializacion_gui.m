% Inicialización de Climada
global_ilohuapa


% Fondos
% a=imread('Solmaforo.jpg');
% % set(handles.axes2,'Visible','off')
% image(a);
% % handles.imagen=a; 
% % imagesc(handles.imagen) 
% axis off
axes(handles.axes1)
set(handles.axes1,'Visible','off')

direc=cd;
direc=direc(1:end-38);
run([direc 'climada\startup.m'])
