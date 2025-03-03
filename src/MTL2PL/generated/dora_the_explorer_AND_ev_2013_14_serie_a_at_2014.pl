:- include('database.pl').
dora_the_explorer(Start,End) :- begin('dora_the_explorer',_,_,Start), end('dora_the_explorer',_,_,End), Start=<End.

ev_2013_14_serie_a(Start,End) :- begin('ev_2013_14_serie_a',_,_,Start), end('ev_2013_14_serie_a',_,_,End), Start=<End.

generate_facts_dora_the_explorer_AND_ev_2013_14_serie_a([]) :- assert(dora_the_explorer_AND_ev_2013_14_serie_a(-1,-1)).

generate_facts_dora_the_explorer_AND_ev_2013_14_serie_a([(Start,End) | Tail]) :- assert(dora_the_explorer_AND_ev_2013_14_serie_a(Start,End)), generate_facts_dora_the_explorer_AND_ev_2013_14_serie_a(Tail).

dora_the_explorer_AND_ev_2013_14_serie_a_aux() :- findall((Start,End),dora_the_explorer(Start,End),Interval1), findall((Start,End),ev_2013_14_serie_a(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_dora_the_explorer_AND_ev_2013_14_serie_a(Interval).

dora_the_explorer_AND_ev_2013_14_serie_a_at_2014(Res) :- setof((Start,End),dora_the_explorer_AND_ev_2013_14_serie_a(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = dora_the_explorer_AND_ev_2013_14_serie_a_at_2014'), (dora_the_explorer_AND_ev_2013_14_serie_a_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- dora_the_explorer_AND_ev_2013_14_serie_a_aux().

