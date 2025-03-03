:- include('database.pl').
paris_peace_conference(Start,End) :- begin('paris_peace_conference',_,_,Start), end('paris_peace_conference',_,_,End), Start=<End.

finally_paris_peace_conference_during_3_13(Start,End) :- paris_peace_conference(Start1,End1), (Start1-13)=<(End1-3), Start is (Start1-13), End is (End1-3), Start=<End.

finally_paris_peace_conference_during_3_13_at_1907(Res) :- setof((Start,End),finally_paris_peace_conference_during_3_13(Start,End),AllINtervals), checkvalidity(1907,AllINtervals,Res).

check_query() :- write('Query = finally_paris_peace_conference_during_3_13_at_1907'), (finally_paris_peace_conference_during_3_13_at_1907(true) -> write('\nRes   = true');write('\nRes   = false')).

