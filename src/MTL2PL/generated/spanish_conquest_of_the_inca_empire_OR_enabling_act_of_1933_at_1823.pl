:- include('database.pl').
spanish_conquest_of_the_inca_empire(Start,End) :- begin('spanish_conquest_of_the_inca_empire',_,_,Start), end('spanish_conquest_of_the_inca_empire',_,_,End), Start=<End.

enabling_act_of_1933(Start,End) :- begin('enabling_act_of_1933',_,_,Start), end('enabling_act_of_1933',_,_,End), Start=<End.

generate_facts_spanish_conquest_of_the_inca_empire_OR_enabling_act_of_1933([]) :- assert(spanish_conquest_of_the_inca_empire_OR_enabling_act_of_1933(-1,-1)).

generate_facts_spanish_conquest_of_the_inca_empire_OR_enabling_act_of_1933([(Start,End) | Tail]) :- assert(spanish_conquest_of_the_inca_empire_OR_enabling_act_of_1933(Start,End)), generate_facts_spanish_conquest_of_the_inca_empire_OR_enabling_act_of_1933(Tail).

spanish_conquest_of_the_inca_empire_OR_enabling_act_of_1933_aux() :- findall((Start,End),spanish_conquest_of_the_inca_empire(Start,End),Interval1), findall((Start,End),enabling_act_of_1933(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_spanish_conquest_of_the_inca_empire_OR_enabling_act_of_1933(Interval).

spanish_conquest_of_the_inca_empire_OR_enabling_act_of_1933_at_1823(Res) :- setof((Start,End),spanish_conquest_of_the_inca_empire_OR_enabling_act_of_1933(Start,End),AllINtervals), checkvalidity(1823,AllINtervals,Res).

check_query() :- write('Query = spanish_conquest_of_the_inca_empire_OR_enabling_act_of_1933_at_1823'), (spanish_conquest_of_the_inca_empire_OR_enabling_act_of_1933_at_1823(true) -> write('\nRes   = true');write('\nRes   = false')).
?- spanish_conquest_of_the_inca_empire_OR_enabling_act_of_1933_aux().

