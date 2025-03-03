:- include('database.pl').
salvadoran_col_n(Start,End) :- begin('salvadoran_col_n',_,_,Start), end('salvadoran_col_n',_,_,End), Start=<End.

finally_salvadoran_col_n_during_3_19(Start,End) :- salvadoran_col_n(Start1,End1), (Start1-19)=<(End1-3), Start is (Start1-19), End is (End1-3), Start=<End.

finally_salvadoran_col_n_during_3_19_at_1823(Res) :- setof((Start,End),finally_salvadoran_col_n_during_3_19(Start,End),AllINtervals), checkvalidity(1823,AllINtervals,Res).

check_query() :- write('Query = finally_salvadoran_col_n_during_3_19_at_1823'), (finally_salvadoran_col_n_during_3_19_at_1823(true) -> write('\nRes   = true');write('\nRes   = false')).

