:- include('database.pl').
sons_of_anarchy(Start,End) :- begin('sons_of_anarchy',_,_,Start), end('sons_of_anarchy',_,_,End), Start=<End.

finally_sons_of_anarchy_during_10_14(Start,End) :- sons_of_anarchy(Start1,End1), (Start1-14)=<(End1-10), Start is (Start1-14), End is (End1-10), Start=<End.

finally_sons_of_anarchy_during_10_14_at_1947(Res) :- setof((Start,End),finally_sons_of_anarchy_during_10_14(Start,End),AllINtervals), checkvalidity(1947,AllINtervals,Res).

check_query() :- write('Query = finally_sons_of_anarchy_during_10_14_at_1947'), (finally_sons_of_anarchy_during_10_14_at_1947(true) -> write('\nRes   = true');write('\nRes   = false')).

