:- include('database.pl').
northern_seven_years__war(Start,End) :- begin('northern_seven_years__war',_,_,Start), end('northern_seven_years__war',_,_,End), Start=<End.

finally_northern_seven_years__war_during_7_12(Start,End) :- northern_seven_years__war(Start1,End1), (Start1-12)=<(End1-7), Start is (Start1-12), End is (End1-7), Start=<End.

finally_northern_seven_years__war_during_7_12_at_1581(Res) :- setof((Start,End),finally_northern_seven_years__war_during_7_12(Start,End),AllINtervals), checkvalidity(1581,AllINtervals,Res).

check_query() :- write('Query = finally_northern_seven_years__war_during_7_12_at_1581'), (finally_northern_seven_years__war_during_7_12_at_1581(true) -> write('\nRes   = true');write('\nRes   = false')).

