:- include('database.pl').
persecution_of_homosexuals_in_nazi_germany(Start,End) :- begin('persecution_of_homosexuals_in_nazi_germany',_,_,Start), end('persecution_of_homosexuals_in_nazi_germany',_,_,End), Start=<End.

next_persecution_of_homosexuals_in_nazi_germany(Start,End) :- persecution_of_homosexuals_in_nazi_germany(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_persecution_of_homosexuals_in_nazi_germany_at_1991(Res) :- setof((Start,End),next_persecution_of_homosexuals_in_nazi_germany(Start,End),AllINtervals), checkvalidity(1991,AllINtervals,Res).

check_query() :- write('Query = next_persecution_of_homosexuals_in_nazi_germany_at_1991'), (next_persecution_of_homosexuals_in_nazi_germany_at_1991(true) -> write('\nRes   = true');write('\nRes   = false')).

