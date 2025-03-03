:- include('database.pl').
the_good_wife(Start,End) :- begin('the_good_wife',_,_,Start), end('the_good_wife',_,_,End), Start=<End.

next_the_good_wife(Start,End) :- the_good_wife(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_the_good_wife_at_1960(Res) :- setof((Start,End),next_the_good_wife(Start,End),AllINtervals), checkvalidity(1960,AllINtervals,Res).

check_query() :- write('Query = next_the_good_wife_at_1960'), (next_the_good_wife_at_1960(true) -> write('\nRes   = true');write('\nRes   = false')).

