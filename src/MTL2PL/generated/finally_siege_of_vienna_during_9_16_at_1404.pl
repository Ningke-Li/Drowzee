:- include('database.pl').
siege_of_vienna(Start,End) :- begin('siege_of_vienna',_,_,Start), end('siege_of_vienna',_,_,End), Start=<End.

finally_siege_of_vienna_during_9_16(Start,End) :- siege_of_vienna(Start1,End1), (Start1-16)=<(End1-9), Start is (Start1-16), End is (End1-9), Start=<End.

finally_siege_of_vienna_during_9_16_at_1404(Res) :- setof((Start,End),finally_siege_of_vienna_during_9_16(Start,End),AllINtervals), checkvalidity(1404,AllINtervals,Res).

check_query() :- write('Query = finally_siege_of_vienna_during_9_16_at_1404'), (finally_siege_of_vienna_during_9_16_at_1404(true) -> write('\nRes   = true');write('\nRes   = false')).

