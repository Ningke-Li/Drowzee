:- include('database.pl').
edo_period(Start,End) :- begin('edo_period',_,_,Start), end('edo_period',_,_,End), Start=<End.

globally_edo_period_during_4_254(Start,End) :- edo_period(Start1,End1), Start is (Start1-4), End is (End1-254), Start=<End.

finally_globally_edo_period_during_4_254_during_2_13(Start,End) :- globally_edo_period_during_4_254(Start1,End1), (Start1-13)=<(End1-2), Start is (Start1-13), End is (End1-2), Start=<End.

finally_globally_edo_period_during_4_254_during_2_13_at_1518(Res) :- setof((Start,End),finally_globally_edo_period_during_4_254_during_2_13(Start,End),AllINtervals), checkvalidity(1518,AllINtervals,Res).

check_query() :- write('Query = finally_globally_edo_period_during_4_254_during_2_13_at_1518'), (finally_globally_edo_period_during_4_254_during_2_13_at_1518(true) -> write('\nRes   = true');write('\nRes   = false')).

