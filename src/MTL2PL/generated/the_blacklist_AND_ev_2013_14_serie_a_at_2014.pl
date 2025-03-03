:- include('database.pl').
the_blacklist(Start,End) :- begin('the_blacklist',_,_,Start), end('the_blacklist',_,_,End), Start=<End.

ev_2013_14_serie_a(Start,End) :- begin('ev_2013_14_serie_a',_,_,Start), end('ev_2013_14_serie_a',_,_,End), Start=<End.

generate_facts_the_blacklist_AND_ev_2013_14_serie_a([]) :- assert(the_blacklist_AND_ev_2013_14_serie_a(-1,-1)).

generate_facts_the_blacklist_AND_ev_2013_14_serie_a([(Start,End) | Tail]) :- assert(the_blacklist_AND_ev_2013_14_serie_a(Start,End)), generate_facts_the_blacklist_AND_ev_2013_14_serie_a(Tail).

the_blacklist_AND_ev_2013_14_serie_a_aux() :- findall((Start,End),the_blacklist(Start,End),Interval1), findall((Start,End),ev_2013_14_serie_a(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_blacklist_AND_ev_2013_14_serie_a(Interval).

the_blacklist_AND_ev_2013_14_serie_a_at_2014(Res) :- setof((Start,End),the_blacklist_AND_ev_2013_14_serie_a(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = the_blacklist_AND_ev_2013_14_serie_a_at_2014'), (the_blacklist_AND_ev_2013_14_serie_a_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_blacklist_AND_ev_2013_14_serie_a_aux().

