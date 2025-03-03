:- include('database.pl').
icarly(Start,End) :- begin('icarly',_,_,Start), end('icarly',_,_,End), Start=<End.

globally_icarly_during_3_4(Start,End) :- icarly(Start1,End1), Start is (Start1-3), End is (End1-4), Start=<End.

finally_globally_icarly_during_3_4_during_10_20(Start,End) :- globally_icarly_during_3_4(Start1,End1), (Start1-20)=<(End1-10), Start is (Start1-20), End is (End1-10), Start=<End.

finally_globally_icarly_during_3_4_during_10_20_at_1890(Res) :- setof((Start,End),finally_globally_icarly_during_3_4_during_10_20(Start,End),AllINtervals), checkvalidity(1890,AllINtervals,Res).

check_query() :- write('Query = finally_globally_icarly_during_3_4_during_10_20_at_1890'), (finally_globally_icarly_during_3_4_during_10_20_at_1890(true) -> write('\nRes   = true');write('\nRes   = false')).

