:- include('database.pl').
the_100(Start,End) :- begin('the_100',_,_,Start), end('the_100',_,_,End), Start=<End.

next_the_100(Start,End) :- the_100(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_the_100_at_2016(Res) :- setof((Start,End),next_the_100(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = next_the_100_at_2016'), (next_the_100_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).

