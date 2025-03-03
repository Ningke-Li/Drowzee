:- include('database.pl').
ev_2014_15_premier_league(Start,End) :- begin('ev_2014_15_premier_league',_,_,Start), end('ev_2014_15_premier_league',_,_,End), Start=<End.

ev_2004_afc_asian_cup(Start,End) :- begin('ev_2004_afc_asian_cup',_,_,Start), end('ev_2004_afc_asian_cup',_,_,End), Start=<End.

generate_facts_ev_2014_15_premier_league_OR_ev_2004_afc_asian_cup([]) :- assert(ev_2014_15_premier_league_OR_ev_2004_afc_asian_cup(-1,-1)).

generate_facts_ev_2014_15_premier_league_OR_ev_2004_afc_asian_cup([(Start,End) | Tail]) :- assert(ev_2014_15_premier_league_OR_ev_2004_afc_asian_cup(Start,End)), generate_facts_ev_2014_15_premier_league_OR_ev_2004_afc_asian_cup(Tail).

ev_2014_15_premier_league_OR_ev_2004_afc_asian_cup_aux() :- findall((Start,End),ev_2014_15_premier_league(Start,End),Interval1), findall((Start,End),ev_2004_afc_asian_cup(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2014_15_premier_league_OR_ev_2004_afc_asian_cup(Interval).

ev_2014_15_premier_league_OR_ev_2004_afc_asian_cup_at_1963(Res) :- setof((Start,End),ev_2014_15_premier_league_OR_ev_2004_afc_asian_cup(Start,End),AllINtervals), checkvalidity(1963,AllINtervals,Res).

check_query() :- write('Query = ev_2014_15_premier_league_OR_ev_2004_afc_asian_cup_at_1963'), (ev_2014_15_premier_league_OR_ev_2004_afc_asian_cup_at_1963(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_15_premier_league_OR_ev_2004_afc_asian_cup_aux().

