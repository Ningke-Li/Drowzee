:- include('database.pl').
true_blood(Start,End) :- begin('true_blood',_,_,Start), end('true_blood',_,_,End), Start=<End.

eurovision_dance_contest(Start,End) :- begin('eurovision_dance_contest',_,_,Start), end('eurovision_dance_contest',_,_,End), Start=<End.

generate_facts_true_blood_AND_eurovision_dance_contest([]) :- assert(true_blood_AND_eurovision_dance_contest(-1,-1)).

generate_facts_true_blood_AND_eurovision_dance_contest([(Start,End) | Tail]) :- assert(true_blood_AND_eurovision_dance_contest(Start,End)), generate_facts_true_blood_AND_eurovision_dance_contest(Tail).

true_blood_AND_eurovision_dance_contest_aux() :- findall((Start,End),true_blood(Start,End),Interval1), findall((Start,End),eurovision_dance_contest(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_true_blood_AND_eurovision_dance_contest(Interval).

true_blood_AND_eurovision_dance_contest_at_2028(Res) :- setof((Start,End),true_blood_AND_eurovision_dance_contest(Start,End),AllINtervals), checkvalidity(2028,AllINtervals,Res).

check_query() :- write('Query = true_blood_AND_eurovision_dance_contest_at_2028'), (true_blood_AND_eurovision_dance_contest_at_2028(true) -> write('\nRes   = true');write('\nRes   = false')).
?- true_blood_AND_eurovision_dance_contest_aux().

