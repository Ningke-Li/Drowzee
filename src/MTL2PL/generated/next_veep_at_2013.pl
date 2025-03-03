:- include('database.pl').
veep(Start,End) :- begin('veep',_,_,Start), end('veep',_,_,End), Start=<End.

next_veep(Start,End) :- veep(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_veep_at_2013(Res) :- setof((Start,End),next_veep(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = next_veep_at_2013'), (next_veep_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).

