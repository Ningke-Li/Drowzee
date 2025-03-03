:- include('database.pl').
ev_1920_summer_olympics(Start,End) :- begin('ev_1920_summer_olympics',_,_,Start), end('ev_1920_summer_olympics',_,_,End), Start=<End.

how_to_get_away_with_murder(Start,End) :- begin('how_to_get_away_with_murder',_,_,Start), end('how_to_get_away_with_murder',_,_,End), Start=<End.

generate_facts_ev_1920_summer_olympics_OR_how_to_get_away_with_murder([]) :- assert(ev_1920_summer_olympics_OR_how_to_get_away_with_murder(-1,-1)).

generate_facts_ev_1920_summer_olympics_OR_how_to_get_away_with_murder([(Start,End) | Tail]) :- assert(ev_1920_summer_olympics_OR_how_to_get_away_with_murder(Start,End)), generate_facts_ev_1920_summer_olympics_OR_how_to_get_away_with_murder(Tail).

ev_1920_summer_olympics_OR_how_to_get_away_with_murder_aux() :- findall((Start,End),ev_1920_summer_olympics(Start,End),Interval1), findall((Start,End),how_to_get_away_with_murder(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1920_summer_olympics_OR_how_to_get_away_with_murder(Interval).

ev_1920_summer_olympics_OR_how_to_get_away_with_murder_at_1950(Res) :- setof((Start,End),ev_1920_summer_olympics_OR_how_to_get_away_with_murder(Start,End),AllINtervals), checkvalidity(1950,AllINtervals,Res).

check_query() :- write('Query = ev_1920_summer_olympics_OR_how_to_get_away_with_murder_at_1950'), (ev_1920_summer_olympics_OR_how_to_get_away_with_murder_at_1950(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1920_summer_olympics_OR_how_to_get_away_with_murder_aux().

