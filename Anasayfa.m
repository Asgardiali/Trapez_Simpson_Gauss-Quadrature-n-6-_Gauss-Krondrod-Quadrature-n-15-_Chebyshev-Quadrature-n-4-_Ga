function varargout = Anasayfa(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Anasayfa_OpeningFcn, ...
                   'gui_OutputFcn',  @Anasayfa_OutputFcn, ...
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

function Anasayfa_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = Anasayfa_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function TrapezGUI_Callback(hObject, eventdata, handles)
TrapezGUI;
function SimpsonGUI_Callback(hObject, eventdata, handles)
SimpsonGUI;
function GaussQuadratureGUI_Callback(hObject, eventdata, handles)
GaussQuadratureGUI;
function GaussKrondrodQuadratureGUI_Callback(hObject, eventdata, handles)
GaussKronrodQuadratureGUI;
function ChebyshevQuadratureGUI_Callback(hObject, eventdata, handles)
ChebyshevQuadratureGUI;
function GaussLobattoQuadratureGUI_Callback(hObject, eventdata, handles)
GaussLobattoQuadratureGUI;
function Compare_Callback(hObject, eventdata, handles)
TheBestMethodGUI;
