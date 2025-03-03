:- include('database.pl').
peseta(Start,End) :- begin('peseta',_,_,Start), end('peseta',_,_,End), Start=<End.

finally_peseta_during_1_18(Start,End) :- peseta(Start1,End1), (Start1-18)=<(End1-1), Start is (Start1-18), End is (End1-1), Start=<End.

next_finally_peseta_during_1_18(Start,End) :- finally_peseta_during_1_18(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_peseta_during_1_18_at_1983(Res) :- setof((Start,End),next_finally_peseta_during_1_18(Start,End),AllINtervals), checkvalidity(1983,AllINtervals,Res).

check_query() :- write('Query = next_finally_peseta_during_1_18_at_1983'), (next_finally_peseta_during_1_18_at_1983(true) -> write('\nRes   = true');write('\nRes   = false')).

