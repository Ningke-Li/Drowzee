:- include('database.pl').
wirtschaftswunder(Start,End) :- begin('wirtschaftswunder',_,_,Start), end('wirtschaftswunder',_,_,End), Start=<End.

globally_wirtschaftswunder_during_4_14(Start,End) :- wirtschaftswunder(Start1,End1), Start is (Start1-4), End is (End1-14), Start=<End.

finally_globally_wirtschaftswunder_during_4_14_during_8_15(Start,End) :- globally_wirtschaftswunder_during_4_14(Start1,End1), (Start1-15)=<(End1-8), Start is (Start1-15), End is (End1-8), Start=<End.

finally_globally_wirtschaftswunder_during_4_14_during_8_15_at_1816(Res) :- setof((Start,End),finally_globally_wirtschaftswunder_during_4_14_during_8_15(Start,End),AllINtervals), checkvalidity(1816,AllINtervals,Res).

check_query() :- write('Query = finally_globally_wirtschaftswunder_during_4_14_during_8_15_at_1816'), (finally_globally_wirtschaftswunder_during_4_14_during_8_15_at_1816(true) -> write('\nRes   = true');write('\nRes   = false')).

