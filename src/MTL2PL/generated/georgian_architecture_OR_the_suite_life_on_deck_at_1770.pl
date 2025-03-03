:- include('database.pl').
georgian_architecture(Start,End) :- begin('georgian_architecture',_,_,Start), end('georgian_architecture',_,_,End), Start=<End.

the_suite_life_on_deck(Start,End) :- begin('the_suite_life_on_deck',_,_,Start), end('the_suite_life_on_deck',_,_,End), Start=<End.

generate_facts_georgian_architecture_OR_the_suite_life_on_deck([]) :- assert(georgian_architecture_OR_the_suite_life_on_deck(-1,-1)).

generate_facts_georgian_architecture_OR_the_suite_life_on_deck([(Start,End) | Tail]) :- assert(georgian_architecture_OR_the_suite_life_on_deck(Start,End)), generate_facts_georgian_architecture_OR_the_suite_life_on_deck(Tail).

georgian_architecture_OR_the_suite_life_on_deck_aux() :- findall((Start,End),georgian_architecture(Start,End),Interval1), findall((Start,End),the_suite_life_on_deck(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_georgian_architecture_OR_the_suite_life_on_deck(Interval).

georgian_architecture_OR_the_suite_life_on_deck_at_1770(Res) :- setof((Start,End),georgian_architecture_OR_the_suite_life_on_deck(Start,End),AllINtervals), checkvalidity(1770,AllINtervals,Res).

check_query() :- write('Query = georgian_architecture_OR_the_suite_life_on_deck_at_1770'), (georgian_architecture_OR_the_suite_life_on_deck_at_1770(true) -> write('\nRes   = true');write('\nRes   = false')).
?- georgian_architecture_OR_the_suite_life_on_deck_aux().

