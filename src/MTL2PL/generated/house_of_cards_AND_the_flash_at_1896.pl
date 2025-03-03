:- include('database.pl').
house_of_cards(Start,End) :- begin('house_of_cards',_,_,Start), end('house_of_cards',_,_,End), Start=<End.

the_flash(Start,End) :- begin('the_flash',_,_,Start), end('the_flash',_,_,End), Start=<End.

generate_facts_house_of_cards_AND_the_flash([]) :- assert(house_of_cards_AND_the_flash(-1,-1)).

generate_facts_house_of_cards_AND_the_flash([(Start,End) | Tail]) :- assert(house_of_cards_AND_the_flash(Start,End)), generate_facts_house_of_cards_AND_the_flash(Tail).

house_of_cards_AND_the_flash_aux() :- findall((Start,End),house_of_cards(Start,End),Interval1), findall((Start,End),the_flash(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_house_of_cards_AND_the_flash(Interval).

house_of_cards_AND_the_flash_at_1896(Res) :- setof((Start,End),house_of_cards_AND_the_flash(Start,End),AllINtervals), checkvalidity(1896,AllINtervals,Res).

check_query() :- write('Query = house_of_cards_AND_the_flash_at_1896'), (house_of_cards_AND_the_flash_at_1896(true) -> write('\nRes   = true');write('\nRes   = false')).
?- house_of_cards_AND_the_flash_aux().

