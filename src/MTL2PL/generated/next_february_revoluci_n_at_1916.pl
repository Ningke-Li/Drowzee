:- include('database.pl').
february_revoluci_n(Start,End) :- begin('february_revoluci_n',_,_,Start), end('february_revoluci_n',_,_,End), Start=<End.

next_february_revoluci_n(Start,End) :- february_revoluci_n(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_february_revoluci_n_at_1916(Res) :- setof((Start,End),next_february_revoluci_n(Start,End),AllINtervals), checkvalidity(1916,AllINtervals,Res).

check_query() :- write('Query = next_february_revoluci_n_at_1916'), (next_february_revoluci_n_at_1916(true) -> write('\nRes   = true');write('\nRes   = false')).

