:- include('database.pl').
bosnian_crisis(Start,End) :- begin('bosnian_crisis',_,_,Start), end('bosnian_crisis',_,_,End), Start=<End.

luxembourg_franc(Start,End) :- begin('luxembourg_franc',_,_,Start), end('luxembourg_franc',_,_,End), Start=<End.

generate_facts_bosnian_crisis_AND_luxembourg_franc([]) :- assert(bosnian_crisis_AND_luxembourg_franc(-1,-1)).

generate_facts_bosnian_crisis_AND_luxembourg_franc([(Start,End) | Tail]) :- assert(bosnian_crisis_AND_luxembourg_franc(Start,End)), generate_facts_bosnian_crisis_AND_luxembourg_franc(Tail).

bosnian_crisis_AND_luxembourg_franc_aux() :- findall((Start,End),bosnian_crisis(Start,End),Interval1), findall((Start,End),luxembourg_franc(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_bosnian_crisis_AND_luxembourg_franc(Interval).

bosnian_crisis_AND_luxembourg_franc_at_1909(Res) :- setof((Start,End),bosnian_crisis_AND_luxembourg_franc(Start,End),AllINtervals), checkvalidity(1909,AllINtervals,Res).

check_query() :- write('Query = bosnian_crisis_AND_luxembourg_franc_at_1909'), (bosnian_crisis_AND_luxembourg_franc_at_1909(true) -> write('\nRes   = true');write('\nRes   = false')).
?- bosnian_crisis_AND_luxembourg_franc_aux().

