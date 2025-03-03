:- include('database.pl').
ev_2016_17_serie_a(Start,End) :- begin('ev_2016_17_serie_a',_,_,Start), end('ev_2016_17_serie_a',_,_,End), Start=<End.

how_to_get_away_with_murder(Start,End) :- begin('how_to_get_away_with_murder',_,_,Start), end('how_to_get_away_with_murder',_,_,End), Start=<End.

generate_facts_ev_2016_17_serie_a_AND_how_to_get_away_with_murder([]) :- assert(ev_2016_17_serie_a_AND_how_to_get_away_with_murder(-1,-1)).

generate_facts_ev_2016_17_serie_a_AND_how_to_get_away_with_murder([(Start,End) | Tail]) :- assert(ev_2016_17_serie_a_AND_how_to_get_away_with_murder(Start,End)), generate_facts_ev_2016_17_serie_a_AND_how_to_get_away_with_murder(Tail).

ev_2016_17_serie_a_AND_how_to_get_away_with_murder_aux() :- findall((Start,End),ev_2016_17_serie_a(Start,End),Interval1), findall((Start,End),how_to_get_away_with_murder(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2016_17_serie_a_AND_how_to_get_away_with_murder(Interval).

ev_2016_17_serie_a_AND_how_to_get_away_with_murder_at_1946(Res) :- setof((Start,End),ev_2016_17_serie_a_AND_how_to_get_away_with_murder(Start,End),AllINtervals), checkvalidity(1946,AllINtervals,Res).

check_query() :- write('Query = ev_2016_17_serie_a_AND_how_to_get_away_with_murder_at_1946'), (ev_2016_17_serie_a_AND_how_to_get_away_with_murder_at_1946(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2016_17_serie_a_AND_how_to_get_away_with_murder_aux().

