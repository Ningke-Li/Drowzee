:- include('database.pl').
orange_is_the_new_black(Start,End) :- begin('orange_is_the_new_black',_,_,Start), end('orange_is_the_new_black',_,_,End), Start=<End.

elementary(Start,End) :- begin('elementary',_,_,Start), end('elementary',_,_,End), Start=<End.

generate_facts_orange_is_the_new_black_AND_elementary([]) :- assert(orange_is_the_new_black_AND_elementary(-1,-1)).

generate_facts_orange_is_the_new_black_AND_elementary([(Start,End) | Tail]) :- assert(orange_is_the_new_black_AND_elementary(Start,End)), generate_facts_orange_is_the_new_black_AND_elementary(Tail).

orange_is_the_new_black_AND_elementary_aux() :- findall((Start,End),orange_is_the_new_black(Start,End),Interval1), findall((Start,End),elementary(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_orange_is_the_new_black_AND_elementary(Interval).

orange_is_the_new_black_AND_elementary_at_2017(Res) :- setof((Start,End),orange_is_the_new_black_AND_elementary(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = orange_is_the_new_black_AND_elementary_at_2017'), (orange_is_the_new_black_AND_elementary_at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).
?- orange_is_the_new_black_AND_elementary_aux().

