:- include('database.pl').
war_of_the_fourth_coalition(Start,End) :- begin('war_of_the_fourth_coalition',_,_,Start), end('war_of_the_fourth_coalition',_,_,End), Start=<End.

white_collar(Start,End) :- begin('white_collar',_,_,Start), end('white_collar',_,_,End), Start=<End.

generate_facts_war_of_the_fourth_coalition_OR_white_collar([]) :- assert(war_of_the_fourth_coalition_OR_white_collar(-1,-1)).

generate_facts_war_of_the_fourth_coalition_OR_white_collar([(Start,End) | Tail]) :- assert(war_of_the_fourth_coalition_OR_white_collar(Start,End)), generate_facts_war_of_the_fourth_coalition_OR_white_collar(Tail).

war_of_the_fourth_coalition_OR_white_collar_aux() :- findall((Start,End),war_of_the_fourth_coalition(Start,End),Interval1), findall((Start,End),white_collar(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_war_of_the_fourth_coalition_OR_white_collar(Interval).

war_of_the_fourth_coalition_OR_white_collar_at_1933(Res) :- setof((Start,End),war_of_the_fourth_coalition_OR_white_collar(Start,End),AllINtervals), checkvalidity(1933,AllINtervals,Res).

check_query() :- write('Query = war_of_the_fourth_coalition_OR_white_collar_at_1933'), (war_of_the_fourth_coalition_OR_white_collar_at_1933(true) -> write('\nRes   = true');write('\nRes   = false')).
?- war_of_the_fourth_coalition_OR_white_collar_aux().

