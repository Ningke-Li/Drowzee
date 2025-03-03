:- include('database.pl').
orange_is_the_new_black(Start,End) :- begin('orange_is_the_new_black',_,_,Start), end('orange_is_the_new_black',_,_,End), Start=<End.

atlanta(Start,End) :- begin('atlanta',_,_,Start), end('atlanta',_,_,End), Start=<End.

generate_facts_orange_is_the_new_black_AND_atlanta([]) :- assert(orange_is_the_new_black_AND_atlanta(-1,-1)).

generate_facts_orange_is_the_new_black_AND_atlanta([(Start,End) | Tail]) :- assert(orange_is_the_new_black_AND_atlanta(Start,End)), generate_facts_orange_is_the_new_black_AND_atlanta(Tail).

orange_is_the_new_black_AND_atlanta_aux() :- findall((Start,End),orange_is_the_new_black(Start,End),Interval1), findall((Start,End),atlanta(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_orange_is_the_new_black_AND_atlanta(Interval).

orange_is_the_new_black_AND_atlanta_at_1996(Res) :- setof((Start,End),orange_is_the_new_black_AND_atlanta(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = orange_is_the_new_black_AND_atlanta_at_1996'), (orange_is_the_new_black_AND_atlanta_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).
?- orange_is_the_new_black_AND_atlanta_aux().

