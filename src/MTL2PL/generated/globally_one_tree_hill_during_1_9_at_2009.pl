:- include('database.pl').
one_tree_hill(Start,End) :- begin('one_tree_hill',_,_,Start), end('one_tree_hill',_,_,End), Start=<End.

globally_one_tree_hill_during_1_9(Start,End) :- one_tree_hill(Start1,End1), Start is (Start1-1), End is (End1-9), Start=<End.

globally_one_tree_hill_during_1_9_at_2009(Res) :- setof((Start,End),globally_one_tree_hill_during_1_9(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = globally_one_tree_hill_during_1_9_at_2009'), (globally_one_tree_hill_during_1_9_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

