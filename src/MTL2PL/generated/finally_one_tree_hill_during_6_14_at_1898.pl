:- include('database.pl').
one_tree_hill(Start,End) :- begin('one_tree_hill',_,_,Start), end('one_tree_hill',_,_,End), Start=<End.

finally_one_tree_hill_during_6_14(Start,End) :- one_tree_hill(Start1,End1), (Start1-14)=<(End1-6), Start is (Start1-14), End is (End1-6), Start=<End.

finally_one_tree_hill_during_6_14_at_1898(Res) :- setof((Start,End),finally_one_tree_hill_during_6_14(Start,End),AllINtervals), checkvalidity(1898,AllINtervals,Res).

check_query() :- write('Query = finally_one_tree_hill_during_6_14_at_1898'), (finally_one_tree_hill_during_6_14_at_1898(true) -> write('\nRes   = true');write('\nRes   = false')).

