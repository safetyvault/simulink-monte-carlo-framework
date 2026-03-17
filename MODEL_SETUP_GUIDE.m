% MODEL_SETUP_GUIDE.m — SafetyVault One-Time Setup Guide
% -------------------------------------------------------
% Run this script ONCE if your model has parameters defined
% in PreLoadFcn or Base Workspace.
%
% OPTION 1 — Model Workspace (recommended for parsim):
%   mws = get_param('YourModel', 'ModelWorkspace');
%   mws.assignin('PARAM_NAME', nominal_value);
%   set_param('YourModel', 'PreLoadFcn', '');
%   save_system('YourModel');
%
% OPTION 2 — Data Dictionary (also works with parsim):
%   dd = Simulink.data.dictionary.create('model_data.sldd');
%   sec = getSection(dd, 'Design Data');
%   addEntry(sec, 'PARAM_NAME', nominal_value);
%   saveChanges(dd);
%   set_param('YourModel', 'DataDictionary', 'model_data.sldd');
%   set_param('YourModel', 'PreLoadFcn', '');
%   save_system('YourModel');
%
% OPTION 3 — If parsim not needed, use sequential:
%   In runMCFramework.m: set useParsim = false;
%   setVariable works correctly with sequential sim().