:- include('database.pl').
siege_of_budapest(Start,End) :- begin('siege_of_budapest',_,_,Start), end('siege_of_budapest',_,_,End), Start=<End.

finally_siege_of_budapest_during_2_19(Start,End) :- siege_of_budapest(Start1,End1), (Start1-19)=<(End1-2), Start is (Start1-19), End is (End1-2), Start=<End.

finally_siege_of_budapest_during_2_19_at_1934(Res) :- setof((Start,End),finally_siege_of_budapest_during_2_19(Start,End),AllINtervals), checkvalidity(1934,AllINtervals,Res).

check_query() :- write('Query = finally_siege_of_budapest_during_2_19_at_1934'), (finally_siege_of_budapest_during_2_19_at_1934(true) -> write('\nRes   = true');write('\nRes   = false')).

