:- include('database.pl').
siege_of_yorktown(Start,End) :- begin('siege_of_yorktown',_,_,Start), end('siege_of_yorktown',_,_,End), Start=<End.

finally_siege_of_yorktown_during_1_16(Start,End) :- siege_of_yorktown(Start1,End1), (Start1-16)=<(End1-1), Start is (Start1-16), End is (End1-1), Start=<End.

finally_siege_of_yorktown_during_1_16_at_1771(Res) :- setof((Start,End),finally_siege_of_yorktown_during_1_16(Start,End),AllINtervals), checkvalidity(1771,AllINtervals,Res).

check_query() :- write('Query = finally_siege_of_yorktown_during_1_16_at_1771'), (finally_siege_of_yorktown_during_1_16_at_1771(true) -> write('\nRes   = true');write('\nRes   = false')).

