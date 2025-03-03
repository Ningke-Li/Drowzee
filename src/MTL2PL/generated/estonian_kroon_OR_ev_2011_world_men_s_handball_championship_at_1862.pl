:- include('database.pl').
estonian_kroon(Start,End) :- begin('estonian_kroon',_,_,Start), end('estonian_kroon',_,_,End), Start=<End.

ev_2011_world_men_s_handball_championship(Start,End) :- begin('ev_2011_world_men_s_handball_championship',_,_,Start), end('ev_2011_world_men_s_handball_championship',_,_,End), Start=<End.

generate_facts_estonian_kroon_OR_ev_2011_world_men_s_handball_championship([]) :- assert(estonian_kroon_OR_ev_2011_world_men_s_handball_championship(-1,-1)).

generate_facts_estonian_kroon_OR_ev_2011_world_men_s_handball_championship([(Start,End) | Tail]) :- assert(estonian_kroon_OR_ev_2011_world_men_s_handball_championship(Start,End)), generate_facts_estonian_kroon_OR_ev_2011_world_men_s_handball_championship(Tail).

estonian_kroon_OR_ev_2011_world_men_s_handball_championship_aux() :- findall((Start,End),estonian_kroon(Start,End),Interval1), findall((Start,End),ev_2011_world_men_s_handball_championship(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_estonian_kroon_OR_ev_2011_world_men_s_handball_championship(Interval).

estonian_kroon_OR_ev_2011_world_men_s_handball_championship_at_1862(Res) :- setof((Start,End),estonian_kroon_OR_ev_2011_world_men_s_handball_championship(Start,End),AllINtervals), checkvalidity(1862,AllINtervals,Res).

check_query() :- write('Query = estonian_kroon_OR_ev_2011_world_men_s_handball_championship_at_1862'), (estonian_kroon_OR_ev_2011_world_men_s_handball_championship_at_1862(true) -> write('\nRes   = true');write('\nRes   = false')).
?- estonian_kroon_OR_ev_2011_world_men_s_handball_championship_aux().

