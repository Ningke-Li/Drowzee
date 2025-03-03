:- include('database.pl').
heroes(Start,End) :- begin('heroes',_,_,Start), end('heroes',_,_,End), Start=<End.

war_of_the_second_coalition(Start,End) :- begin('war_of_the_second_coalition',_,_,Start), end('war_of_the_second_coalition',_,_,End), Start=<End.

generate_facts_heroes_OR_war_of_the_second_coalition([]) :- assert(heroes_OR_war_of_the_second_coalition(-1,-1)).

generate_facts_heroes_OR_war_of_the_second_coalition([(Start,End) | Tail]) :- assert(heroes_OR_war_of_the_second_coalition(Start,End)), generate_facts_heroes_OR_war_of_the_second_coalition(Tail).

heroes_OR_war_of_the_second_coalition_aux() :- findall((Start,End),heroes(Start,End),Interval1), findall((Start,End),war_of_the_second_coalition(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_heroes_OR_war_of_the_second_coalition(Interval).

heroes_OR_war_of_the_second_coalition_at_1741(Res) :- setof((Start,End),heroes_OR_war_of_the_second_coalition(Start,End),AllINtervals), checkvalidity(1741,AllINtervals,Res).

check_query() :- write('Query = heroes_OR_war_of_the_second_coalition_at_1741'), (heroes_OR_war_of_the_second_coalition_at_1741(true) -> write('\nRes   = true');write('\nRes   = false')).
?- heroes_OR_war_of_the_second_coalition_aux().

