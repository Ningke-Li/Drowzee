:- include('database.pl').
oh_my_ghostess(Start,End) :- begin('oh_my_ghostess',_,_,Start), end('oh_my_ghostess',_,_,End), Start=<End.

the_suite_life_on_deck(Start,End) :- begin('the_suite_life_on_deck',_,_,Start), end('the_suite_life_on_deck',_,_,End), Start=<End.

generate_facts_oh_my_ghostess_OR_the_suite_life_on_deck([]) :- assert(oh_my_ghostess_OR_the_suite_life_on_deck(-1,-1)).

generate_facts_oh_my_ghostess_OR_the_suite_life_on_deck([(Start,End) | Tail]) :- assert(oh_my_ghostess_OR_the_suite_life_on_deck(Start,End)), generate_facts_oh_my_ghostess_OR_the_suite_life_on_deck(Tail).

oh_my_ghostess_OR_the_suite_life_on_deck_aux() :- findall((Start,End),oh_my_ghostess(Start,End),Interval1), findall((Start,End),the_suite_life_on_deck(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_oh_my_ghostess_OR_the_suite_life_on_deck(Interval).

oh_my_ghostess_OR_the_suite_life_on_deck_at_2020(Res) :- setof((Start,End),oh_my_ghostess_OR_the_suite_life_on_deck(Start,End),AllINtervals), checkvalidity(2020,AllINtervals,Res).

check_query() :- write('Query = oh_my_ghostess_OR_the_suite_life_on_deck_at_2020'), (oh_my_ghostess_OR_the_suite_life_on_deck_at_2020(true) -> write('\nRes   = true');write('\nRes   = false')).
?- oh_my_ghostess_OR_the_suite_life_on_deck_aux().

