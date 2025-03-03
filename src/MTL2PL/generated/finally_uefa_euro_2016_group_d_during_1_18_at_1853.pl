:- include('database.pl').
uefa_euro_2016_group_d(Start,End) :- begin('uefa_euro_2016_group_d',_,_,Start), end('uefa_euro_2016_group_d',_,_,End), Start=<End.

finally_uefa_euro_2016_group_d_during_1_18(Start,End) :- uefa_euro_2016_group_d(Start1,End1), (Start1-18)=<(End1-1), Start is (Start1-18), End is (End1-1), Start=<End.

finally_uefa_euro_2016_group_d_during_1_18_at_1853(Res) :- setof((Start,End),finally_uefa_euro_2016_group_d_during_1_18(Start,End),AllINtervals), checkvalidity(1853,AllINtervals,Res).

check_query() :- write('Query = finally_uefa_euro_2016_group_d_during_1_18_at_1853'), (finally_uefa_euro_2016_group_d_during_1_18_at_1853(true) -> write('\nRes   = true');write('\nRes   = false')).

