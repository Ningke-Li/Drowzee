:- include('database.pl').
the_lion_guard(Start,End) :- begin('the_lion_guard',_,_,Start), end('the_lion_guard',_,_,End), Start=<End.

finally_the_lion_guard_during_4_17(Start,End) :- the_lion_guard(Start1,End1), (Start1-17)=<(End1-4), Start is (Start1-17), End is (End1-4), Start=<End.

finally_the_lion_guard_during_4_17_at_1857(Res) :- setof((Start,End),finally_the_lion_guard_during_4_17(Start,End),AllINtervals), checkvalidity(1857,AllINtervals,Res).

check_query() :- write('Query = finally_the_lion_guard_during_4_17_at_1857'), (finally_the_lion_guard_during_4_17_at_1857(true) -> write('\nRes   = true');write('\nRes   = false')).

