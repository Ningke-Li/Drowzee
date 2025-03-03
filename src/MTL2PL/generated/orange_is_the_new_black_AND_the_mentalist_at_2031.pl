:- include('database.pl').
orange_is_the_new_black(Start,End) :- begin('orange_is_the_new_black',_,_,Start), end('orange_is_the_new_black',_,_,End), Start=<End.

the_mentalist(Start,End) :- begin('the_mentalist',_,_,Start), end('the_mentalist',_,_,End), Start=<End.

generate_facts_orange_is_the_new_black_AND_the_mentalist([]) :- assert(orange_is_the_new_black_AND_the_mentalist(-1,-1)).

generate_facts_orange_is_the_new_black_AND_the_mentalist([(Start,End) | Tail]) :- assert(orange_is_the_new_black_AND_the_mentalist(Start,End)), generate_facts_orange_is_the_new_black_AND_the_mentalist(Tail).

orange_is_the_new_black_AND_the_mentalist_aux() :- findall((Start,End),orange_is_the_new_black(Start,End),Interval1), findall((Start,End),the_mentalist(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_orange_is_the_new_black_AND_the_mentalist(Interval).

orange_is_the_new_black_AND_the_mentalist_at_2031(Res) :- setof((Start,End),orange_is_the_new_black_AND_the_mentalist(Start,End),AllINtervals), checkvalidity(2031,AllINtervals,Res).

check_query() :- write('Query = orange_is_the_new_black_AND_the_mentalist_at_2031'), (orange_is_the_new_black_AND_the_mentalist_at_2031(true) -> write('\nRes   = true');write('\nRes   = false')).
?- orange_is_the_new_black_AND_the_mentalist_aux().

