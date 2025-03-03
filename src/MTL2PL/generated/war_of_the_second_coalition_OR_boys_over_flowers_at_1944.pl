:- include('database.pl').
war_of_the_second_coalition(Start,End) :- begin('war_of_the_second_coalition',_,_,Start), end('war_of_the_second_coalition',_,_,End), Start=<End.

boys_over_flowers(Start,End) :- begin('boys_over_flowers',_,_,Start), end('boys_over_flowers',_,_,End), Start=<End.

generate_facts_war_of_the_second_coalition_OR_boys_over_flowers([]) :- assert(war_of_the_second_coalition_OR_boys_over_flowers(-1,-1)).

generate_facts_war_of_the_second_coalition_OR_boys_over_flowers([(Start,End) | Tail]) :- assert(war_of_the_second_coalition_OR_boys_over_flowers(Start,End)), generate_facts_war_of_the_second_coalition_OR_boys_over_flowers(Tail).

war_of_the_second_coalition_OR_boys_over_flowers_aux() :- findall((Start,End),war_of_the_second_coalition(Start,End),Interval1), findall((Start,End),boys_over_flowers(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_war_of_the_second_coalition_OR_boys_over_flowers(Interval).

war_of_the_second_coalition_OR_boys_over_flowers_at_1944(Res) :- setof((Start,End),war_of_the_second_coalition_OR_boys_over_flowers(Start,End),AllINtervals), checkvalidity(1944,AllINtervals,Res).

check_query() :- write('Query = war_of_the_second_coalition_OR_boys_over_flowers_at_1944'), (war_of_the_second_coalition_OR_boys_over_flowers_at_1944(true) -> write('\nRes   = true');write('\nRes   = false')).
?- war_of_the_second_coalition_OR_boys_over_flowers_aux().

