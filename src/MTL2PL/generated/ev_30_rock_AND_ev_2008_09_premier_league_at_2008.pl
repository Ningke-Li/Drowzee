:- include('database.pl').
ev_30_rock(Start,End) :- begin('ev_30_rock',_,_,Start), end('ev_30_rock',_,_,End), Start=<End.

ev_2008_09_premier_league(Start,End) :- begin('ev_2008_09_premier_league',_,_,Start), end('ev_2008_09_premier_league',_,_,End), Start=<End.

generate_facts_ev_30_rock_AND_ev_2008_09_premier_league([]) :- assert(ev_30_rock_AND_ev_2008_09_premier_league(-1,-1)).

generate_facts_ev_30_rock_AND_ev_2008_09_premier_league([(Start,End) | Tail]) :- assert(ev_30_rock_AND_ev_2008_09_premier_league(Start,End)), generate_facts_ev_30_rock_AND_ev_2008_09_premier_league(Tail).

ev_30_rock_AND_ev_2008_09_premier_league_aux() :- findall((Start,End),ev_30_rock(Start,End),Interval1), findall((Start,End),ev_2008_09_premier_league(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_30_rock_AND_ev_2008_09_premier_league(Interval).

ev_30_rock_AND_ev_2008_09_premier_league_at_2008(Res) :- setof((Start,End),ev_30_rock_AND_ev_2008_09_premier_league(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = ev_30_rock_AND_ev_2008_09_premier_league_at_2008'), (ev_30_rock_AND_ev_2008_09_premier_league_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_30_rock_AND_ev_2008_09_premier_league_aux().

