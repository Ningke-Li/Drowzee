:- include('database.pl').
georgian_architecture(Start,End) :- begin('georgian_architecture',_,_,Start), end('georgian_architecture',_,_,End), Start=<End.

finally_georgian_architecture_during_9_17(Start,End) :- georgian_architecture(Start1,End1), (Start1-17)=<(End1-9), Start is (Start1-17), End is (End1-9), Start=<End.

globally_finally_georgian_architecture_during_9_17_during_31_89(Start,End) :- finally_georgian_architecture_during_9_17(Start1,End1), Start is (Start1-31), End is (End1-89), Start=<End.

globally_finally_georgian_architecture_during_9_17_during_31_89_at_1552(Res) :- setof((Start,End),globally_finally_georgian_architecture_during_9_17_during_31_89(Start,End),AllINtervals), checkvalidity(1552,AllINtervals,Res).

check_query() :- write('Query = globally_finally_georgian_architecture_during_9_17_during_31_89_at_1552'), (globally_finally_georgian_architecture_during_9_17_during_31_89_at_1552(true) -> write('\nRes   = true');write('\nRes   = false')).

