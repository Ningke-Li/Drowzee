:- include('database.pl').
pugachev_s_rebellion(Start,End) :- begin('pugachev_s_rebellion',_,_,Start), end('pugachev_s_rebellion',_,_,End), Start=<End.

finally_pugachev_s_rebellion_during_10_15(Start,End) :- pugachev_s_rebellion(Start1,End1), (Start1-15)=<(End1-10), Start is (Start1-15), End is (End1-10), Start=<End.

finally_pugachev_s_rebellion_during_10_15_at_1643(Res) :- setof((Start,End),finally_pugachev_s_rebellion_during_10_15(Start,End),AllINtervals), checkvalidity(1643,AllINtervals,Res).

check_query() :- write('Query = finally_pugachev_s_rebellion_during_10_15_at_1643'), (finally_pugachev_s_rebellion_during_10_15_at_1643(true) -> write('\nRes   = true');write('\nRes   = false')).

