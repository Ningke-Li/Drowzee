:- include('database.pl').
persecution_of_homosexuals_in_nazi_germany(Start,End) :- begin('persecution_of_homosexuals_in_nazi_germany',_,_,Start), end('persecution_of_homosexuals_in_nazi_germany',_,_,End), Start=<End.

finally_persecution_of_homosexuals_in_nazi_germany_during_9_17(Start,End) :- persecution_of_homosexuals_in_nazi_germany(Start1,End1), (Start1-17)=<(End1-9), Start is (Start1-17), End is (End1-9), Start=<End.

finally_persecution_of_homosexuals_in_nazi_germany_during_9_17_at_1813(Res) :- setof((Start,End),finally_persecution_of_homosexuals_in_nazi_germany_during_9_17(Start,End),AllINtervals), checkvalidity(1813,AllINtervals,Res).

check_query() :- write('Query = finally_persecution_of_homosexuals_in_nazi_germany_during_9_17_at_1813'), (finally_persecution_of_homosexuals_in_nazi_germany_during_9_17_at_1813(true) -> write('\nRes   = true');write('\nRes   = false')).

