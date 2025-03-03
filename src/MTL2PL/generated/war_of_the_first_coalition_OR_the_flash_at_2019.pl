:- include('database.pl').
war_of_the_first_coalition(Start,End) :- begin('war_of_the_first_coalition',_,_,Start), end('war_of_the_first_coalition',_,_,End), Start=<End.

the_flash(Start,End) :- begin('the_flash',_,_,Start), end('the_flash',_,_,End), Start=<End.

generate_facts_war_of_the_first_coalition_OR_the_flash([]) :- assert(war_of_the_first_coalition_OR_the_flash(-1,-1)).

generate_facts_war_of_the_first_coalition_OR_the_flash([(Start,End) | Tail]) :- assert(war_of_the_first_coalition_OR_the_flash(Start,End)), generate_facts_war_of_the_first_coalition_OR_the_flash(Tail).

war_of_the_first_coalition_OR_the_flash_aux() :- findall((Start,End),war_of_the_first_coalition(Start,End),Interval1), findall((Start,End),the_flash(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_war_of_the_first_coalition_OR_the_flash(Interval).

war_of_the_first_coalition_OR_the_flash_at_2019(Res) :- setof((Start,End),war_of_the_first_coalition_OR_the_flash(Start,End),AllINtervals), checkvalidity(2019,AllINtervals,Res).

check_query() :- write('Query = war_of_the_first_coalition_OR_the_flash_at_2019'), (war_of_the_first_coalition_OR_the_flash_at_2019(true) -> write('\nRes   = true');write('\nRes   = false')).
?- war_of_the_first_coalition_OR_the_flash_aux().

