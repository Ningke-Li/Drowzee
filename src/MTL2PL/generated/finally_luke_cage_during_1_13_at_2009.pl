:- include('database.pl').
luke_cage(Start,End) :- begin('luke_cage',_,_,Start), end('luke_cage',_,_,End), Start=<End.

finally_luke_cage_during_1_13(Start,End) :- luke_cage(Start1,End1), (Start1-13)=<(End1-1), Start is (Start1-13), End is (End1-1), Start=<End.

finally_luke_cage_during_1_13_at_2009(Res) :- setof((Start,End),finally_luke_cage_during_1_13(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = finally_luke_cage_during_1_13_at_2009'), (finally_luke_cage_during_1_13_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

