:- include('database.pl').
sayfo(Start,End) :- begin('sayfo',_,_,Start), end('sayfo',_,_,End), Start=<End.

next_sayfo(Start,End) :- sayfo(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_sayfo_at_1855(Res) :- setof((Start,End),next_sayfo(Start,End),AllINtervals), checkvalidity(1855,AllINtervals,Res).

check_query() :- write('Query = next_sayfo_at_1855'), (next_sayfo_at_1855(true) -> write('\nRes   = true');write('\nRes   = false')).

