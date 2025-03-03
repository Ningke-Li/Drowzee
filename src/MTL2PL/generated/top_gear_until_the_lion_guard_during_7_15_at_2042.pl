:- include('database.pl').
top_gear(Start,End) :- begin('top_gear',_,_,Start), end('top_gear',_,_,End), Start=<End.

the_lion_guard(Start,End) :- begin('the_lion_guard',_,_,Start), end('the_lion_guard',_,_,End), Start=<End.

top_gear_last_till_7_15(Start,End) :- top_gear(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

top_gear_until_the_lion_guard_during_7_15_overlap(Start,End) :- top_gear_last_till_7_15(Start1,End1), the_lion_guard(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

top_gear_until_the_lion_guard_during_7_15(Start,End) :- top_gear(W1,_), top_gear_until_the_lion_guard_during_7_15_overlap(Start1,End1), Start is max((Start1-15),W1), End is (End1-7), Start=<End.

top_gear_until_the_lion_guard_during_7_15_at_2042(Res) :- setof((Start,End),top_gear_until_the_lion_guard_during_7_15(Start,End),AllINtervals), checkvalidity(2042,AllINtervals,Res).

check_query() :- write('Query = top_gear_until_the_lion_guard_during_7_15_at_2042'), (top_gear_until_the_lion_guard_during_7_15_at_2042(true) -> write('\nRes   = true');write('\nRes   = false')).

