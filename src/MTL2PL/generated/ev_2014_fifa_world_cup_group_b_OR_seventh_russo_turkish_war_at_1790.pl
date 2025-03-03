:- include('database.pl').
ev_2014_fifa_world_cup_group_b(Start,End) :- begin('ev_2014_fifa_world_cup_group_b',_,_,Start), end('ev_2014_fifa_world_cup_group_b',_,_,End), Start=<End.

seventh_russo_turkish_war(Start,End) :- begin('seventh_russo_turkish_war',_,_,Start), end('seventh_russo_turkish_war',_,_,End), Start=<End.

generate_facts_ev_2014_fifa_world_cup_group_b_OR_seventh_russo_turkish_war([]) :- assert(ev_2014_fifa_world_cup_group_b_OR_seventh_russo_turkish_war(-1,-1)).

generate_facts_ev_2014_fifa_world_cup_group_b_OR_seventh_russo_turkish_war([(Start,End) | Tail]) :- assert(ev_2014_fifa_world_cup_group_b_OR_seventh_russo_turkish_war(Start,End)), generate_facts_ev_2014_fifa_world_cup_group_b_OR_seventh_russo_turkish_war(Tail).

ev_2014_fifa_world_cup_group_b_OR_seventh_russo_turkish_war_aux() :- findall((Start,End),ev_2014_fifa_world_cup_group_b(Start,End),Interval1), findall((Start,End),seventh_russo_turkish_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2014_fifa_world_cup_group_b_OR_seventh_russo_turkish_war(Interval).

ev_2014_fifa_world_cup_group_b_OR_seventh_russo_turkish_war_at_1790(Res) :- setof((Start,End),ev_2014_fifa_world_cup_group_b_OR_seventh_russo_turkish_war(Start,End),AllINtervals), checkvalidity(1790,AllINtervals,Res).

check_query() :- write('Query = ev_2014_fifa_world_cup_group_b_OR_seventh_russo_turkish_war_at_1790'), (ev_2014_fifa_world_cup_group_b_OR_seventh_russo_turkish_war_at_1790(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_fifa_world_cup_group_b_OR_seventh_russo_turkish_war_aux().

