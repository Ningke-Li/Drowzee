:- include('database.pl').
euromaidan(Start,End) :- begin('euromaidan',_,_,Start), end('euromaidan',_,_,End), Start=<End.

next_euromaidan(Start,End) :- euromaidan(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_euromaidan_at_2013(Res) :- setof((Start,End),next_euromaidan(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = next_euromaidan_at_2013'), (next_euromaidan_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).

