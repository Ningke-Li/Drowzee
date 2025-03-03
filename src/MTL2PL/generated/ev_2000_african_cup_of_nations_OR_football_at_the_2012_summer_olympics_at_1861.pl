:- include('database.pl').
ev_2000_african_cup_of_nations(Start,End) :- begin('ev_2000_african_cup_of_nations',_,_,Start), end('ev_2000_african_cup_of_nations',_,_,End), Start=<End.

football_at_the_2012_summer_olympics(Start,End) :- begin('football_at_the_2012_summer_olympics',_,_,Start), end('football_at_the_2012_summer_olympics',_,_,End), Start=<End.

generate_facts_ev_2000_african_cup_of_nations_OR_football_at_the_2012_summer_olympics([]) :- assert(ev_2000_african_cup_of_nations_OR_football_at_the_2012_summer_olympics(-1,-1)).

generate_facts_ev_2000_african_cup_of_nations_OR_football_at_the_2012_summer_olympics([(Start,End) | Tail]) :- assert(ev_2000_african_cup_of_nations_OR_football_at_the_2012_summer_olympics(Start,End)), generate_facts_ev_2000_african_cup_of_nations_OR_football_at_the_2012_summer_olympics(Tail).

ev_2000_african_cup_of_nations_OR_football_at_the_2012_summer_olympics_aux() :- findall((Start,End),ev_2000_african_cup_of_nations(Start,End),Interval1), findall((Start,End),football_at_the_2012_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2000_african_cup_of_nations_OR_football_at_the_2012_summer_olympics(Interval).

ev_2000_african_cup_of_nations_OR_football_at_the_2012_summer_olympics_at_1861(Res) :- setof((Start,End),ev_2000_african_cup_of_nations_OR_football_at_the_2012_summer_olympics(Start,End),AllINtervals), checkvalidity(1861,AllINtervals,Res).

check_query() :- write('Query = ev_2000_african_cup_of_nations_OR_football_at_the_2012_summer_olympics_at_1861'), (ev_2000_african_cup_of_nations_OR_football_at_the_2012_summer_olympics_at_1861(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2000_african_cup_of_nations_OR_football_at_the_2012_summer_olympics_aux().

