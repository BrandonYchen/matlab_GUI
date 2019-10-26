function varargout = gui_gui(varargin)
% GUI_GUI MATLAB code for gui_gui.fig
%      GUI_GUI, by itself, creates a new GUI_GUI or raises the existing
%      singleton*.
%
%      H = GUI_GUI returns the handle to a new GUI_GUI or the handle to
%      the existing singleton*.
%
%      GUI_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_GUI.M with the given input arguments.
%
%      GUI_GUI('Property','Value',...) creates a new GUI_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_gui

% Last Modified by GUIDE v2.5 25-Oct-2019 14:40:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_gui_OutputFcn, ...
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


% --- Executes just before gui_gui is made visible.
function gui_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_gui (see VARARGIN)

% Choose default command line output for gui_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
javaFrame = get(gcf,'JavaFrame');
set(javaFrame,'Maximized',1);

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1_1.
function pushbutton1_1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear file;
clear path;
clear file_path;
[file,path] = uigetfile('*.xlsx'); %����ļ�
file_suffix0 = file(end-5:end);
file_suffix = file_suffix0(strfind(file_suffix0,'.'):end) %�ж��ļ�����
clear file_suffix0;
file_path = strcat(path,file)
if(file_suffix == '.xlsx' | file_suffix == '.xls') 
    xls_data=xlsread(file_path);    %��ȡExcel�ļ�
    set(handles.uitable1,'Data',xls_data);
end

% --- Executes on button press in pushbutton1_2.
function pushbutton1_2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear table_data;clear data_cell;clear filter;
clear hangshu;clear lieshu;clear hang;clear lie;

table_data = get(handles.uitable1,'Data');
data_cell = cell2mat(table_data);    %ת��Ԫ������
filter = {'*.xlsx';'*.xls';'*.txt';'*.docx';'*.*'};
[Filename,Pathname] = uiputfile(filter,'���Ϊ','data.xlsx');  %�����ļ�����Ի���
if (Filename==0 & Pathname==0)
	msgbox('��û�б�������!','ȷ��','error');
else
    str=[Pathname Filename];
    %��ȡ��������
    CloumnName=get(handles.uitable1,'ColumnName')                           
    CloumnName=CloumnName{2,1}
    
    dataExcel=cell(size(data_cell,1)+1,size(data_cell,2));
    dataExcel(1,:)=CloumnName;                                            %��ȡ���������
    dataExcel(2:end,:)=num2cell(data_cell);                                              %��ȡ������ݣ�
    xlswrite(str,dataExcel);                                              %���µ�Ԫ����д��ָ����EXCEl�ļ��У�
    
%     fid=fopen(str,'wt');    %���´򿪽�����excel�ļ�,��д
%     ������
%     hangshu = size(data_cell,1);    %����
%     lieshu = size(data_cell,2);     %����
%     for hang=1:size(data_cell,1);    
%         for lie=1:size(data_cell,2) 
%             if(lie == size(data_cell,2))
%                  fprintf(fid,'%f\r',data_cell(hang,lie));
%             else
%                 fprintf(fid,'%f\t',data_cell(hang,lie));   
%             end
%         end
%     end
%     fclose(fid);        %�ر�excel
    msgbox('����������ϣ�','ȷ��','warn');
end

% --- Executes on button press in pushbutton2_1.
function pushbutton2_1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear file;
clear path;
clear file_path;
[file,path] = uigetfile('*.xlsx'); %����ļ�
file_suffix0 = file(end-5:end);
file_suffix = file_suffix0(strfind(file_suffix0,'.'):end);  %�ж��ļ�����
clear file_suffix0;
file_path = strcat(path,file)
if(file_suffix == '.xlsx') 
    xls_data=xlsread(file_path);    %��ȡExcel�ļ�
    set(handles.uitable2,'Data',xls_data);
end

% --- Executes on button press in pushbutton2_2.
function pushbutton2_2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3_1.
function pushbutton3_1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear file;
clear path;
clear file_path;
[file,path] = uigetfile('*.xlsx'); %����ļ�
file_suffix0 = file(end-5:end);
file_suffix = file_suffix0(strfind(file_suffix0,'.'):end);  %�ж��ļ�����
clear file_suffix0;
file_path = strcat(path,file)
if(file_suffix == '.xlsx') 
    xls_data=xlsread(file_path);    %��ȡExcel�ļ�
    set(handles.uitable3,'Data',xls_data);
end

% --- Executes on button press in pushbutton3_2.
function pushbutton3_2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4_1.
function pushbutton4_1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear file;
clear path;
clear file_path;
[file,path] = uigetfile('*.xlsx'); %����ļ�
file_suffix0 = file(end-5:end);
file_suffix = file_suffix0(strfind(file_suffix0,'.'):end);  %�ж��ļ�����
clear file_suffix0;
file_path = strcat(path,file)
if(file_suffix == '.xlsx') 
    xls_data=xlsread(file_path);    %��ȡExcel�ļ�
    set(handles.uitable4,'Data',xls_data);
end

% --- Executes on button press in pushbutton4_2.
function pushbutton4_2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in uitable14.
function uitable14_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable14 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uipanel7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3
