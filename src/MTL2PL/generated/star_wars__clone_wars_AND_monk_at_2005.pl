:- include('database.pl').
star_wars__clone_wars(Start,End) :- begin('star_wars__clone_wars',_,_,Start), end('star_wars__clone_wars',_,_,End), Start=<End.

monk(Start,End) :- begin('monk',_,_,Start), end('monk',_,_,End), Start=<End.

generate_facts_star_wars__clone_wars_AND_monk([]) :- assert(star_wars__clone_wars_AND_monk(-1,-1)).

generate_facts_star_wars__clone_wars_AND_monk([(Start,End) | Tail]) :- assert(star_wars__clone_wars_AND_monk(Start,End)), generate_facts_star_wars__clone_wars_AND_monk(Tail).

star_wars__clone_wars_AND_monk_aux() :- findall((Start,End),star_wars__clone_wars(Start,End),Interval1), findall((Start,End),monk(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_star_wars__clone_wars_AND_monk(Interval).

star_wars__clone_wars_AND_monk_at_2005(Res) :- setof((Start,End),star_wars__clone_wars_AND_monk(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = star_wars__clone_wars_AND_monk_at_2005'), (star_wars__clone_wars_AND_monk_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- star_wars__clone_wars_AND_monk_aux().

