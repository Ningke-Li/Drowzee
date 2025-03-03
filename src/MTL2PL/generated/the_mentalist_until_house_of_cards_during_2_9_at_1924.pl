:- include('database.pl').
the_mentalist(Start,End) :- begin('the_mentalist',_,_,Start), end('the_mentalist',_,_,End), Start=<End.

house_of_cards(Start,End) :- begin('house_of_cards',_,_,Start), end('house_of_cards',_,_,End), Start=<End.

the_mentalist_last_till_2_9(Start,End) :- the_mentalist(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

the_mentalist_until_house_of_cards_during_2_9_overlap(Start,End) :- the_mentalist_last_till_2_9(Start1,End1), house_of_cards(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_mentalist_until_house_of_cards_during_2_9(Start,End) :- the_mentalist(W1,_), the_mentalist_until_house_of_cards_during_2_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-2), Start=<End.

the_mentalist_until_house_of_cards_during_2_9_at_1924(Res) :- setof((Start,End),the_mentalist_until_house_of_cards_during_2_9(Start,End),AllINtervals), checkvalidity(1924,AllINtervals,Res).

check_query() :- write('Query = the_mentalist_until_house_of_cards_during_2_9_at_1924'), (the_mentalist_until_house_of_cards_during_2_9_at_1924(true) -> write('\nRes   = true');write('\nRes   = false')).

