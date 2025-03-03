:- include('database.pl').
war_of_devolution(Start,End) :- begin('war_of_devolution',_,_,Start), end('war_of_devolution',_,_,End), Start=<End.

lenin_peace_prize(Start,End) :- begin('lenin_peace_prize',_,_,Start), end('lenin_peace_prize',_,_,End), Start=<End.

generate_facts_war_of_devolution_OR_lenin_peace_prize([]) :- assert(war_of_devolution_OR_lenin_peace_prize(-1,-1)).

generate_facts_war_of_devolution_OR_lenin_peace_prize([(Start,End) | Tail]) :- assert(war_of_devolution_OR_lenin_peace_prize(Start,End)), generate_facts_war_of_devolution_OR_lenin_peace_prize(Tail).

war_of_devolution_OR_lenin_peace_prize_aux() :- findall((Start,End),war_of_devolution(Start,End),Interval1), findall((Start,End),lenin_peace_prize(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_war_of_devolution_OR_lenin_peace_prize(Interval).

war_of_devolution_OR_lenin_peace_prize_at_1839(Res) :- setof((Start,End),war_of_devolution_OR_lenin_peace_prize(Start,End),AllINtervals), checkvalidity(1839,AllINtervals,Res).

check_query() :- write('Query = war_of_devolution_OR_lenin_peace_prize_at_1839'), (war_of_devolution_OR_lenin_peace_prize_at_1839(true) -> write('\nRes   = true');write('\nRes   = false')).
?- war_of_devolution_OR_lenin_peace_prize_aux().

