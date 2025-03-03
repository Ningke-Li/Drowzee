:- include('database.pl').
siege_of_malta(Start,End) :- begin('siege_of_malta',_,_,Start), end('siege_of_malta',_,_,End), Start=<End.

finally_siege_of_malta_during_5_20(Start,End) :- siege_of_malta(Start1,End1), (Start1-20)=<(End1-5), Start is (Start1-20), End is (End1-5), Start=<End.

finally_siege_of_malta_during_5_20_at_1550(Res) :- setof((Start,End),finally_siege_of_malta_during_5_20(Start,End),AllINtervals), checkvalidity(1550,AllINtervals,Res).

check_query() :- write('Query = finally_siege_of_malta_during_5_20_at_1550'), (finally_siege_of_malta_during_5_20_at_1550(true) -> write('\nRes   = true');write('\nRes   = false')).

