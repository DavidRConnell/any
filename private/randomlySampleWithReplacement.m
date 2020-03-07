function samples = randomlySampleWithReplacement(optionSet, range)
%RANDOMLYSAMPLEWITHREPLACEMENT randomly pick values with replacement
%   SAMPLES = RANDOMLYSAMPLEWITHREPLACEMENT(SET, N) take N random samples from
%   SET with replacement.
%
%   SAMPLES = RANDOMLYSAMPLEWITHREPLACEMENT(SET, [MINN, MAXN]) return a random
%   number of samples between MINN and MAXN.
%
%   See also RANDOMLYSAMPLEWITHOUTREPLACEMENT.

    if length(range) == 1 && range > 0
        outLength = range;
    elseif length(range) == 2 && all(range > 0)
        outLength = randi(range);
    else
        error('Any:IncorrectRangeFormat', ...
              ['Second argument to "RANDOMLYSAMPLEWITHREPLACEMENT" must be', ...
               'either a length or a range of possible lengths']);
    end

    selectionIndeces = randi(length(optionSet), [1, outLength]);
    samples = optionSet(selectionIndeces);
end
