:- include('database.pl').
chuck(Start,End) :- begin('chuck',_,_,Start), end('chuck',_,_,End), Start=<End.

finally_chuck_during_8_19(Start,End) :- chuck(Start1,End1), (Start1-19)=<(End1-8), Start is (Start1-19), End is (End1-8), Start=<End.

globally_finally_chuck_during_8_19_during_2_11(Start,End) :- finally_chuck_during_8_19(Start1,End1), Start is (Start1-2), End is (End1-11), Start=<End.

globally_finally_chuck_during_8_19_during_2_11_at_1991(Res) :- setof((Start,End),globally_finally_chuck_during_8_19_during_2_11(Start,End),AllINtervals), checkvalidity(1991,AllINtervals,Res).

check_query() :- write('Query = globally_finally_chuck_during_8_19_during_2_11_at_1991'), (globally_finally_chuck_during_8_19_during_2_11_at_1991(true) -> write('\nRes   = true');write('\nRes   = false')).

