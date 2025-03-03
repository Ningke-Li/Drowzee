:- include('database.pl').
hawaii_five_0(Start,End) :- begin('hawaii_five_0',_,_,Start), end('hawaii_five_0',_,_,End), Start=<End.

the_expanse(Start,End) :- begin('the_expanse',_,_,Start), end('the_expanse',_,_,End), Start=<End.

generate_facts_hawaii_five_0_OR_the_expanse([]) :- assert(hawaii_five_0_OR_the_expanse(-1,-1)).

generate_facts_hawaii_five_0_OR_the_expanse([(Start,End) | Tail]) :- assert(hawaii_five_0_OR_the_expanse(Start,End)), generate_facts_hawaii_five_0_OR_the_expanse(Tail).

hawaii_five_0_OR_the_expanse_aux() :- findall((Start,End),hawaii_five_0(Start,End),Interval1), findall((Start,End),the_expanse(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_hawaii_five_0_OR_the_expanse(Interval).

hawaii_five_0_OR_the_expanse_at_1959(Res) :- setof((Start,End),hawaii_five_0_OR_the_expanse(Start,End),AllINtervals), checkvalidity(1959,AllINtervals,Res).

check_query() :- write('Query = hawaii_five_0_OR_the_expanse_at_1959'), (hawaii_five_0_OR_the_expanse_at_1959(true) -> write('\nRes   = true');write('\nRes   = false')).
?- hawaii_five_0_OR_the_expanse_aux().

