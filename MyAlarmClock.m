function varargout = MyAlarmClock(varargin)
% MYALARMCLOCK MATLAB code for MyAlarmClock.fig
%      MYALARMCLOCK, by itself, creates a new MYALARMCLOCK or raises the existing
%      singleton*.
%
%      H = MYALARMCLOCK returns the handle to a new MYALARMCLOCK or the handle to
%      the existing singleton*.
%
%      MYALARMCLOCK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYALARMCLOCK.M with the given input arguments.
%
%      MYALARMCLOCK('Property','Value',...) creates a new MYALARMCLOCK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MyAlarmClock_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MyAlarmClock_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MyAlarmClock

% Last Modified by GUIDE v2.5 14-Dec-2018 21:13:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MyAlarmClock_OpeningFcn, ...
                   'gui_OutputFcn',  @MyAlarmClock_OutputFcn, ...
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


% --- Executes just before MyAlarmClock is made visible.
function MyAlarmClock_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MyAlarmClock (see VARARGIN)

% Choose default command line output for MyAlarmClock
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

set(handles.text2, 'string', datestr (datetime('now')));
set(handles.edit1, 'string', datestr (datetime('now')));




% UIWAIT makes MyAlarmClock wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MyAlarmClock_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Alarm_time = datevec(get(handles.edit1, 'string'));

if (etime(Alarm_time, clock)<0)
    set(handles.text5,'Visible', 'on');
    set(handles.text2, 'string', datestr (datetime('now')));
    return;
end

while(etime(Alarm_time, clock)>0.5)
        set(handles.text5,'Visible', 'off');
    set(handles.text2, 'string', datestr (datetime('now')));
    drawnow;
end

y = audioread('Alarm Beep Sound Effect.mp3');
sound(y);


    
    
    

    
