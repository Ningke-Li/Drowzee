:- include('database.pl').
football_at_the_2012_summer_olympics(Start,End) :- begin('football_at_the_2012_summer_olympics',_,_,Start), end('football_at_the_2012_summer_olympics',_,_,End), Start=<End.

ev_2009_tour_de_france(Start,End) :- begin('ev_2009_tour_de_france',_,_,Start), end('ev_2009_tour_de_france',_,_,End), Start=<End.

generate_facts_football_at_the_2012_summer_olympics_OR_ev_2009_tour_de_france([]) :- assert(football_at_the_2012_summer_olympics_OR_ev_2009_tour_de_france(-1,-1)).

generate_facts_football_at_the_2012_summer_olympics_OR_ev_2009_tour_de_france([(Start,End) | Tail]) :- assert(football_at_the_2012_summer_olympics_OR_ev_2009_tour_de_france(Start,End)), generate_facts_football_at_the_2012_summer_olympics_OR_ev_2009_tour_de_france(Tail).

football_at_the_2012_summer_olympics_OR_ev_2009_tour_de_france_aux() :- findall((Start,End),football_at_the_2012_summer_olympics(Start,End),Interval1), findall((Start,End),ev_2009_tour_de_france(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_football_at_the_2012_summer_olympics_OR_ev_2009_tour_de_france(Interval).

football_at_the_2012_summer_olympics_OR_ev_2009_tour_de_france_at_2009(Res) :- setof((Start,End),football_at_the_2012_summer_olympics_OR_ev_2009_tour_de_france(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = football_at_the_2012_summer_olympics_OR_ev_2009_tour_de_france_at_2009'), (football_at_the_2012_summer_olympics_OR_ev_2009_tour_de_france_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- football_at_the_2012_summer_olympics_OR_ev_2009_tour_de_france_aux().

