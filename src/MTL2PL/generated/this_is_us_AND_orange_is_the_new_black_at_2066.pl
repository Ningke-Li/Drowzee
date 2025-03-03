:- include('database.pl').
this_is_us(Start,End) :- begin('this_is_us',_,_,Start), end('this_is_us',_,_,End), Start=<End.

orange_is_the_new_black(Start,End) :- begin('orange_is_the_new_black',_,_,Start), end('orange_is_the_new_black',_,_,End), Start=<End.

generate_facts_this_is_us_AND_orange_is_the_new_black([]) :- assert(this_is_us_AND_orange_is_the_new_black(-1,-1)).

generate_facts_this_is_us_AND_orange_is_the_new_black([(Start,End) | Tail]) :- assert(this_is_us_AND_orange_is_the_new_black(Start,End)), generate_facts_this_is_us_AND_orange_is_the_new_black(Tail).

this_is_us_AND_orange_is_the_new_black_aux() :- findall((Start,End),this_is_us(Start,End),Interval1), findall((Start,End),orange_is_the_new_black(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_this_is_us_AND_orange_is_the_new_black(Interval).

this_is_us_AND_orange_is_the_new_black_at_2066(Res) :- setof((Start,End),this_is_us_AND_orange_is_the_new_black(Start,End),AllINtervals), checkvalidity(2066,AllINtervals,Res).

check_query() :- write('Query = this_is_us_AND_orange_is_the_new_black_at_2066'), (this_is_us_AND_orange_is_the_new_black_at_2066(true) -> write('\nRes   = true');write('\nRes   = false')).
?- this_is_us_AND_orange_is_the_new_black_aux().

