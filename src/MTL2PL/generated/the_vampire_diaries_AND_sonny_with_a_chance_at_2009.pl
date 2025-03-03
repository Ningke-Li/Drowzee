:- include('database.pl').
the_vampire_diaries(Start,End) :- begin('the_vampire_diaries',_,_,Start), end('the_vampire_diaries',_,_,End), Start=<End.

sonny_with_a_chance(Start,End) :- begin('sonny_with_a_chance',_,_,Start), end('sonny_with_a_chance',_,_,End), Start=<End.

generate_facts_the_vampire_diaries_AND_sonny_with_a_chance([]) :- assert(the_vampire_diaries_AND_sonny_with_a_chance(-1,-1)).

generate_facts_the_vampire_diaries_AND_sonny_with_a_chance([(Start,End) | Tail]) :- assert(the_vampire_diaries_AND_sonny_with_a_chance(Start,End)), generate_facts_the_vampire_diaries_AND_sonny_with_a_chance(Tail).

the_vampire_diaries_AND_sonny_with_a_chance_aux() :- findall((Start,End),the_vampire_diaries(Start,End),Interval1), findall((Start,End),sonny_with_a_chance(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_vampire_diaries_AND_sonny_with_a_chance(Interval).

the_vampire_diaries_AND_sonny_with_a_chance_at_2009(Res) :- setof((Start,End),the_vampire_diaries_AND_sonny_with_a_chance(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = the_vampire_diaries_AND_sonny_with_a_chance_at_2009'), (the_vampire_diaries_AND_sonny_with_a_chance_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_vampire_diaries_AND_sonny_with_a_chance_aux().

