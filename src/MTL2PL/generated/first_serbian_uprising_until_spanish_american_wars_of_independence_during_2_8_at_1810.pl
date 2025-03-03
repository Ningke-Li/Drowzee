:- include('database.pl').
first_serbian_uprising(Start,End) :- begin('first_serbian_uprising',_,_,Start), end('first_serbian_uprising',_,_,End), Start=<End.

spanish_american_wars_of_independence(Start,End) :- begin('spanish_american_wars_of_independence',_,_,Start), end('spanish_american_wars_of_independence',_,_,End), Start=<End.

first_serbian_uprising_last_till_2_8(Start,End) :- first_serbian_uprising(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

first_serbian_uprising_until_spanish_american_wars_of_independence_during_2_8_overlap(Start,End) :- first_serbian_uprising_last_till_2_8(Start1,End1), spanish_american_wars_of_independence(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

first_serbian_uprising_until_spanish_american_wars_of_independence_during_2_8(Start,End) :- first_serbian_uprising(W1,_), first_serbian_uprising_until_spanish_american_wars_of_independence_during_2_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-2), Start=<End.

first_serbian_uprising_until_spanish_american_wars_of_independence_during_2_8_at_1810(Res) :- setof((Start,End),first_serbian_uprising_until_spanish_american_wars_of_independence_during_2_8(Start,End),AllINtervals), checkvalidity(1810,AllINtervals,Res).

check_query() :- write('Query = first_serbian_uprising_until_spanish_american_wars_of_independence_during_2_8_at_1810'), (first_serbian_uprising_until_spanish_american_wars_of_independence_during_2_8_at_1810(true) -> write('\nRes   = true');write('\nRes   = false')).

