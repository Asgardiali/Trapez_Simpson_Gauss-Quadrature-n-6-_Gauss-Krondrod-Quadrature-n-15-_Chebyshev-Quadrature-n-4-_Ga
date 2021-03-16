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
% Kullanýcýdan istenilen veriler alýndý.
% [0 4] aralýðý için aþaðýdaki tanýmlamalar yapýldý.

startValue=0;
finishValue=4;
n=str2double(get(handles.nValue,'string'));
a=str2double(get(handles.aValue,'string'));
b=str2double(get(handles.bValue,'string'));
c=str2double(get(handles.cValue,'string'));
d=str2double(get(handles.dValue,'string'));

if(n>15 || n<15)
    f=msgbox('Lütfen n deðeri olarak 15 giriniz...');
else

% GUI exe dönüþümünde syms elemanlarýný desteklemediði için inline içine
% yazýlacak fonksiyonlarý aþaðýdaki gibi stringler oluþturarak yazdým.

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

% Her iki fonksiyonun altýnda kalan alaný bulmak için slaytlarda verilen
% kodlarý uygulamaya soktum.
vf=GaussKronrodQuad(f,startValue,finishValue,n);
vg=GaussKronrodQuad(g,startValue,finishValue,n);
% Aralarýnda kalan alaný bulmak için mutlak deðerini aldým. Çünkü bazý
% noktalarda f fonksiyonu büyük deðer alýrken, bazý noktalarda da g
% fonksiyonu büyük deðer alýyor. Bu nedenle mutlak deðerini aldým.

betweenValue=abs(vf-vg);
% Kullanýcý arayüzünde cevabý yansýttým.
set(handles.result,'string',betweenValue);
end