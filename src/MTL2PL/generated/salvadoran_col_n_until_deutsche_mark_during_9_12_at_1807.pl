:- include('database.pl').
salvadoran_col_n(Start,End) :- begin('salvadoran_col_n',_,_,Start), end('salvadoran_col_n',_,_,End), Start=<End.

deutsche_mark(Start,End) :- begin('deutsche_mark',_,_,Start), end('deutsche_mark',_,_,End), Start=<End.

salvadoran_col_n_last_till_9_12(Start,End) :- salvadoran_col_n(Start1,End1), (End1-Start1)>=9, Start is (Start1+9), End is (End1+1).

salvadoran_col_n_until_deutsche_mark_during_9_12_overlap(Start,End) :- salvadoran_col_n_last_till_9_12(Start1,End1), deutsche_mark(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

salvadoran_col_n_until_deutsche_mark_during_9_12(Start,End) :- salvadoran_col_n(W1,_), salvadoran_col_n_until_deutsche_mark_during_9_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-9), Start=<End.

salvadoran_col_n_until_deutsche_mark_during_9_12_at_1807(Res) :- setof((Start,End),salvadoran_col_n_until_deutsche_mark_during_9_12(Start,End),AllINtervals), checkvalidity(1807,AllINtervals,Res).

check_query() :- write('Query = salvadoran_col_n_until_deutsche_mark_during_9_12_at_1807'), (salvadoran_col_n_until_deutsche_mark_during_9_12_at_1807(true) -> write('\nRes   = true');write('\nRes   = false')).

