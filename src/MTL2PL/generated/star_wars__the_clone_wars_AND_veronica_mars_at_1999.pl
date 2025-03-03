:- include('database.pl').
star_wars__the_clone_wars(Start,End) :- begin('star_wars__the_clone_wars',_,_,Start), end('star_wars__the_clone_wars',_,_,End), Start=<End.

veronica_mars(Start,End) :- begin('veronica_mars',_,_,Start), end('veronica_mars',_,_,End), Start=<End.

generate_facts_star_wars__the_clone_wars_AND_veronica_mars([]) :- assert(star_wars__the_clone_wars_AND_veronica_mars(-1,-1)).

generate_facts_star_wars__the_clone_wars_AND_veronica_mars([(Start,End) | Tail]) :- assert(star_wars__the_clone_wars_AND_veronica_mars(Start,End)), generate_facts_star_wars__the_clone_wars_AND_veronica_mars(Tail).

star_wars__the_clone_wars_AND_veronica_mars_aux() :- findall((Start,End),star_wars__the_clone_wars(Start,End),Interval1), findall((Start,End),veronica_mars(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_star_wars__the_clone_wars_AND_veronica_mars(Interval).

star_wars__the_clone_wars_AND_veronica_mars_at_1999(Res) :- setof((Start,End),star_wars__the_clone_wars_AND_veronica_mars(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = star_wars__the_clone_wars_AND_veronica_mars_at_1999'), (star_wars__the_clone_wars_AND_veronica_mars_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).
?- star_wars__the_clone_wars_AND_veronica_mars_aux().

