:- include('database.pl').
the_lion_guard(Start,End) :- begin('the_lion_guard',_,_,Start), end('the_lion_guard',_,_,End), Start=<End.

next_the_lion_guard(Start,End) :- the_lion_guard(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_the_lion_guard_at_2018(Res) :- setof((Start,End),next_the_lion_guard(Start,End),AllINtervals), checkvalidity(2018,AllINtervals,Res).

check_query() :- write('Query = next_the_lion_guard_at_2018'), (next_the_lion_guard_at_2018(true) -> write('\nRes   = true');write('\nRes   = false')).

