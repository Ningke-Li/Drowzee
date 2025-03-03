:- include('database.pl').
beslan_school_siege(Start,End) :- begin('beslan_school_siege',_,_,Start), end('beslan_school_siege',_,_,End), Start=<End.

finally_beslan_school_siege_during_9_18(Start,End) :- beslan_school_siege(Start1,End1), (Start1-18)=<(End1-9), Start is (Start1-18), End is (End1-9), Start=<End.

finally_beslan_school_siege_during_9_18_at_1951(Res) :- setof((Start,End),finally_beslan_school_siege_during_9_18(Start,End),AllINtervals), checkvalidity(1951,AllINtervals,Res).

check_query() :- write('Query = finally_beslan_school_siege_during_9_18_at_1951'), (finally_beslan_school_siege_during_9_18_at_1951(true) -> write('\nRes   = true');write('\nRes   = false')).

