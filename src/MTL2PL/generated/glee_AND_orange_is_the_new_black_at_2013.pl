:- include('database.pl').
glee(Start,End) :- begin('glee',_,_,Start), end('glee',_,_,End), Start=<End.

orange_is_the_new_black(Start,End) :- begin('orange_is_the_new_black',_,_,Start), end('orange_is_the_new_black',_,_,End), Start=<End.

generate_facts_glee_AND_orange_is_the_new_black([]) :- assert(glee_AND_orange_is_the_new_black(-1,-1)).

generate_facts_glee_AND_orange_is_the_new_black([(Start,End) | Tail]) :- assert(glee_AND_orange_is_the_new_black(Start,End)), generate_facts_glee_AND_orange_is_the_new_black(Tail).

glee_AND_orange_is_the_new_black_aux() :- findall((Start,End),glee(Start,End),Interval1), findall((Start,End),orange_is_the_new_black(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_glee_AND_orange_is_the_new_black(Interval).

glee_AND_orange_is_the_new_black_at_2013(Res) :- setof((Start,End),glee_AND_orange_is_the_new_black(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = glee_AND_orange_is_the_new_black_at_2013'), (glee_AND_orange_is_the_new_black_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).
?- glee_AND_orange_is_the_new_black_aux().

