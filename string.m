function str = string
%STRING generate a random string
%   STR = STRING return a random string of length between 5 and 20. Equivalent
%   to STRINGOFLENGTH([5, 20]). Use instead of STRINGOFLENGTH when length of the
%   string is not important.
%
%   See also STRINGOFLENGTH

    str = any.stringOfLength([5, 20]);
end
