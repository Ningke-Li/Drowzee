:- include('database.pl').
weeds(Start,End) :- begin('weeds',_,_,Start), end('weeds',_,_,End), Start=<End.

ugly_betty(Start,End) :- begin('ugly_betty',_,_,Start), end('ugly_betty',_,_,End), Start=<End.

generate_facts_weeds_AND_ugly_betty([]) :- assert(weeds_AND_ugly_betty(-1,-1)).

generate_facts_weeds_AND_ugly_betty([(Start,End) | Tail]) :- assert(weeds_AND_ugly_betty(Start,End)), generate_facts_weeds_AND_ugly_betty(Tail).

weeds_AND_ugly_betty_aux() :- findall((Start,End),weeds(Start,End),Interval1), findall((Start,End),ugly_betty(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_weeds_AND_ugly_betty(Interval).

weeds_AND_ugly_betty_at_1878(Res) :- setof((Start,End),weeds_AND_ugly_betty(Start,End),AllINtervals), checkvalidity(1878,AllINtervals,Res).

check_query() :- write('Query = weeds_AND_ugly_betty_at_1878'), (weeds_AND_ugly_betty_at_1878(true) -> write('\nRes   = true');write('\nRes   = false')).
?- weeds_AND_ugly_betty_aux().

