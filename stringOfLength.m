function str = stringOfLength(range)
%STRINGOFLENGTH generate a random string
%   STR = STRINGOFLENGTH(N) return a random string of length N.
%   STR = STRINGOFLENGTH([MINN, MAXN]) randomly pick the length of N between
%   MINN and MAXN.
%
%   See also STRING, DIGITSTRINGOFLENGTH

    charSet = ['0':'9' 'a':'z' 'A':'Z' '~_\|/,.()[]{}<>!@#$%^&*?+='];
    str = generateString(charSet, range);
end
