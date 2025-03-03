:- include('database.pl').
deaths_in_2016(Start,End) :- begin('deaths_in_2016',_,_,Start), end('deaths_in_2016',_,_,End), Start=<End.

first_battle_of_el_alamein(Start,End) :- begin('first_battle_of_el_alamein',_,_,Start), end('first_battle_of_el_alamein',_,_,End), Start=<End.

generate_facts_deaths_in_2016_OR_first_battle_of_el_alamein([]) :- assert(deaths_in_2016_OR_first_battle_of_el_alamein(-1,-1)).

generate_facts_deaths_in_2016_OR_first_battle_of_el_alamein([(Start,End) | Tail]) :- assert(deaths_in_2016_OR_first_battle_of_el_alamein(Start,End)), generate_facts_deaths_in_2016_OR_first_battle_of_el_alamein(Tail).

deaths_in_2016_OR_first_battle_of_el_alamein_aux() :- findall((Start,End),deaths_in_2016(Start,End),Interval1), findall((Start,End),first_battle_of_el_alamein(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_deaths_in_2016_OR_first_battle_of_el_alamein(Interval).

deaths_in_2016_OR_first_battle_of_el_alamein_at_1868(Res) :- setof((Start,End),deaths_in_2016_OR_first_battle_of_el_alamein(Start,End),AllINtervals), checkvalidity(1868,AllINtervals,Res).

check_query() :- write('Query = deaths_in_2016_OR_first_battle_of_el_alamein_at_1868'), (deaths_in_2016_OR_first_battle_of_el_alamein_at_1868(true) -> write('\nRes   = true');write('\nRes   = false')).
?- deaths_in_2016_OR_first_battle_of_el_alamein_aux().

