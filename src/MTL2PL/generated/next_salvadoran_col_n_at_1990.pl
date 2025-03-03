:- include('database.pl').
salvadoran_col_n(Start,End) :- begin('salvadoran_col_n',_,_,Start), end('salvadoran_col_n',_,_,End), Start=<End.

next_salvadoran_col_n(Start,End) :- salvadoran_col_n(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_salvadoran_col_n_at_1990(Res) :- setof((Start,End),next_salvadoran_col_n(Start,End),AllINtervals), checkvalidity(1990,AllINtervals,Res).

check_query() :- write('Query = next_salvadoran_col_n_at_1990'), (next_salvadoran_col_n_at_1990(true) -> write('\nRes   = true');write('\nRes   = false')).

