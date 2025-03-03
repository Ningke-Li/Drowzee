:- include('database.pl').
ev_2012_13_premier_league(Start,End) :- begin('ev_2012_13_premier_league',_,_,Start), end('ev_2012_13_premier_league',_,_,End), Start=<End.

austin___ally(Start,End) :- begin('austin___ally',_,_,Start), end('austin___ally',_,_,End), Start=<End.

generate_facts_ev_2012_13_premier_league_AND_austin___ally([]) :- assert(ev_2012_13_premier_league_AND_austin___ally(-1,-1)).

generate_facts_ev_2012_13_premier_league_AND_austin___ally([(Start,End) | Tail]) :- assert(ev_2012_13_premier_league_AND_austin___ally(Start,End)), generate_facts_ev_2012_13_premier_league_AND_austin___ally(Tail).

ev_2012_13_premier_league_AND_austin___ally_aux() :- findall((Start,End),ev_2012_13_premier_league(Start,End),Interval1), findall((Start,End),austin___ally(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2012_13_premier_league_AND_austin___ally(Interval).

ev_2012_13_premier_league_AND_austin___ally_at_1962(Res) :- setof((Start,End),ev_2012_13_premier_league_AND_austin___ally(Start,End),AllINtervals), checkvalidity(1962,AllINtervals,Res).

check_query() :- write('Query = ev_2012_13_premier_league_AND_austin___ally_at_1962'), (ev_2012_13_premier_league_AND_austin___ally_at_1962(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2012_13_premier_league_AND_austin___ally_aux().

