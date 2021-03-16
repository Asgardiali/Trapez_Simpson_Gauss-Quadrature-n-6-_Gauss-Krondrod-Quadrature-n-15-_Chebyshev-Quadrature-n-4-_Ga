function varargout = GaussKronrodQuadratureGUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GaussKronrodQuadratureGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GaussKronrodQuadratureGUI_OutputFcn, ...
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

function GaussKronrodQuadratureGUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = GaussKronrodQuadratureGUI_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

image1Array=imread('Fcn1.jpg');
image2Array=imread('Fcn2.jpg');
imshow(image1Array, 'Parent', handles.fcn1);
imshow(image2Array, 'Parent', handles.fcn2);


function aValue_Callback(hObject, eventdata, handles)

function aValue_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function bValue_Callback(hObject, eventdata, handles)

function bValue_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function cValue_Callback(hObject, eventdata, handles)

function cValue_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dValue_Callback(hObject, eventdata, handles)

function dValue_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function nValue_Callback(hObject, eventdata, handles)

function nValue_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function result_Callback(hObject, eventdata, handles)

function result_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function calculate_Callback(hObject, eventdata, handles)

cla(handles.axes);
% Kullan�c�dan istenilen veriler al�nd�.
% [0 4] aral��� i�in a�a��daki tan�mlamalar yap�ld�.

startValue=0;
finishValue=4;
n=str2double(get(handles.nValue,'string'));
a=str2double(get(handles.aValue,'string'));
b=str2double(get(handles.bValue,'string'));
c=str2double(get(handles.cValue,'string'));
d=str2double(get(handles.dValue,'string'));

if(n>15 || n<15)
    f=msgbox('L�tfen n de�eri olarak 15 giriniz...');
else

% GUI exe d�n���m�nde syms elemanlar�n� desteklemedi�i i�in inline i�ine
% yaz�lacak fonksiyonlar� a�a��daki gibi stringler olu�turarak yazd�m.

s1=num2str(a);
s2='*(cos';
s3='(';
s4=num2str(b);
s5='*x).^2)';
str=strcat(s1,s2,s3,s4,s5);
% F fonksiyonunu elde ettim
f=inline(str);

s6='(';
s7=num2str(c);
s8='*(x.^2))/(';
s9=num2str(d);
s10='*(pi^2))';
str2=strcat(s6,s7,s8,s9,s10);
% G fonksiyonunu elde ettim
g=inline(str2);

x=0:0.001:3*pi;
plot(x,f(x));
hold on
plot(x,g(x));
legend('f(x)','g(x)');
xlabel('x');
ylabel('f(x),g(x)')

% Her iki fonksiyonun alt�nda kalan alan� bulmak i�in slaytlarda verilen
% kodlar� uygulamaya soktum.
vf=GaussKronrodQuad(f,startValue,finishValue,n);
vg=GaussKronrodQuad(g,startValue,finishValue,n);
% Aralar�nda kalan alan� bulmak i�in mutlak de�erini ald�m. ��nk� baz�
% noktalarda f fonksiyonu b�y�k de�er al�rken, baz� noktalarda da g
% fonksiyonu b�y�k de�er al�yor. Bu nedenle mutlak de�erini ald�m.

betweenValue=abs(vf-vg);
% Kullan�c� aray�z�nde cevab� yans�tt�m.
set(handles.result,'string',betweenValue);
end