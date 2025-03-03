:- include('database.pl').
underground_railroad(Start,End) :- begin('underground_railroad',_,_,Start), end('underground_railroad',_,_,End), Start=<End.

globally_underground_railroad_during_7_35(Start,End) :- underground_railroad(Start1,End1), Start is (Start1-7), End is (End1-35), Start=<End.

finally_globally_underground_railroad_during_7_35_during_1_13(Start,End) :- globally_underground_railroad_during_7_35(Start1,End1), (Start1-13)=<(End1-1), Start is (Start1-13), End is (End1-1), Start=<End.

finally_globally_underground_railroad_during_7_35_during_1_13_at_1780(Res) :- setof((Start,End),finally_globally_underground_railroad_during_7_35_during_1_13(Start,End),AllINtervals), checkvalidity(1780,AllINtervals,Res).

check_query() :- write('Query = finally_globally_underground_railroad_during_7_35_during_1_13_at_1780'), (finally_globally_underground_railroad_during_7_35_during_1_13_at_1780(true) -> write('\nRes   = true');write('\nRes   = false')).

