:- include('database.pl').
uefa_euro_2012_group_b(Start,End) :- begin('uefa_euro_2012_group_b',_,_,Start), end('uefa_euro_2012_group_b',_,_,End), Start=<End.

finally_uefa_euro_2012_group_b_during_2_15(Start,End) :- uefa_euro_2012_group_b(Start1,End1), (Start1-15)=<(End1-2), Start is (Start1-15), End is (End1-2), Start=<End.

finally_uefa_euro_2012_group_b_during_2_15_at_2010(Res) :- setof((Start,End),finally_uefa_euro_2012_group_b_during_2_15(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = finally_uefa_euro_2012_group_b_during_2_15_at_2010'), (finally_uefa_euro_2012_group_b_during_2_15_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).

