:- include('database.pl').
northern_expedition(Start,End) :- begin('northern_expedition',_,_,Start), end('northern_expedition',_,_,End), Start=<End.

finally_northern_expedition_during_3_18(Start,End) :- northern_expedition(Start1,End1), (Start1-18)=<(End1-3), Start is (Start1-18), End is (End1-3), Start=<End.

finally_northern_expedition_during_3_18_at_1924(Res) :- setof((Start,End),finally_northern_expedition_during_3_18(Start,End),AllINtervals), checkvalidity(1924,AllINtervals,Res).

check_query() :- write('Query = finally_northern_expedition_during_3_18_at_1924'), (finally_northern_expedition_during_3_18_at_1924(true) -> write('\nRes   = true');write('\nRes   = false')).

