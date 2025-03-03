:- include('database.pl').
three_hundred_and_thirty_five_years__war(Start,End) :- begin('three_hundred_and_thirty_five_years__war',_,_,Start), end('three_hundred_and_thirty_five_years__war',_,_,End), Start=<End.

salvadoran_col_n(Start,End) :- begin('salvadoran_col_n',_,_,Start), end('salvadoran_col_n',_,_,End), Start=<End.

three_hundred_and_thirty_five_years__war_last_till_42_46(Start,End) :- three_hundred_and_thirty_five_years__war(Start1,End1), (End1-Start1)>=42, Start is (Start1+42), End is (End1+1).

three_hundred_and_thirty_five_years__war_until_salvadoran_col_n_during_42_46_overlap(Start,End) :- three_hundred_and_thirty_five_years__war_last_till_42_46(Start1,End1), salvadoran_col_n(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

three_hundred_and_thirty_five_years__war_until_salvadoran_col_n_during_42_46(Start,End) :- three_hundred_and_thirty_five_years__war(W1,_), three_hundred_and_thirty_five_years__war_until_salvadoran_col_n_during_42_46_overlap(Start1,End1), Start is max((Start1-46),W1), End is (End1-42), Start=<End.

three_hundred_and_thirty_five_years__war_until_salvadoran_col_n_during_42_46_at_1897(Res) :- setof((Start,End),three_hundred_and_thirty_five_years__war_until_salvadoran_col_n_during_42_46(Start,End),AllINtervals), checkvalidity(1897,AllINtervals,Res).

check_query() :- write('Query = three_hundred_and_thirty_five_years__war_until_salvadoran_col_n_during_42_46_at_1897'), (three_hundred_and_thirty_five_years__war_until_salvadoran_col_n_during_42_46_at_1897(true) -> write('\nRes   = true');write('\nRes   = false')).

