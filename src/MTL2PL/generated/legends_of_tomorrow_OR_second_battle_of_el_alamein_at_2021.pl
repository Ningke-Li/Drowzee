:- include('database.pl').
legends_of_tomorrow(Start,End) :- begin('legends_of_tomorrow',_,_,Start), end('legends_of_tomorrow',_,_,End), Start=<End.

second_battle_of_el_alamein(Start,End) :- begin('second_battle_of_el_alamein',_,_,Start), end('second_battle_of_el_alamein',_,_,End), Start=<End.

generate_facts_legends_of_tomorrow_OR_second_battle_of_el_alamein([]) :- assert(legends_of_tomorrow_OR_second_battle_of_el_alamein(-1,-1)).

generate_facts_legends_of_tomorrow_OR_second_battle_of_el_alamein([(Start,End) | Tail]) :- assert(legends_of_tomorrow_OR_second_battle_of_el_alamein(Start,End)), generate_facts_legends_of_tomorrow_OR_second_battle_of_el_alamein(Tail).

legends_of_tomorrow_OR_second_battle_of_el_alamein_aux() :- findall((Start,End),legends_of_tomorrow(Start,End),Interval1), findall((Start,End),second_battle_of_el_alamein(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_legends_of_tomorrow_OR_second_battle_of_el_alamein(Interval).

legends_of_tomorrow_OR_second_battle_of_el_alamein_at_2021(Res) :- setof((Start,End),legends_of_tomorrow_OR_second_battle_of_el_alamein(Start,End),AllINtervals), checkvalidity(2021,AllINtervals,Res).

check_query() :- write('Query = legends_of_tomorrow_OR_second_battle_of_el_alamein_at_2021'), (legends_of_tomorrow_OR_second_battle_of_el_alamein_at_2021(true) -> write('\nRes   = true');write('\nRes   = false')).
?- legends_of_tomorrow_OR_second_battle_of_el_alamein_aux().

