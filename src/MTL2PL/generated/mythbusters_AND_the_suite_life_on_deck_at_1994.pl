:- include('database.pl').
mythbusters(Start,End) :- begin('mythbusters',_,_,Start), end('mythbusters',_,_,End), Start=<End.

the_suite_life_on_deck(Start,End) :- begin('the_suite_life_on_deck',_,_,Start), end('the_suite_life_on_deck',_,_,End), Start=<End.

generate_facts_mythbusters_AND_the_suite_life_on_deck([]) :- assert(mythbusters_AND_the_suite_life_on_deck(-1,-1)).

generate_facts_mythbusters_AND_the_suite_life_on_deck([(Start,End) | Tail]) :- assert(mythbusters_AND_the_suite_life_on_deck(Start,End)), generate_facts_mythbusters_AND_the_suite_life_on_deck(Tail).

mythbusters_AND_the_suite_life_on_deck_aux() :- findall((Start,End),mythbusters(Start,End),Interval1), findall((Start,End),the_suite_life_on_deck(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_mythbusters_AND_the_suite_life_on_deck(Interval).

mythbusters_AND_the_suite_life_on_deck_at_1994(Res) :- setof((Start,End),mythbusters_AND_the_suite_life_on_deck(Start,End),AllINtervals), checkvalidity(1994,AllINtervals,Res).

check_query() :- write('Query = mythbusters_AND_the_suite_life_on_deck_at_1994'), (mythbusters_AND_the_suite_life_on_deck_at_1994(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mythbusters_AND_the_suite_life_on_deck_aux().

