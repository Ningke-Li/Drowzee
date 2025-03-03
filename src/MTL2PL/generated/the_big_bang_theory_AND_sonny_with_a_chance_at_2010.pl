:- include('database.pl').
the_big_bang_theory(Start,End) :- begin('the_big_bang_theory',_,_,Start), end('the_big_bang_theory',_,_,End), Start=<End.

sonny_with_a_chance(Start,End) :- begin('sonny_with_a_chance',_,_,Start), end('sonny_with_a_chance',_,_,End), Start=<End.

generate_facts_the_big_bang_theory_AND_sonny_with_a_chance([]) :- assert(the_big_bang_theory_AND_sonny_with_a_chance(-1,-1)).

generate_facts_the_big_bang_theory_AND_sonny_with_a_chance([(Start,End) | Tail]) :- assert(the_big_bang_theory_AND_sonny_with_a_chance(Start,End)), generate_facts_the_big_bang_theory_AND_sonny_with_a_chance(Tail).

the_big_bang_theory_AND_sonny_with_a_chance_aux() :- findall((Start,End),the_big_bang_theory(Start,End),Interval1), findall((Start,End),sonny_with_a_chance(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_big_bang_theory_AND_sonny_with_a_chance(Interval).

the_big_bang_theory_AND_sonny_with_a_chance_at_2010(Res) :- setof((Start,End),the_big_bang_theory_AND_sonny_with_a_chance(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = the_big_bang_theory_AND_sonny_with_a_chance_at_2010'), (the_big_bang_theory_AND_sonny_with_a_chance_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_big_bang_theory_AND_sonny_with_a_chance_aux().

