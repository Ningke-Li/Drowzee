:- include('database.pl').
true_blood(Start,End) :- begin('true_blood',_,_,Start), end('true_blood',_,_,End), Start=<End.

orange_is_the_new_black(Start,End) :- begin('orange_is_the_new_black',_,_,Start), end('orange_is_the_new_black',_,_,End), Start=<End.

generate_facts_true_blood_AND_orange_is_the_new_black([]) :- assert(true_blood_AND_orange_is_the_new_black(-1,-1)).

generate_facts_true_blood_AND_orange_is_the_new_black([(Start,End) | Tail]) :- assert(true_blood_AND_orange_is_the_new_black(Start,End)), generate_facts_true_blood_AND_orange_is_the_new_black(Tail).

true_blood_AND_orange_is_the_new_black_aux() :- findall((Start,End),true_blood(Start,End),Interval1), findall((Start,End),orange_is_the_new_black(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_true_blood_AND_orange_is_the_new_black(Interval).

true_blood_AND_orange_is_the_new_black_at_1896(Res) :- setof((Start,End),true_blood_AND_orange_is_the_new_black(Start,End),AllINtervals), checkvalidity(1896,AllINtervals,Res).

check_query() :- write('Query = true_blood_AND_orange_is_the_new_black_at_1896'), (true_blood_AND_orange_is_the_new_black_at_1896(true) -> write('\nRes   = true');write('\nRes   = false')).
?- true_blood_AND_orange_is_the_new_black_aux().

