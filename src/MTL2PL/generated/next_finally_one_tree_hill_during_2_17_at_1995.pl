:- include('database.pl').
one_tree_hill(Start,End) :- begin('one_tree_hill',_,_,Start), end('one_tree_hill',_,_,End), Start=<End.

finally_one_tree_hill_during_2_17(Start,End) :- one_tree_hill(Start1,End1), (Start1-17)=<(End1-2), Start is (Start1-17), End is (End1-2), Start=<End.

next_finally_one_tree_hill_during_2_17(Start,End) :- finally_one_tree_hill_during_2_17(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_one_tree_hill_during_2_17_at_1995(Res) :- setof((Start,End),next_finally_one_tree_hill_during_2_17(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = next_finally_one_tree_hill_during_2_17_at_1995'), (next_finally_one_tree_hill_during_2_17_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).

