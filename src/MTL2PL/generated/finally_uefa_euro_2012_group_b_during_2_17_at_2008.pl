:- include('database.pl').
uefa_euro_2012_group_b(Start,End) :- begin('uefa_euro_2012_group_b',_,_,Start), end('uefa_euro_2012_group_b',_,_,End), Start=<End.

finally_uefa_euro_2012_group_b_during_2_17(Start,End) :- uefa_euro_2012_group_b(Start1,End1), (Start1-17)=<(End1-2), Start is (Start1-17), End is (End1-2), Start=<End.

finally_uefa_euro_2012_group_b_during_2_17_at_2008(Res) :- setof((Start,End),finally_uefa_euro_2012_group_b_during_2_17(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = finally_uefa_euro_2012_group_b_during_2_17_at_2008'), (finally_uefa_euro_2012_group_b_during_2_17_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

