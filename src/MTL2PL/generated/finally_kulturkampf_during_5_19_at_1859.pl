:- include('database.pl').
kulturkampf(Start,End) :- begin('kulturkampf',_,_,Start), end('kulturkampf',_,_,End), Start=<End.

finally_kulturkampf_during_5_19(Start,End) :- kulturkampf(Start1,End1), (Start1-19)=<(End1-5), Start is (Start1-19), End is (End1-5), Start=<End.

finally_kulturkampf_during_5_19_at_1859(Res) :- setof((Start,End),finally_kulturkampf_during_5_19(Start,End),AllINtervals), checkvalidity(1859,AllINtervals,Res).

check_query() :- write('Query = finally_kulturkampf_during_5_19_at_1859'), (finally_kulturkampf_during_5_19_at_1859(true) -> write('\nRes   = true');write('\nRes   = false')).

