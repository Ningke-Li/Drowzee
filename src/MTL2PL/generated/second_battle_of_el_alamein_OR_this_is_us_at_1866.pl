:- include('database.pl').
second_battle_of_el_alamein(Start,End) :- begin('second_battle_of_el_alamein',_,_,Start), end('second_battle_of_el_alamein',_,_,End), Start=<End.

this_is_us(Start,End) :- begin('this_is_us',_,_,Start), end('this_is_us',_,_,End), Start=<End.

generate_facts_second_battle_of_el_alamein_OR_this_is_us([]) :- assert(second_battle_of_el_alamein_OR_this_is_us(-1,-1)).

generate_facts_second_battle_of_el_alamein_OR_this_is_us([(Start,End) | Tail]) :- assert(second_battle_of_el_alamein_OR_this_is_us(Start,End)), generate_facts_second_battle_of_el_alamein_OR_this_is_us(Tail).

second_battle_of_el_alamein_OR_this_is_us_aux() :- findall((Start,End),second_battle_of_el_alamein(Start,End),Interval1), findall((Start,End),this_is_us(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_second_battle_of_el_alamein_OR_this_is_us(Interval).

second_battle_of_el_alamein_OR_this_is_us_at_1866(Res) :- setof((Start,End),second_battle_of_el_alamein_OR_this_is_us(Start,End),AllINtervals), checkvalidity(1866,AllINtervals,Res).

check_query() :- write('Query = second_battle_of_el_alamein_OR_this_is_us_at_1866'), (second_battle_of_el_alamein_OR_this_is_us_at_1866(true) -> write('\nRes   = true');write('\nRes   = false')).
?- second_battle_of_el_alamein_OR_this_is_us_aux().

