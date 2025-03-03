:- include('database.pl').
georgian_architecture(Start,End) :- begin('georgian_architecture',_,_,Start), end('georgian_architecture',_,_,End), Start=<End.

finally_georgian_architecture_during_2_17(Start,End) :- georgian_architecture(Start1,End1), (Start1-17)=<(End1-2), Start is (Start1-17), End is (End1-2), Start=<End.

globally_finally_georgian_architecture_during_2_17_during_21_135(Start,End) :- finally_georgian_architecture_during_2_17(Start1,End1), Start is (Start1-21), End is (End1-135), Start=<End.

globally_finally_georgian_architecture_during_2_17_during_21_135_at_1700(Res) :- setof((Start,End),globally_finally_georgian_architecture_during_2_17_during_21_135(Start,End),AllINtervals), checkvalidity(1700,AllINtervals,Res).

check_query() :- write('Query = globally_finally_georgian_architecture_during_2_17_during_21_135_at_1700'), (globally_finally_georgian_architecture_during_2_17_during_21_135_at_1700(true) -> write('\nRes   = true');write('\nRes   = false')).

