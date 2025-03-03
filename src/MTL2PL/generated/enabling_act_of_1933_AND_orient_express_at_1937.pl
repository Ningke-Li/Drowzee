:- include('database.pl').
enabling_act_of_1933(Start,End) :- begin('enabling_act_of_1933',_,_,Start), end('enabling_act_of_1933',_,_,End), Start=<End.

orient_express(Start,End) :- begin('orient_express',_,_,Start), end('orient_express',_,_,End), Start=<End.

generate_facts_enabling_act_of_1933_AND_orient_express([]) :- assert(enabling_act_of_1933_AND_orient_express(-1,-1)).

generate_facts_enabling_act_of_1933_AND_orient_express([(Start,End) | Tail]) :- assert(enabling_act_of_1933_AND_orient_express(Start,End)), generate_facts_enabling_act_of_1933_AND_orient_express(Tail).

enabling_act_of_1933_AND_orient_express_aux() :- findall((Start,End),enabling_act_of_1933(Start,End),Interval1), findall((Start,End),orient_express(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_enabling_act_of_1933_AND_orient_express(Interval).

enabling_act_of_1933_AND_orient_express_at_1937(Res) :- setof((Start,End),enabling_act_of_1933_AND_orient_express(Start,End),AllINtervals), checkvalidity(1937,AllINtervals,Res).

check_query() :- write('Query = enabling_act_of_1933_AND_orient_express_at_1937'), (enabling_act_of_1933_AND_orient_express_at_1937(true) -> write('\nRes   = true');write('\nRes   = false')).
?- enabling_act_of_1933_AND_orient_express_aux().

