:- include('database.pl').
ugly_betty(Start,End) :- begin('ugly_betty',_,_,Start), end('ugly_betty',_,_,End), Start=<End.

jericho(Start,End) :- begin('jericho',_,_,Start), end('jericho',_,_,End), Start=<End.

generate_facts_ugly_betty_AND_jericho([]) :- assert(ugly_betty_AND_jericho(-1,-1)).

generate_facts_ugly_betty_AND_jericho([(Start,End) | Tail]) :- assert(ugly_betty_AND_jericho(Start,End)), generate_facts_ugly_betty_AND_jericho(Tail).

ugly_betty_AND_jericho_aux() :- findall((Start,End),ugly_betty(Start,End),Interval1), findall((Start,End),jericho(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ugly_betty_AND_jericho(Interval).

ugly_betty_AND_jericho_at_1886(Res) :- setof((Start,End),ugly_betty_AND_jericho(Start,End),AllINtervals), checkvalidity(1886,AllINtervals,Res).

check_query() :- write('Query = ugly_betty_AND_jericho_at_1886'), (ugly_betty_AND_jericho_at_1886(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ugly_betty_AND_jericho_aux().

