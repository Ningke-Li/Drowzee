:- include('database.pl').
persecution_of_homosexuals_in_nazi_germany(Start,End) :- begin('persecution_of_homosexuals_in_nazi_germany',_,_,Start), end('persecution_of_homosexuals_in_nazi_germany',_,_,End), Start=<End.

finally_persecution_of_homosexuals_in_nazi_germany_during_7_18(Start,End) :- persecution_of_homosexuals_in_nazi_germany(Start1,End1), (Start1-18)=<(End1-7), Start is (Start1-18), End is (End1-7), Start=<End.

finally_persecution_of_homosexuals_in_nazi_germany_during_7_18_at_1833(Res) :- setof((Start,End),finally_persecution_of_homosexuals_in_nazi_germany_during_7_18(Start,End),AllINtervals), checkvalidity(1833,AllINtervals,Res).

check_query() :- write('Query = finally_persecution_of_homosexuals_in_nazi_germany_during_7_18_at_1833'), (finally_persecution_of_homosexuals_in_nazi_germany_during_7_18_at_1833(true) -> write('\nRes   = true');write('\nRes   = false')).

