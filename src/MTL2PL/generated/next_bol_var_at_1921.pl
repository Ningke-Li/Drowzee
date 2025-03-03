:- include('database.pl').
bol_var(Start,End) :- begin('bol_var',_,_,Start), end('bol_var',_,_,End), Start=<End.

next_bol_var(Start,End) :- bol_var(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_bol_var_at_1921(Res) :- setof((Start,End),next_bol_var(Start,End),AllINtervals), checkvalidity(1921,AllINtervals,Res).

check_query() :- write('Query = next_bol_var_at_1921'), (next_bol_var_at_1921(true) -> write('\nRes   = true');write('\nRes   = false')).

