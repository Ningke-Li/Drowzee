:- include('database.pl').
the_holocaust(Start,End) :- begin('the_holocaust',_,_,Start), end('the_holocaust',_,_,End), Start=<End.

next_the_holocaust(Start,End) :- the_holocaust(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_the_holocaust_at_1993(Res) :- setof((Start,End),next_the_holocaust(Start,End),AllINtervals), checkvalidity(1993,AllINtervals,Res).

check_query() :- write('Query = next_the_holocaust_at_1993'), (next_the_holocaust_at_1993(true) -> write('\nRes   = true');write('\nRes   = false')).

