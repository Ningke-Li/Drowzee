:- include('database.pl').
house_of_cards(Start,End) :- begin('house_of_cards',_,_,Start), end('house_of_cards',_,_,End), Start=<End.

next_house_of_cards(Start,End) :- house_of_cards(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_house_of_cards_at_2012(Res) :- setof((Start,End),next_house_of_cards(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = next_house_of_cards_at_2012'), (next_house_of_cards_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

