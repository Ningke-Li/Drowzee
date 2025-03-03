:- include('database.pl').
ozark(Start,End) :- begin('ozark',_,_,Start), end('ozark',_,_,End), Start=<End.

how_to_get_away_with_murder(Start,End) :- begin('how_to_get_away_with_murder',_,_,Start), end('how_to_get_away_with_murder',_,_,End), Start=<End.

generate_facts_ozark_AND_how_to_get_away_with_murder([]) :- assert(ozark_AND_how_to_get_away_with_murder(-1,-1)).

generate_facts_ozark_AND_how_to_get_away_with_murder([(Start,End) | Tail]) :- assert(ozark_AND_how_to_get_away_with_murder(Start,End)), generate_facts_ozark_AND_how_to_get_away_with_murder(Tail).

ozark_AND_how_to_get_away_with_murder_aux() :- findall((Start,End),ozark(Start,End),Interval1), findall((Start,End),how_to_get_away_with_murder(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ozark_AND_how_to_get_away_with_murder(Interval).

ozark_AND_how_to_get_away_with_murder_at_1996(Res) :- setof((Start,End),ozark_AND_how_to_get_away_with_murder(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = ozark_AND_how_to_get_away_with_murder_at_1996'), (ozark_AND_how_to_get_away_with_murder_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ozark_AND_how_to_get_away_with_murder_aux().

