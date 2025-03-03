:- include('database.pl').
the_pacific(Start,End) :- begin('the_pacific',_,_,Start), end('the_pacific',_,_,End), Start=<End.

next_the_pacific(Start,End) :- the_pacific(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_the_pacific_at_2009(Res) :- setof((Start,End),next_the_pacific(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = next_the_pacific_at_2009'), (next_the_pacific_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

