:- include('database.pl').
the_mentalist(Start,End) :- begin('the_mentalist',_,_,Start), end('the_mentalist',_,_,End), Start=<End.

a_k___memnu(Start,End) :- begin('a_k___memnu',_,_,Start), end('a_k___memnu',_,_,End), Start=<End.

generate_facts_the_mentalist_AND_a_k___memnu([]) :- assert(the_mentalist_AND_a_k___memnu(-1,-1)).

generate_facts_the_mentalist_AND_a_k___memnu([(Start,End) | Tail]) :- assert(the_mentalist_AND_a_k___memnu(Start,End)), generate_facts_the_mentalist_AND_a_k___memnu(Tail).

the_mentalist_AND_a_k___memnu_aux() :- findall((Start,End),the_mentalist(Start,End),Interval1), findall((Start,End),a_k___memnu(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_mentalist_AND_a_k___memnu(Interval).

the_mentalist_AND_a_k___memnu_at_2012(Res) :- setof((Start,End),the_mentalist_AND_a_k___memnu(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = the_mentalist_AND_a_k___memnu_at_2012'), (the_mentalist_AND_a_k___memnu_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_mentalist_AND_a_k___memnu_aux().

