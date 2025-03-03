:- include('database.pl').
manueline(Start,End) :- begin('manueline',_,_,Start), end('manueline',_,_,End), Start=<End.

finally_manueline_during_5_19(Start,End) :- manueline(Start1,End1), (Start1-19)=<(End1-5), Start is (Start1-19), End is (End1-5), Start=<End.

next_finally_manueline_during_5_19(Start,End) :- finally_manueline_during_5_19(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_manueline_during_5_19_at_1486(Res) :- setof((Start,End),next_finally_manueline_during_5_19(Start,End),AllINtervals), checkvalidity(1486,AllINtervals,Res).

check_query() :- write('Query = next_finally_manueline_during_5_19_at_1486'), (next_finally_manueline_during_5_19_at_1486(true) -> write('\nRes   = true');write('\nRes   = false')).

