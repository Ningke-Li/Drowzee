:- include('database.pl').
the_suite_life_on_deck(Start,End) :- begin('the_suite_life_on_deck',_,_,Start), end('the_suite_life_on_deck',_,_,End), Start=<End.

a_k___memnu(Start,End) :- begin('a_k___memnu',_,_,Start), end('a_k___memnu',_,_,End), Start=<End.

generate_facts_the_suite_life_on_deck_AND_a_k___memnu([]) :- assert(the_suite_life_on_deck_AND_a_k___memnu(-1,-1)).

generate_facts_the_suite_life_on_deck_AND_a_k___memnu([(Start,End) | Tail]) :- assert(the_suite_life_on_deck_AND_a_k___memnu(Start,End)), generate_facts_the_suite_life_on_deck_AND_a_k___memnu(Tail).

the_suite_life_on_deck_AND_a_k___memnu_aux() :- findall((Start,End),the_suite_life_on_deck(Start,End),Interval1), findall((Start,End),a_k___memnu(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_suite_life_on_deck_AND_a_k___memnu(Interval).

the_suite_life_on_deck_AND_a_k___memnu_at_1971(Res) :- setof((Start,End),the_suite_life_on_deck_AND_a_k___memnu(Start,End),AllINtervals), checkvalidity(1971,AllINtervals,Res).

check_query() :- write('Query = the_suite_life_on_deck_AND_a_k___memnu_at_1971'), (the_suite_life_on_deck_AND_a_k___memnu_at_1971(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_suite_life_on_deck_AND_a_k___memnu_aux().

