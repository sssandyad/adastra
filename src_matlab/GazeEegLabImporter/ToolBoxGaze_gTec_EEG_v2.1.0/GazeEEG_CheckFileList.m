function GazeEEG_CheckFileList()

% function CheckFileList()
%
% Sends an error message if some files are missing on the Matlab path in
% order to execute the script ExtractDataFromFiles.m

% History:
% --------
% *** 2011-07-01 R. Phlypo @ GIPSA Lab: Created function

FileList = { ...
    'GazeEEG_buildEpoch'; ...
    'GazeEEG_filterFixationsSaccades'; 'GazeEEG_fuseChannelLists'; 'GazeEEG_getChanList'; ...
    'GazeEEG_getDiagBlocks'; 'GazeEEG_init'; 'GazeEEG_jointICA'; 'GazeEEG_LoadMat'; ...
    'GazeEEG_matchTriggers'; 'GazeEEG_prewhitenData'; 'GazeEEG_referencedICA'; ...
    'GazeEEG_manageEvents'; 'analyticroots'; 'GazeEEG_filterNaNTrials'; ...
    'GazeEEG_filterTrials'; 'GazeEEG_filterValidTrials'; 'GazeEEG_getEventInt'; ...
    'GazeEEG_rankEvent' ...    
    };
% ReturnedMissingFile = 0;
for k = 1:length(FileList)
    if ~(exist(FileList{k})==2 || exist(FileList{k})==6)
        error('ChkFiles:MissingFiles',['The file ''' FileList{k} '.m'' cannot be found on your Matlab path.\n'...
            'Some function calls may to not work properly.']);
        % ReturnedMissingFile = 1;
    end
end
% if ~ReturnedMissingFile, 
fprintf(['File dependencies check complete, no missing files found.' ...
        ' You should be able to continue running the script without any hassle.\n']); 
% end