:- include('database.pl').
the_lion_guard(Start,End) :- begin('the_lion_guard',_,_,Start), end('the_lion_guard',_,_,End), Start=<End.

globally_the_lion_guard_during_2_4(Start,End) :- the_lion_guard(Start1,End1), Start is (Start1-2), End is (End1-4), Start=<End.

next_globally_the_lion_guard_during_2_4(Start,End) :- globally_the_lion_guard_during_2_4(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_the_lion_guard_during_2_4_at_1939(Res) :- setof((Start,End),next_globally_the_lion_guard_during_2_4(Start,End),AllINtervals), checkvalidity(1939,AllINtervals,Res).

check_query() :- write('Query = next_globally_the_lion_guard_during_2_4_at_1939'), (next_globally_the_lion_guard_during_2_4_at_1939(true) -> write('\nRes   = true');write('\nRes   = false')).

