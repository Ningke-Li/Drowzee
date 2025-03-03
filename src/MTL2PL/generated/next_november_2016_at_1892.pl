:- include('database.pl').
november_2016(Start,End) :- begin('november_2016',_,_,Start), end('november_2016',_,_,End), Start=<End.

next_november_2016(Start,End) :- november_2016(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_november_2016_at_1892(Res) :- setof((Start,End),next_november_2016(Start,End),AllINtervals), checkvalidity(1892,AllINtervals,Res).

check_query() :- write('Query = next_november_2016_at_1892'), (next_november_2016_at_1892(true) -> write('\nRes   = true');write('\nRes   = false')).

