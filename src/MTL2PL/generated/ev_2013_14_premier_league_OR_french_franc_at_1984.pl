:- include('database.pl').
ev_2013_14_premier_league(Start,End) :- begin('ev_2013_14_premier_league',_,_,Start), end('ev_2013_14_premier_league',_,_,End), Start=<End.

french_franc(Start,End) :- begin('french_franc',_,_,Start), end('french_franc',_,_,End), Start=<End.

generate_facts_ev_2013_14_premier_league_OR_french_franc([]) :- assert(ev_2013_14_premier_league_OR_french_franc(-1,-1)).

generate_facts_ev_2013_14_premier_league_OR_french_franc([(Start,End) | Tail]) :- assert(ev_2013_14_premier_league_OR_french_franc(Start,End)), generate_facts_ev_2013_14_premier_league_OR_french_franc(Tail).

ev_2013_14_premier_league_OR_french_franc_aux() :- findall((Start,End),ev_2013_14_premier_league(Start,End),Interval1), findall((Start,End),french_franc(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2013_14_premier_league_OR_french_franc(Interval).

ev_2013_14_premier_league_OR_french_franc_at_1984(Res) :- setof((Start,End),ev_2013_14_premier_league_OR_french_franc(Start,End),AllINtervals), checkvalidity(1984,AllINtervals,Res).

check_query() :- write('Query = ev_2013_14_premier_league_OR_french_franc_at_1984'), (ev_2013_14_premier_league_OR_french_franc_at_1984(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_14_premier_league_OR_french_franc_aux().

