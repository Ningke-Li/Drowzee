:- include('database.pl').
house_of_cards(Start,End) :- begin('house_of_cards',_,_,Start), end('house_of_cards',_,_,End), Start=<End.

compare_house_of_cards(Dir,house_of_cards(Start1,_),house_of_cards(Start2,_)) :- Start1=<Start2.

generate_neg_house_of_cards([]).

generate_neg_house_of_cards([(Start,End) | Tail]) :- assert(neg_house_of_cards(Start,End)), generate_neg_house_of_cards(Tail).

sort_house_of_cards(SortedIntervals) :- findall((Start,End),house_of_cards(Start,End),UnsortedIntervals), predsort(compare_house_of_cards,UnsortedIntervals,SortedIntervals).

generate_neg_house_of_cards_aux() :- sort_house_of_cards(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_house_of_cards(NegatedIntervals).

neg_house_of_cards_at_219(Res) :- setof((Start,End),neg_house_of_cards(Start,End),AllINtervals), checkvalidity(219,AllINtervals,Res).

check_query() :- write('Query = neg_house_of_cards_at_219'), (neg_house_of_cards_at_219(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_house_of_cards_aux().

