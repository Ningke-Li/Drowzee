:- include('database.pl').
war_of_the_fourth_coalition(Start,End) :- begin('war_of_the_fourth_coalition',_,_,Start), end('war_of_the_fourth_coalition',_,_,End), Start=<End.

french_franc(Start,End) :- begin('french_franc',_,_,Start), end('french_franc',_,_,End), Start=<End.

generate_facts_war_of_the_fourth_coalition_AND_french_franc([]) :- assert(war_of_the_fourth_coalition_AND_french_franc(-1,-1)).

generate_facts_war_of_the_fourth_coalition_AND_french_franc([(Start,End) | Tail]) :- assert(war_of_the_fourth_coalition_AND_french_franc(Start,End)), generate_facts_war_of_the_fourth_coalition_AND_french_franc(Tail).

war_of_the_fourth_coalition_AND_french_franc_aux() :- findall((Start,End),war_of_the_fourth_coalition(Start,End),Interval1), findall((Start,End),french_franc(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_war_of_the_fourth_coalition_AND_french_franc(Interval).

war_of_the_fourth_coalition_AND_french_franc_at_1813(Res) :- setof((Start,End),war_of_the_fourth_coalition_AND_french_franc(Start,End),AllINtervals), checkvalidity(1813,AllINtervals,Res).

check_query() :- write('Query = war_of_the_fourth_coalition_AND_french_franc_at_1813'), (war_of_the_fourth_coalition_AND_french_franc_at_1813(true) -> write('\nRes   = true');write('\nRes   = false')).
?- war_of_the_fourth_coalition_AND_french_franc_aux().

