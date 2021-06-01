function varargout = LogikaOR(varargin)
% LOGIKAOR MATLAB code for LogikaOR.fig
%      LOGIKAOR, by itself, creates a new LOGIKAOR or raises the existing
%      singleton*.
%
%      H = LOGIKAOR returns the handle to a new LOGIKAOR or the handle to
%      the existing singleton*.
%
%      LOGIKAOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOGIKAOR.M with the given input arguments.
%
%      LOGIKAOR('Property','Value',...) creates a new LOGIKAOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LogikaOR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LogikaOR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LogikaOR

% Last Modified by GUIDE v2.5 01-Jun-2021 15:20:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LogikaOR_OpeningFcn, ...
                   'gui_OutputFcn',  @LogikaOR_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before LogikaOR is made visible.
function LogikaOR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LogikaOR (see VARARGIN)

% Choose default command line output for LogikaOR
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LogikaOR wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LogikaOR_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in tmbl_hasil.
function tmbl_hasil_Callback(hObject, eventdata, handles)
% hObject    handle to tmbl_hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
angka1=str2num(get(handles.angka1, 'String'));
angka2=str2num(get(handles.angka2, 'String'));
if ((angka1 >= 0 && angka1 < 2) && (angka2 >= 0 && angka2 < 2))
    net = newp([0 1; 0 1], 1);
    net.IW{1,1} = [-1 1];
    bias = [1];
    net.b{1} = bias;
    p = [[1;1] [1;0] [0;1] [0;0]];
    t = [1 1 1 0];
    net = train(net,p,t);
 
    hasil = net([angka1;angka2]);
    
    set(handles.hasil, 'String', hasil);
    set(handles.biass, 'String', net.b{1});
else
    set(handles.hasil, 'String', "Ulangi Inputan");
    set(handles.biass, 'String', "Ulangi Inputan");
end



function angka1_Callback(hObject, eventdata, handles)
% hObject    handle to angka1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angka1 as text
%        str2double(get(hObject,'String')) returns contents of angka1 as a double
angka1 = str2double(get(hObject, 'String'));
if isnan(angka1)
    set(hObject, 'String', '');
    errordlg('Kolom harus diisi dengan angka !!','Input Ulang');
elseif (angka1 < 0 && angka1 > 1)
    set(hObject, 'String', '');
    errordlg('Input Angka 0 atau 1','Input Ulang'); 
elseif isempty(angka1) 
    errordlg('Kolom tidak boleh kosong !!','Input Ulang');   
end 

% --- Executes during object creation, after setting all properties.
function angka1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angka1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function angka2_Callback(hObject, eventdata, handles)
% hObject    handle to angka2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angka2 as text
%        str2double(get(hObject,'String')) returns contents of angka2 as a double
angka2 = str2double(get(hObject, 'String'));
if isnan(angka2)
    set(hObject, 'String', '');
    errordlg('Kolom harus diisi dengan angka !!','Input Ulang');
elseif (angka2 < 0 && angka2 > 1)
    set(hObject, 'String', '');
    errordlg('Input Angka 0 atau 1','Input Ulang'); 
elseif isempty(angka2) 
    errordlg('Kolom tidak boleh kosong !!','Input Ulang');   
end 

% --- Executes during object creation, after setting all properties.
function angka2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angka2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
