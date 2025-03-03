:- include('database.pl').
ugly_betty(Start,End) :- begin('ugly_betty',_,_,Start), end('ugly_betty',_,_,End), Start=<End.

percy_jackson___the_olympians(Start,End) :- begin('percy_jackson___the_olympians',_,_,Start), end('percy_jackson___the_olympians',_,_,End), Start=<End.

generate_facts_ugly_betty_AND_percy_jackson___the_olympians([]) :- assert(ugly_betty_AND_percy_jackson___the_olympians(-1,-1)).

generate_facts_ugly_betty_AND_percy_jackson___the_olympians([(Start,End) | Tail]) :- assert(ugly_betty_AND_percy_jackson___the_olympians(Start,End)), generate_facts_ugly_betty_AND_percy_jackson___the_olympians(Tail).

ugly_betty_AND_percy_jackson___the_olympians_aux() :- findall((Start,End),ugly_betty(Start,End),Interval1), findall((Start,End),percy_jackson___the_olympians(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ugly_betty_AND_percy_jackson___the_olympians(Interval).

ugly_betty_AND_percy_jackson___the_olympians_at_1990(Res) :- setof((Start,End),ugly_betty_AND_percy_jackson___the_olympians(Start,End),AllINtervals), checkvalidity(1990,AllINtervals,Res).

check_query() :- write('Query = ugly_betty_AND_percy_jackson___the_olympians_at_1990'), (ugly_betty_AND_percy_jackson___the_olympians_at_1990(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ugly_betty_AND_percy_jackson___the_olympians_aux().

