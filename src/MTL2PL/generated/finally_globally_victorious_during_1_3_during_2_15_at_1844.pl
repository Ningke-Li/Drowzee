:- include('database.pl').
victorious(Start,End) :- begin('victorious',_,_,Start), end('victorious',_,_,End), Start=<End.

globally_victorious_during_1_3(Start,End) :- victorious(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

finally_globally_victorious_during_1_3_during_2_15(Start,End) :- globally_victorious_during_1_3(Start1,End1), (Start1-15)=<(End1-2), Start is (Start1-15), End is (End1-2), Start=<End.

finally_globally_victorious_during_1_3_during_2_15_at_1844(Res) :- setof((Start,End),finally_globally_victorious_during_1_3_during_2_15(Start,End),AllINtervals), checkvalidity(1844,AllINtervals,Res).

check_query() :- write('Query = finally_globally_victorious_during_1_3_during_2_15_at_1844'), (finally_globally_victorious_during_1_3_during_2_15_at_1844(true) -> write('\nRes   = true');write('\nRes   = false')).

