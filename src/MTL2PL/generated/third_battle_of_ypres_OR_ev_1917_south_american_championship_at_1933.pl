:- include('database.pl').
third_battle_of_ypres(Start,End) :- begin('third_battle_of_ypres',_,_,Start), end('third_battle_of_ypres',_,_,End), Start=<End.

ev_1917_south_american_championship(Start,End) :- begin('ev_1917_south_american_championship',_,_,Start), end('ev_1917_south_american_championship',_,_,End), Start=<End.

generate_facts_third_battle_of_ypres_OR_ev_1917_south_american_championship([]) :- assert(third_battle_of_ypres_OR_ev_1917_south_american_championship(-1,-1)).

generate_facts_third_battle_of_ypres_OR_ev_1917_south_american_championship([(Start,End) | Tail]) :- assert(third_battle_of_ypres_OR_ev_1917_south_american_championship(Start,End)), generate_facts_third_battle_of_ypres_OR_ev_1917_south_american_championship(Tail).

third_battle_of_ypres_OR_ev_1917_south_american_championship_aux() :- findall((Start,End),third_battle_of_ypres(Start,End),Interval1), findall((Start,End),ev_1917_south_american_championship(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_third_battle_of_ypres_OR_ev_1917_south_american_championship(Interval).

third_battle_of_ypres_OR_ev_1917_south_american_championship_at_1933(Res) :- setof((Start,End),third_battle_of_ypres_OR_ev_1917_south_american_championship(Start,End),AllINtervals), checkvalidity(1933,AllINtervals,Res).

check_query() :- write('Query = third_battle_of_ypres_OR_ev_1917_south_american_championship_at_1933'), (third_battle_of_ypres_OR_ev_1917_south_american_championship_at_1933(true) -> write('\nRes   = true');write('\nRes   = false')).
?- third_battle_of_ypres_OR_ev_1917_south_american_championship_aux().

