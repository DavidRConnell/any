function filename = fileIn(dir, numFilesDesired)
%FILESIN randomly return any random file in a directory
%   FILENAME = FILEIN(DIRECTORY) return a randomly selected file from DIRECTORY.
%   FILELIST = FILEIN(DIRECTORY, N) return a list of N files randomly
%   selected (without replacement) from DIRECTORY.
%
%   See also +UTILS/LISTFILES

    if nargin < 2
        numFilesDesired = 1;
    end

    allFilesInDir = utils.listFiles(dir);
    numFilesInDir = length(allFilesInDir);
    validateattributes(numFilesDesired, {'numeric'}, {'positive', 'integer'})
    assert(numFilesDesired <= numFilesInDir, ...
           'Any:AskedForTooManyFiles', ...
           'Asked for more files than exist in "%s" (%d total)', dir, numFilesInDir)

    fileIdx = randi(numFilesInDir, [numFilesDesired, 1]);
    filename = allFilesInDir(fileIdx);

    if numFilesDesired == 1
        filename = filename{1};
    end
end
