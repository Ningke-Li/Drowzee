:- include('database.pl').
ev_2013_14_premier_league(Start,End) :- begin('ev_2013_14_premier_league',_,_,Start), end('ev_2013_14_premier_league',_,_,End), Start=<End.

under_the_dome(Start,End) :- begin('under_the_dome',_,_,Start), end('under_the_dome',_,_,End), Start=<End.

generate_facts_ev_2013_14_premier_league_AND_under_the_dome([]) :- assert(ev_2013_14_premier_league_AND_under_the_dome(-1,-1)).

generate_facts_ev_2013_14_premier_league_AND_under_the_dome([(Start,End) | Tail]) :- assert(ev_2013_14_premier_league_AND_under_the_dome(Start,End)), generate_facts_ev_2013_14_premier_league_AND_under_the_dome(Tail).

ev_2013_14_premier_league_AND_under_the_dome_aux() :- findall((Start,End),ev_2013_14_premier_league(Start,End),Interval1), findall((Start,End),under_the_dome(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2013_14_premier_league_AND_under_the_dome(Interval).

ev_2013_14_premier_league_AND_under_the_dome_at_1865(Res) :- setof((Start,End),ev_2013_14_premier_league_AND_under_the_dome(Start,End),AllINtervals), checkvalidity(1865,AllINtervals,Res).

check_query() :- write('Query = ev_2013_14_premier_league_AND_under_the_dome_at_1865'), (ev_2013_14_premier_league_AND_under_the_dome_at_1865(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_14_premier_league_AND_under_the_dome_aux().

