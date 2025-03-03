:- include('database.pl').
the_expanse(Start,End) :- begin('the_expanse',_,_,Start), end('the_expanse',_,_,End), Start=<End.

the_good_wife(Start,End) :- begin('the_good_wife',_,_,Start), end('the_good_wife',_,_,End), Start=<End.

generate_facts_the_expanse_AND_the_good_wife([]) :- assert(the_expanse_AND_the_good_wife(-1,-1)).

generate_facts_the_expanse_AND_the_good_wife([(Start,End) | Tail]) :- assert(the_expanse_AND_the_good_wife(Start,End)), generate_facts_the_expanse_AND_the_good_wife(Tail).

the_expanse_AND_the_good_wife_aux() :- findall((Start,End),the_expanse(Start,End),Interval1), findall((Start,End),the_good_wife(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_expanse_AND_the_good_wife(Interval).

the_expanse_AND_the_good_wife_at_2015(Res) :- setof((Start,End),the_expanse_AND_the_good_wife(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = the_expanse_AND_the_good_wife_at_2015'), (the_expanse_AND_the_good_wife_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_expanse_AND_the_good_wife_aux().

