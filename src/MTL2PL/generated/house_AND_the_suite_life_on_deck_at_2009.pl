:- include('database.pl').
house(Start,End) :- begin('house',_,_,Start), end('house',_,_,End), Start=<End.

the_suite_life_on_deck(Start,End) :- begin('the_suite_life_on_deck',_,_,Start), end('the_suite_life_on_deck',_,_,End), Start=<End.

generate_facts_house_AND_the_suite_life_on_deck([]) :- assert(house_AND_the_suite_life_on_deck(-1,-1)).

generate_facts_house_AND_the_suite_life_on_deck([(Start,End) | Tail]) :- assert(house_AND_the_suite_life_on_deck(Start,End)), generate_facts_house_AND_the_suite_life_on_deck(Tail).

house_AND_the_suite_life_on_deck_aux() :- findall((Start,End),house(Start,End),Interval1), findall((Start,End),the_suite_life_on_deck(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_house_AND_the_suite_life_on_deck(Interval).

house_AND_the_suite_life_on_deck_at_2009(Res) :- setof((Start,End),house_AND_the_suite_life_on_deck(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = house_AND_the_suite_life_on_deck_at_2009'), (house_AND_the_suite_life_on_deck_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- house_AND_the_suite_life_on_deck_aux().

