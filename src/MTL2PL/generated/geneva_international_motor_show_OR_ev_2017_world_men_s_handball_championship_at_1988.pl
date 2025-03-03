:- include('database.pl').
geneva_international_motor_show(Start,End) :- begin('geneva_international_motor_show',_,_,Start), end('geneva_international_motor_show',_,_,End), Start=<End.

ev_2017_world_men_s_handball_championship(Start,End) :- begin('ev_2017_world_men_s_handball_championship',_,_,Start), end('ev_2017_world_men_s_handball_championship',_,_,End), Start=<End.

generate_facts_geneva_international_motor_show_OR_ev_2017_world_men_s_handball_championship([]) :- assert(geneva_international_motor_show_OR_ev_2017_world_men_s_handball_championship(-1,-1)).

generate_facts_geneva_international_motor_show_OR_ev_2017_world_men_s_handball_championship([(Start,End) | Tail]) :- assert(geneva_international_motor_show_OR_ev_2017_world_men_s_handball_championship(Start,End)), generate_facts_geneva_international_motor_show_OR_ev_2017_world_men_s_handball_championship(Tail).

geneva_international_motor_show_OR_ev_2017_world_men_s_handball_championship_aux() :- findall((Start,End),geneva_international_motor_show(Start,End),Interval1), findall((Start,End),ev_2017_world_men_s_handball_championship(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_geneva_international_motor_show_OR_ev_2017_world_men_s_handball_championship(Interval).

geneva_international_motor_show_OR_ev_2017_world_men_s_handball_championship_at_1988(Res) :- setof((Start,End),geneva_international_motor_show_OR_ev_2017_world_men_s_handball_championship(Start,End),AllINtervals), checkvalidity(1988,AllINtervals,Res).

check_query() :- write('Query = geneva_international_motor_show_OR_ev_2017_world_men_s_handball_championship_at_1988'), (geneva_international_motor_show_OR_ev_2017_world_men_s_handball_championship_at_1988(true) -> write('\nRes   = true');write('\nRes   = false')).
?- geneva_international_motor_show_OR_ev_2017_world_men_s_handball_championship_aux().

