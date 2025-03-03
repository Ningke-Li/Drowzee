:- include('database.pl').
austrian_civil_war(Start,End) :- begin('austrian_civil_war',_,_,Start), end('austrian_civil_war',_,_,End), Start=<End.

ev_2000_summer_olympics(Start,End) :- begin('ev_2000_summer_olympics',_,_,Start), end('ev_2000_summer_olympics',_,_,End), Start=<End.

generate_facts_austrian_civil_war_OR_ev_2000_summer_olympics([]) :- assert(austrian_civil_war_OR_ev_2000_summer_olympics(-1,-1)).

generate_facts_austrian_civil_war_OR_ev_2000_summer_olympics([(Start,End) | Tail]) :- assert(austrian_civil_war_OR_ev_2000_summer_olympics(Start,End)), generate_facts_austrian_civil_war_OR_ev_2000_summer_olympics(Tail).

austrian_civil_war_OR_ev_2000_summer_olympics_aux() :- findall((Start,End),austrian_civil_war(Start,End),Interval1), findall((Start,End),ev_2000_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_austrian_civil_war_OR_ev_2000_summer_olympics(Interval).

austrian_civil_war_OR_ev_2000_summer_olympics_at_1934(Res) :- setof((Start,End),austrian_civil_war_OR_ev_2000_summer_olympics(Start,End),AllINtervals), checkvalidity(1934,AllINtervals,Res).

check_query() :- write('Query = austrian_civil_war_OR_ev_2000_summer_olympics_at_1934'), (austrian_civil_war_OR_ev_2000_summer_olympics_at_1934(true) -> write('\nRes   = true');write('\nRes   = false')).
?- austrian_civil_war_OR_ev_2000_summer_olympics_aux().

