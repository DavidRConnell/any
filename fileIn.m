function filename = fileIn(dir, numFilesDesired)
%FILESIN randomly return any random file in a directory
%   FILENAME = FILEIN(DIRECTORY) return a randomly selected file from DIRECTORY.
%
%   FILELIST = FILEIN(DIRECTORY, N) return a list of N files randomly
%   selected (without replacement) from DIRECTORY.
%
%   FILELIST = FILEIN(DIRECTORY, [MINN, MAXN]) randomly select length of
%   returned FILELIST between MINN and MAXN.
%
%   See also +UTILS/LISTFILES

    if nargin < 2
        numFilesDesired = 1;
    end

    try
        filename = randomlySampleWithoutReplacement(utils.listFiles(dir), ...
                                                    numFilesDesired);
    catch ME
        if strcmp(ME.identifier, 'MATLAB:randperm:inputKTooLarge')
            error('Any:AskedForTooManyFiles', ...
                  'Asked for more files than exist in "dir"', dir)
        else
            rethrow(ME)
        end
    end

    if numFilesDesired == 1
        filename = filename{1};
    end
end
