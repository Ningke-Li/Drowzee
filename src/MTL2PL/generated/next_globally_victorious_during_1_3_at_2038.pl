:- include('database.pl').
victorious(Start,End) :- begin('victorious',_,_,Start), end('victorious',_,_,End), Start=<End.

globally_victorious_during_1_3(Start,End) :- victorious(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

next_globally_victorious_during_1_3(Start,End) :- globally_victorious_during_1_3(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_victorious_during_1_3_at_2038(Res) :- setof((Start,End),next_globally_victorious_during_1_3(Start,End),AllINtervals), checkvalidity(2038,AllINtervals,Res).

check_query() :- write('Query = next_globally_victorious_during_1_3_at_2038'), (next_globally_victorious_during_1_3_at_2038(true) -> write('\nRes   = true');write('\nRes   = false')).

