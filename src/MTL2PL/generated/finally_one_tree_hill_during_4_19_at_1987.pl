:- include('database.pl').
one_tree_hill(Start,End) :- begin('one_tree_hill',_,_,Start), end('one_tree_hill',_,_,End), Start=<End.

finally_one_tree_hill_during_4_19(Start,End) :- one_tree_hill(Start1,End1), (Start1-19)=<(End1-4), Start is (Start1-19), End is (End1-4), Start=<End.

finally_one_tree_hill_during_4_19_at_1987(Res) :- setof((Start,End),finally_one_tree_hill_during_4_19(Start,End),AllINtervals), checkvalidity(1987,AllINtervals,Res).

check_query() :- write('Query = finally_one_tree_hill_during_4_19_at_1987'), (finally_one_tree_hill_during_4_19_at_1987(true) -> write('\nRes   = true');write('\nRes   = false')).

