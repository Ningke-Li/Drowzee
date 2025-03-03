:- include('database.pl').
the_mentalist(Start,End) :- begin('the_mentalist',_,_,Start), end('the_mentalist',_,_,End), Start=<End.

next_the_mentalist(Start,End) :- the_mentalist(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_the_mentalist_at_2051(Res) :- setof((Start,End),next_the_mentalist(Start,End),AllINtervals), checkvalidity(2051,AllINtervals,Res).

check_query() :- write('Query = next_the_mentalist_at_2051'), (next_the_mentalist_at_2051(true) -> write('\nRes   = true');write('\nRes   = false')).

