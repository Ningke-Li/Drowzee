:- include('database.pl').
iraqi_civil_war_of_2014_2017(Start,End) :- begin('iraqi_civil_war_of_2014_2017',_,_,Start), end('iraqi_civil_war_of_2014_2017',_,_,End), Start=<End.

ev_2012_13_premier_league(Start,End) :- begin('ev_2012_13_premier_league',_,_,Start), end('ev_2012_13_premier_league',_,_,End), Start=<End.

generate_facts_iraqi_civil_war_of_2014_2017_OR_ev_2012_13_premier_league([]) :- assert(iraqi_civil_war_of_2014_2017_OR_ev_2012_13_premier_league(-1,-1)).

generate_facts_iraqi_civil_war_of_2014_2017_OR_ev_2012_13_premier_league([(Start,End) | Tail]) :- assert(iraqi_civil_war_of_2014_2017_OR_ev_2012_13_premier_league(Start,End)), generate_facts_iraqi_civil_war_of_2014_2017_OR_ev_2012_13_premier_league(Tail).

iraqi_civil_war_of_2014_2017_OR_ev_2012_13_premier_league_aux() :- findall((Start,End),iraqi_civil_war_of_2014_2017(Start,End),Interval1), findall((Start,End),ev_2012_13_premier_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_iraqi_civil_war_of_2014_2017_OR_ev_2012_13_premier_league(Interval).

iraqi_civil_war_of_2014_2017_OR_ev_2012_13_premier_league_at_1969(Res) :- setof((Start,End),iraqi_civil_war_of_2014_2017_OR_ev_2012_13_premier_league(Start,End),AllINtervals), checkvalidity(1969,AllINtervals,Res).

check_query() :- write('Query = iraqi_civil_war_of_2014_2017_OR_ev_2012_13_premier_league_at_1969'), (iraqi_civil_war_of_2014_2017_OR_ev_2012_13_premier_league_at_1969(true) -> write('\nRes   = true');write('\nRes   = false')).
?- iraqi_civil_war_of_2014_2017_OR_ev_2012_13_premier_league_aux().

