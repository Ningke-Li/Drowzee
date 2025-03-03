:- include('database.pl').
war_of_the_quadruple_alliance(Start,End) :- begin('war_of_the_quadruple_alliance',_,_,Start), end('war_of_the_quadruple_alliance',_,_,End), Start=<End.

dora_the_explorer(Start,End) :- begin('dora_the_explorer',_,_,Start), end('dora_the_explorer',_,_,End), Start=<End.

generate_facts_war_of_the_quadruple_alliance_OR_dora_the_explorer([]) :- assert(war_of_the_quadruple_alliance_OR_dora_the_explorer(-1,-1)).

generate_facts_war_of_the_quadruple_alliance_OR_dora_the_explorer([(Start,End) | Tail]) :- assert(war_of_the_quadruple_alliance_OR_dora_the_explorer(Start,End)), generate_facts_war_of_the_quadruple_alliance_OR_dora_the_explorer(Tail).

war_of_the_quadruple_alliance_OR_dora_the_explorer_aux() :- findall((Start,End),war_of_the_quadruple_alliance(Start,End),Interval1), findall((Start,End),dora_the_explorer(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_war_of_the_quadruple_alliance_OR_dora_the_explorer(Interval).

war_of_the_quadruple_alliance_OR_dora_the_explorer_at_2016(Res) :- setof((Start,End),war_of_the_quadruple_alliance_OR_dora_the_explorer(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = war_of_the_quadruple_alliance_OR_dora_the_explorer_at_2016'), (war_of_the_quadruple_alliance_OR_dora_the_explorer_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- war_of_the_quadruple_alliance_OR_dora_the_explorer_aux().

