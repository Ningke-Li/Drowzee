:- include('database.pl').
vistula_oder_offensive(Start,End) :- begin('vistula_oder_offensive',_,_,Start), end('vistula_oder_offensive',_,_,End), Start=<End.

next_vistula_oder_offensive(Start,End) :- vistula_oder_offensive(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_vistula_oder_offensive_at_1980(Res) :- setof((Start,End),next_vistula_oder_offensive(Start,End),AllINtervals), checkvalidity(1980,AllINtervals,Res).

check_query() :- write('Query = next_vistula_oder_offensive_at_1980'), (next_vistula_oder_offensive_at_1980(true) -> write('\nRes   = true');write('\nRes   = false')).

