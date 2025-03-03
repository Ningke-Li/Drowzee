:- include('database.pl').
denazification(Start,End) :- begin('denazification',_,_,Start), end('denazification',_,_,End), Start=<End.

finally_denazification_during_1_18(Start,End) :- denazification(Start1,End1), (Start1-18)=<(End1-1), Start is (Start1-18), End is (End1-1), Start=<End.

globally_finally_denazification_during_1_18_during_14_23(Start,End) :- finally_denazification_during_1_18(Start1,End1), Start is (Start1-14), End is (End1-23), Start=<End.

globally_finally_denazification_during_1_18_during_14_23_at_1922(Res) :- setof((Start,End),globally_finally_denazification_during_1_18_during_14_23(Start,End),AllINtervals), checkvalidity(1922,AllINtervals,Res).

check_query() :- write('Query = globally_finally_denazification_during_1_18_during_14_23_at_1922'), (globally_finally_denazification_during_1_18_during_14_23_at_1922(true) -> write('\nRes   = true');write('\nRes   = false')).

