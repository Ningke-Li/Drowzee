:- include('database.pl').
utc_00_44(Start,End) :- begin('utc_00_44',_,_,Start), end('utc_00_44',_,_,End), Start=<End.

house_of_cards(Start,End) :- begin('house_of_cards',_,_,Start), end('house_of_cards',_,_,End), Start=<End.

generate_facts_utc_00_44_OR_house_of_cards([]) :- assert(utc_00_44_OR_house_of_cards(-1,-1)).

generate_facts_utc_00_44_OR_house_of_cards([(Start,End) | Tail]) :- assert(utc_00_44_OR_house_of_cards(Start,End)), generate_facts_utc_00_44_OR_house_of_cards(Tail).

utc_00_44_OR_house_of_cards_aux() :- findall((Start,End),utc_00_44(Start,End),Interval1), findall((Start,End),house_of_cards(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_utc_00_44_OR_house_of_cards(Interval).

utc_00_44_OR_house_of_cards_at_1813(Res) :- setof((Start,End),utc_00_44_OR_house_of_cards(Start,End),AllINtervals), checkvalidity(1813,AllINtervals,Res).

check_query() :- write('Query = utc_00_44_OR_house_of_cards_at_1813'), (utc_00_44_OR_house_of_cards_at_1813(true) -> write('\nRes   = true');write('\nRes   = false')).
?- utc_00_44_OR_house_of_cards_aux().

