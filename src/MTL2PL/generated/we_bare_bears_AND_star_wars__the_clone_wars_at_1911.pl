:- include('database.pl').
we_bare_bears(Start,End) :- begin('we_bare_bears',_,_,Start), end('we_bare_bears',_,_,End), Start=<End.

star_wars__the_clone_wars(Start,End) :- begin('star_wars__the_clone_wars',_,_,Start), end('star_wars__the_clone_wars',_,_,End), Start=<End.

generate_facts_we_bare_bears_AND_star_wars__the_clone_wars([]) :- assert(we_bare_bears_AND_star_wars__the_clone_wars(-1,-1)).

generate_facts_we_bare_bears_AND_star_wars__the_clone_wars([(Start,End) | Tail]) :- assert(we_bare_bears_AND_star_wars__the_clone_wars(Start,End)), generate_facts_we_bare_bears_AND_star_wars__the_clone_wars(Tail).

we_bare_bears_AND_star_wars__the_clone_wars_aux() :- findall((Start,End),we_bare_bears(Start,End),Interval1), findall((Start,End),star_wars__the_clone_wars(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_we_bare_bears_AND_star_wars__the_clone_wars(Interval).

we_bare_bears_AND_star_wars__the_clone_wars_at_1911(Res) :- setof((Start,End),we_bare_bears_AND_star_wars__the_clone_wars(Start,End),AllINtervals), checkvalidity(1911,AllINtervals,Res).

check_query() :- write('Query = we_bare_bears_AND_star_wars__the_clone_wars_at_1911'), (we_bare_bears_AND_star_wars__the_clone_wars_at_1911(true) -> write('\nRes   = true');write('\nRes   = false')).
?- we_bare_bears_AND_star_wars__the_clone_wars_aux().

