:- include('database.pl').
napoleonic_wars(Start,End) :- begin('napoleonic_wars',_,_,Start), end('napoleonic_wars',_,_,End), Start=<End.

war_of_the_fourth_coalition(Start,End) :- begin('war_of_the_fourth_coalition',_,_,Start), end('war_of_the_fourth_coalition',_,_,End), Start=<End.

generate_facts_napoleonic_wars_AND_war_of_the_fourth_coalition([]) :- assert(napoleonic_wars_AND_war_of_the_fourth_coalition(-1,-1)).

generate_facts_napoleonic_wars_AND_war_of_the_fourth_coalition([(Start,End) | Tail]) :- assert(napoleonic_wars_AND_war_of_the_fourth_coalition(Start,End)), generate_facts_napoleonic_wars_AND_war_of_the_fourth_coalition(Tail).

napoleonic_wars_AND_war_of_the_fourth_coalition_aux() :- findall((Start,End),napoleonic_wars(Start,End),Interval1), findall((Start,End),war_of_the_fourth_coalition(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_napoleonic_wars_AND_war_of_the_fourth_coalition(Interval).

napoleonic_wars_AND_war_of_the_fourth_coalition_at_1806(Res) :- setof((Start,End),napoleonic_wars_AND_war_of_the_fourth_coalition(Start,End),AllINtervals), checkvalidity(1806,AllINtervals,Res).

check_query() :- write('Query = napoleonic_wars_AND_war_of_the_fourth_coalition_at_1806'), (napoleonic_wars_AND_war_of_the_fourth_coalition_at_1806(true) -> write('\nRes   = true');write('\nRes   = false')).
?- napoleonic_wars_AND_war_of_the_fourth_coalition_aux().

