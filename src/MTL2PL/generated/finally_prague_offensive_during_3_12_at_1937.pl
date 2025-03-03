:- include('database.pl').
prague_offensive(Start,End) :- begin('prague_offensive',_,_,Start), end('prague_offensive',_,_,End), Start=<End.

finally_prague_offensive_during_3_12(Start,End) :- prague_offensive(Start1,End1), (Start1-12)=<(End1-3), Start is (Start1-12), End is (End1-3), Start=<End.

finally_prague_offensive_during_3_12_at_1937(Res) :- setof((Start,End),finally_prague_offensive_during_3_12(Start,End),AllINtervals), checkvalidity(1937,AllINtervals,Res).

check_query() :- write('Query = finally_prague_offensive_during_3_12_at_1937'), (finally_prague_offensive_during_3_12_at_1937(true) -> write('\nRes   = true');write('\nRes   = false')).

