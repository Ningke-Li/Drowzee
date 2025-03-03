:- include('database.pl').
siege_of_belgrade(Start,End) :- begin('siege_of_belgrade',_,_,Start), end('siege_of_belgrade',_,_,End), Start=<End.

finally_siege_of_belgrade_during_1_14(Start,End) :- siege_of_belgrade(Start1,End1), (Start1-14)=<(End1-1), Start is (Start1-14), End is (End1-1), Start=<End.

finally_siege_of_belgrade_during_1_14_at_1450(Res) :- setof((Start,End),finally_siege_of_belgrade_during_1_14(Start,End),AllINtervals), checkvalidity(1450,AllINtervals,Res).

check_query() :- write('Query = finally_siege_of_belgrade_during_1_14_at_1450'), (finally_siege_of_belgrade_during_1_14_at_1450(true) -> write('\nRes   = true');write('\nRes   = false')).

