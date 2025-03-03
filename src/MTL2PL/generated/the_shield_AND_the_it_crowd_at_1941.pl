:- include('database.pl').
the_shield(Start,End) :- begin('the_shield',_,_,Start), end('the_shield',_,_,End), Start=<End.

the_it_crowd(Start,End) :- begin('the_it_crowd',_,_,Start), end('the_it_crowd',_,_,End), Start=<End.

generate_facts_the_shield_AND_the_it_crowd([]) :- assert(the_shield_AND_the_it_crowd(-1,-1)).

generate_facts_the_shield_AND_the_it_crowd([(Start,End) | Tail]) :- assert(the_shield_AND_the_it_crowd(Start,End)), generate_facts_the_shield_AND_the_it_crowd(Tail).

the_shield_AND_the_it_crowd_aux() :- findall((Start,End),the_shield(Start,End),Interval1), findall((Start,End),the_it_crowd(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_shield_AND_the_it_crowd(Interval).

the_shield_AND_the_it_crowd_at_1941(Res) :- setof((Start,End),the_shield_AND_the_it_crowd(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = the_shield_AND_the_it_crowd_at_1941'), (the_shield_AND_the_it_crowd_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_shield_AND_the_it_crowd_aux().

