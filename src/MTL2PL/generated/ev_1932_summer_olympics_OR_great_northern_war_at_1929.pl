:- include('database.pl').
ev_1932_summer_olympics(Start,End) :- begin('ev_1932_summer_olympics',_,_,Start), end('ev_1932_summer_olympics',_,_,End), Start=<End.

great_northern_war(Start,End) :- begin('great_northern_war',_,_,Start), end('great_northern_war',_,_,End), Start=<End.

generate_facts_ev_1932_summer_olympics_OR_great_northern_war([]) :- assert(ev_1932_summer_olympics_OR_great_northern_war(-1,-1)).

generate_facts_ev_1932_summer_olympics_OR_great_northern_war([(Start,End) | Tail]) :- assert(ev_1932_summer_olympics_OR_great_northern_war(Start,End)), generate_facts_ev_1932_summer_olympics_OR_great_northern_war(Tail).

ev_1932_summer_olympics_OR_great_northern_war_aux() :- findall((Start,End),ev_1932_summer_olympics(Start,End),Interval1), findall((Start,End),great_northern_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1932_summer_olympics_OR_great_northern_war(Interval).

ev_1932_summer_olympics_OR_great_northern_war_at_1929(Res) :- setof((Start,End),ev_1932_summer_olympics_OR_great_northern_war(Start,End),AllINtervals), checkvalidity(1929,AllINtervals,Res).

check_query() :- write('Query = ev_1932_summer_olympics_OR_great_northern_war_at_1929'), (ev_1932_summer_olympics_OR_great_northern_war_at_1929(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1932_summer_olympics_OR_great_northern_war_aux().

