:- include('database.pl').
hannah_montana(Start,End) :- begin('hannah_montana',_,_,Start), end('hannah_montana',_,_,End), Start=<End.

finally_hannah_montana_during_7_12(Start,End) :- hannah_montana(Start1,End1), (Start1-12)=<(End1-7), Start is (Start1-12), End is (End1-7), Start=<End.

globally_finally_hannah_montana_during_7_12_during_1_5(Start,End) :- finally_hannah_montana_during_7_12(Start1,End1), Start is (Start1-1), End is (End1-5), Start=<End.

globally_finally_hannah_montana_during_7_12_during_1_5_at_1994(Res) :- setof((Start,End),globally_finally_hannah_montana_during_7_12_during_1_5(Start,End),AllINtervals), checkvalidity(1994,AllINtervals,Res).

check_query() :- write('Query = globally_finally_hannah_montana_during_7_12_during_1_5_at_1994'), (globally_finally_hannah_montana_during_7_12_during_1_5_at_1994(true) -> write('\nRes   = true');write('\nRes   = false')).

