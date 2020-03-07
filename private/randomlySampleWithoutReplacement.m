function samples = randomlySampleWithoutReplacement(optionSet, range)
%RANDOMLYSAMPLEWITHOUTREPLACEMENT randomly pick values without replacement
%   SAMPLES = RANDOMLYSAMPLEWITHOUTREPLACEMENT(SET, N) take N random samples from
%   SET without replacement.
%
%   SAMPLES = RANDOMLYSAMPLEWITHOUTREPLACEMENT(SET, [MINN, MAXN]) return a random
%   number of samples between MINN and MAXN.
%
%   See also RANDOMLYSAMPLEWITHREPLACEMENT.

    if length(range) == 1 && range > 0
        outLength = range;
    elseif length(range) == 2 && all(range > 0)
        outLength = randi(range);
    else
        error('Any:IncorrectRangeFormat', ...
              ['Second argument to "RANDOMLYSAMPLEWITHOUTREPLACEMENT" must be', ...
               'either a length or a range of possible lengths']);
    end

    selectionIndeces = randperm(length(optionSet), outLength);
    samples = optionSet(selectionIndeces);
end
