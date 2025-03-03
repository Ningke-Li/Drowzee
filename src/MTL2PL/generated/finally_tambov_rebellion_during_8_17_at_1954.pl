:- include('database.pl').
tambov_rebellion(Start,End) :- begin('tambov_rebellion',_,_,Start), end('tambov_rebellion',_,_,End), Start=<End.

finally_tambov_rebellion_during_8_17(Start,End) :- tambov_rebellion(Start1,End1), (Start1-17)=<(End1-8), Start is (Start1-17), End is (End1-8), Start=<End.

finally_tambov_rebellion_during_8_17_at_1954(Res) :- setof((Start,End),finally_tambov_rebellion_during_8_17(Start,End),AllINtervals), checkvalidity(1954,AllINtervals,Res).

check_query() :- write('Query = finally_tambov_rebellion_during_8_17_at_1954'), (finally_tambov_rebellion_during_8_17_at_1954(true) -> write('\nRes   = true');write('\nRes   = false')).

