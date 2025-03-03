:- include('database.pl').
victorious(Start,End) :- begin('victorious',_,_,Start), end('victorious',_,_,End), Start=<End.

finally_victorious_during_5_11(Start,End) :- victorious(Start1,End1), (Start1-11)=<(End1-5), Start is (Start1-11), End is (End1-5), Start=<End.

globally_finally_victorious_during_5_11_during_3_8(Start,End) :- finally_victorious_during_5_11(Start1,End1), Start is (Start1-3), End is (End1-8), Start=<End.

globally_finally_victorious_during_5_11_during_3_8_at_1999(Res) :- setof((Start,End),globally_finally_victorious_during_5_11_during_3_8(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = globally_finally_victorious_during_5_11_during_3_8_at_1999'), (globally_finally_victorious_during_5_11_during_3_8_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).

