:- include('database.pl').
ev_2014_summer_youth_olympics(Start,End) :- begin('ev_2014_summer_youth_olympics',_,_,Start), end('ev_2014_summer_youth_olympics',_,_,End), Start=<End.

world_chess_championship_2014(Start,End) :- begin('world_chess_championship_2014',_,_,Start), end('world_chess_championship_2014',_,_,End), Start=<End.

generate_facts_ev_2014_summer_youth_olympics_OR_world_chess_championship_2014([]) :- assert(ev_2014_summer_youth_olympics_OR_world_chess_championship_2014(-1,-1)).

generate_facts_ev_2014_summer_youth_olympics_OR_world_chess_championship_2014([(Start,End) | Tail]) :- assert(ev_2014_summer_youth_olympics_OR_world_chess_championship_2014(Start,End)), generate_facts_ev_2014_summer_youth_olympics_OR_world_chess_championship_2014(Tail).

ev_2014_summer_youth_olympics_OR_world_chess_championship_2014_aux() :- findall((Start,End),ev_2014_summer_youth_olympics(Start,End),Interval1), findall((Start,End),world_chess_championship_2014(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2014_summer_youth_olympics_OR_world_chess_championship_2014(Interval).

ev_2014_summer_youth_olympics_OR_world_chess_championship_2014_at_2029(Res) :- setof((Start,End),ev_2014_summer_youth_olympics_OR_world_chess_championship_2014(Start,End),AllINtervals), checkvalidity(2029,AllINtervals,Res).

check_query() :- write('Query = ev_2014_summer_youth_olympics_OR_world_chess_championship_2014_at_2029'), (ev_2014_summer_youth_olympics_OR_world_chess_championship_2014_at_2029(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_summer_youth_olympics_OR_world_chess_championship_2014_aux().

