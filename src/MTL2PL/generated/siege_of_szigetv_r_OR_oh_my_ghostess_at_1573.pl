:- include('database.pl').
siege_of_szigetv_r(Start,End) :- begin('siege_of_szigetv_r',_,_,Start), end('siege_of_szigetv_r',_,_,End), Start=<End.

oh_my_ghostess(Start,End) :- begin('oh_my_ghostess',_,_,Start), end('oh_my_ghostess',_,_,End), Start=<End.

generate_facts_siege_of_szigetv_r_OR_oh_my_ghostess([]) :- assert(siege_of_szigetv_r_OR_oh_my_ghostess(-1,-1)).

generate_facts_siege_of_szigetv_r_OR_oh_my_ghostess([(Start,End) | Tail]) :- assert(siege_of_szigetv_r_OR_oh_my_ghostess(Start,End)), generate_facts_siege_of_szigetv_r_OR_oh_my_ghostess(Tail).

siege_of_szigetv_r_OR_oh_my_ghostess_aux() :- findall((Start,End),siege_of_szigetv_r(Start,End),Interval1), findall((Start,End),oh_my_ghostess(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_siege_of_szigetv_r_OR_oh_my_ghostess(Interval).

siege_of_szigetv_r_OR_oh_my_ghostess_at_1573(Res) :- setof((Start,End),siege_of_szigetv_r_OR_oh_my_ghostess(Start,End),AllINtervals), checkvalidity(1573,AllINtervals,Res).

check_query() :- write('Query = siege_of_szigetv_r_OR_oh_my_ghostess_at_1573'), (siege_of_szigetv_r_OR_oh_my_ghostess_at_1573(true) -> write('\nRes   = true');write('\nRes   = false')).
?- siege_of_szigetv_r_OR_oh_my_ghostess_aux().

