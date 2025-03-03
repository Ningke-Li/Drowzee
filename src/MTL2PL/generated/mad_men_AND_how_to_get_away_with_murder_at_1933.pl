:- include('database.pl').
mad_men(Start,End) :- begin('mad_men',_,_,Start), end('mad_men',_,_,End), Start=<End.

how_to_get_away_with_murder(Start,End) :- begin('how_to_get_away_with_murder',_,_,Start), end('how_to_get_away_with_murder',_,_,End), Start=<End.

generate_facts_mad_men_AND_how_to_get_away_with_murder([]) :- assert(mad_men_AND_how_to_get_away_with_murder(-1,-1)).

generate_facts_mad_men_AND_how_to_get_away_with_murder([(Start,End) | Tail]) :- assert(mad_men_AND_how_to_get_away_with_murder(Start,End)), generate_facts_mad_men_AND_how_to_get_away_with_murder(Tail).

mad_men_AND_how_to_get_away_with_murder_aux() :- findall((Start,End),mad_men(Start,End),Interval1), findall((Start,End),how_to_get_away_with_murder(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_mad_men_AND_how_to_get_away_with_murder(Interval).

mad_men_AND_how_to_get_away_with_murder_at_1933(Res) :- setof((Start,End),mad_men_AND_how_to_get_away_with_murder(Start,End),AllINtervals), checkvalidity(1933,AllINtervals,Res).

check_query() :- write('Query = mad_men_AND_how_to_get_away_with_murder_at_1933'), (mad_men_AND_how_to_get_away_with_murder_at_1933(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mad_men_AND_how_to_get_away_with_murder_aux().

