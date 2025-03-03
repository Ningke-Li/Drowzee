:- include('database.pl').
may_2016(Start,End) :- begin('may_2016',_,_,Start), end('may_2016',_,_,End), Start=<End.

next_may_2016(Start,End) :- may_2016(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_may_2016_at_2015(Res) :- setof((Start,End),next_may_2016(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = next_may_2016_at_2015'), (next_may_2016_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).

