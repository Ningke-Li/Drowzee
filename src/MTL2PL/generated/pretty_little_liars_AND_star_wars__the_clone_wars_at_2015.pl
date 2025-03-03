:- include('database.pl').
pretty_little_liars(Start,End) :- begin('pretty_little_liars',_,_,Start), end('pretty_little_liars',_,_,End), Start=<End.

star_wars__the_clone_wars(Start,End) :- begin('star_wars__the_clone_wars',_,_,Start), end('star_wars__the_clone_wars',_,_,End), Start=<End.

generate_facts_pretty_little_liars_AND_star_wars__the_clone_wars([]) :- assert(pretty_little_liars_AND_star_wars__the_clone_wars(-1,-1)).

generate_facts_pretty_little_liars_AND_star_wars__the_clone_wars([(Start,End) | Tail]) :- assert(pretty_little_liars_AND_star_wars__the_clone_wars(Start,End)), generate_facts_pretty_little_liars_AND_star_wars__the_clone_wars(Tail).

pretty_little_liars_AND_star_wars__the_clone_wars_aux() :- findall((Start,End),pretty_little_liars(Start,End),Interval1), findall((Start,End),star_wars__the_clone_wars(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_pretty_little_liars_AND_star_wars__the_clone_wars(Interval).

pretty_little_liars_AND_star_wars__the_clone_wars_at_2015(Res) :- setof((Start,End),pretty_little_liars_AND_star_wars__the_clone_wars(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = pretty_little_liars_AND_star_wars__the_clone_wars_at_2015'), (pretty_little_liars_AND_star_wars__the_clone_wars_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- pretty_little_liars_AND_star_wars__the_clone_wars_aux().

