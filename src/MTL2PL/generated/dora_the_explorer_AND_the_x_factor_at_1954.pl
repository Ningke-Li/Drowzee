:- include('database.pl').
dora_the_explorer(Start,End) :- begin('dora_the_explorer',_,_,Start), end('dora_the_explorer',_,_,End), Start=<End.

the_x_factor(Start,End) :- begin('the_x_factor',_,_,Start), end('the_x_factor',_,_,End), Start=<End.

generate_facts_dora_the_explorer_AND_the_x_factor([]) :- assert(dora_the_explorer_AND_the_x_factor(-1,-1)).

generate_facts_dora_the_explorer_AND_the_x_factor([(Start,End) | Tail]) :- assert(dora_the_explorer_AND_the_x_factor(Start,End)), generate_facts_dora_the_explorer_AND_the_x_factor(Tail).

dora_the_explorer_AND_the_x_factor_aux() :- findall((Start,End),dora_the_explorer(Start,End),Interval1), findall((Start,End),the_x_factor(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_dora_the_explorer_AND_the_x_factor(Interval).

dora_the_explorer_AND_the_x_factor_at_1954(Res) :- setof((Start,End),dora_the_explorer_AND_the_x_factor(Start,End),AllINtervals), checkvalidity(1954,AllINtervals,Res).

check_query() :- write('Query = dora_the_explorer_AND_the_x_factor_at_1954'), (dora_the_explorer_AND_the_x_factor_at_1954(true) -> write('\nRes   = true');write('\nRes   = false')).
?- dora_the_explorer_AND_the_x_factor_aux().

