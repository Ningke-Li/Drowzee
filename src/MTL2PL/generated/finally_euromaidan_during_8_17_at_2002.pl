:- include('database.pl').
euromaidan(Start,End) :- begin('euromaidan',_,_,Start), end('euromaidan',_,_,End), Start=<End.

finally_euromaidan_during_8_17(Start,End) :- euromaidan(Start1,End1), (Start1-17)=<(End1-8), Start is (Start1-17), End is (End1-8), Start=<End.

finally_euromaidan_during_8_17_at_2002(Res) :- setof((Start,End),finally_euromaidan_during_8_17(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = finally_euromaidan_during_8_17_at_2002'), (finally_euromaidan_during_8_17_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).

