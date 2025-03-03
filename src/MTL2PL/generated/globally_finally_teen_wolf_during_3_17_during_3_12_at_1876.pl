:- include('database.pl').
teen_wolf(Start,End) :- begin('teen_wolf',_,_,Start), end('teen_wolf',_,_,End), Start=<End.

finally_teen_wolf_during_3_17(Start,End) :- teen_wolf(Start1,End1), (Start1-17)=<(End1-3), Start is (Start1-17), End is (End1-3), Start=<End.

globally_finally_teen_wolf_during_3_17_during_3_12(Start,End) :- finally_teen_wolf_during_3_17(Start1,End1), Start is (Start1-3), End is (End1-12), Start=<End.

globally_finally_teen_wolf_during_3_17_during_3_12_at_1876(Res) :- setof((Start,End),globally_finally_teen_wolf_during_3_17_during_3_12(Start,End),AllINtervals), checkvalidity(1876,AllINtervals,Res).

check_query() :- write('Query = globally_finally_teen_wolf_during_3_17_during_3_12_at_1876'), (globally_finally_teen_wolf_during_3_17_during_3_12_at_1876(true) -> write('\nRes   = true');write('\nRes   = false')).

