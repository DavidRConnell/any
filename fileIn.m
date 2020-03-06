function filename = fileIn(dir, numFilesDesired)
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
