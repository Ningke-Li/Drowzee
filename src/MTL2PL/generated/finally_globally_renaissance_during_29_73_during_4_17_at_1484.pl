:- include('database.pl').
renaissance(Start,End) :- begin('renaissance',_,_,Start), end('renaissance',_,_,End), Start=<End.

globally_renaissance_during_29_73(Start,End) :- renaissance(Start1,End1), Start is (Start1-29), End is (End1-73), Start=<End.

finally_globally_renaissance_during_29_73_during_4_17(Start,End) :- globally_renaissance_during_29_73(Start1,End1), (Start1-17)=<(End1-4), Start is (Start1-17), End is (End1-4), Start=<End.

finally_globally_renaissance_during_29_73_during_4_17_at_1484(Res) :- setof((Start,End),finally_globally_renaissance_during_29_73_during_4_17(Start,End),AllINtervals), checkvalidity(1484,AllINtervals,Res).

check_query() :- write('Query = finally_globally_renaissance_during_29_73_during_4_17_at_1484'), (finally_globally_renaissance_during_29_73_during_4_17_at_1484(true) -> write('\nRes   = true');write('\nRes   = false')).

