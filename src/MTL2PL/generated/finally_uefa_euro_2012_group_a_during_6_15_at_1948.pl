:- include('database.pl').
uefa_euro_2012_group_a(Start,End) :- begin('uefa_euro_2012_group_a',_,_,Start), end('uefa_euro_2012_group_a',_,_,End), Start=<End.

finally_uefa_euro_2012_group_a_during_6_15(Start,End) :- uefa_euro_2012_group_a(Start1,End1), (Start1-15)=<(End1-6), Start is (Start1-15), End is (End1-6), Start=<End.

finally_uefa_euro_2012_group_a_during_6_15_at_1948(Res) :- setof((Start,End),finally_uefa_euro_2012_group_a_during_6_15(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = finally_uefa_euro_2012_group_a_during_6_15_at_1948'), (finally_uefa_euro_2012_group_a_during_6_15_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).

