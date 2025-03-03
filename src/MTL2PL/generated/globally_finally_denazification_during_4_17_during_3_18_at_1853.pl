:- include('database.pl').
denazification(Start,End) :- begin('denazification',_,_,Start), end('denazification',_,_,End), Start=<End.

finally_denazification_during_4_17(Start,End) :- denazification(Start1,End1), (Start1-17)=<(End1-4), Start is (Start1-17), End is (End1-4), Start=<End.

globally_finally_denazification_during_4_17_during_3_18(Start,End) :- finally_denazification_during_4_17(Start1,End1), Start is (Start1-3), End is (End1-18), Start=<End.

globally_finally_denazification_during_4_17_during_3_18_at_1853(Res) :- setof((Start,End),globally_finally_denazification_during_4_17_during_3_18(Start,End),AllINtervals), checkvalidity(1853,AllINtervals,Res).

check_query() :- write('Query = globally_finally_denazification_during_4_17_during_3_18_at_1853'), (globally_finally_denazification_during_4_17_during_3_18_at_1853(true) -> write('\nRes   = true');write('\nRes   = false')).

