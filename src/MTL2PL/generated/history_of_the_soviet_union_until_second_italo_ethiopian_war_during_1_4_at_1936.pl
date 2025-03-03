:- include('database.pl').
history_of_the_soviet_union(Start,End) :- begin('history_of_the_soviet_union',_,_,Start), end('history_of_the_soviet_union',_,_,End), Start=<End.

second_italo_ethiopian_war(Start,End) :- begin('second_italo_ethiopian_war',_,_,Start), end('second_italo_ethiopian_war',_,_,End), Start=<End.

history_of_the_soviet_union_last_till_1_4(Start,End) :- history_of_the_soviet_union(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

history_of_the_soviet_union_until_second_italo_ethiopian_war_during_1_4_overlap(Start,End) :- history_of_the_soviet_union_last_till_1_4(Start1,End1), second_italo_ethiopian_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

history_of_the_soviet_union_until_second_italo_ethiopian_war_during_1_4(Start,End) :- history_of_the_soviet_union(W1,_), history_of_the_soviet_union_until_second_italo_ethiopian_war_during_1_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-1), Start=<End.

history_of_the_soviet_union_until_second_italo_ethiopian_war_during_1_4_at_1936(Res) :- setof((Start,End),history_of_the_soviet_union_until_second_italo_ethiopian_war_during_1_4(Start,End),AllINtervals), checkvalidity(1936,AllINtervals,Res).

check_query() :- write('Query = history_of_the_soviet_union_until_second_italo_ethiopian_war_during_1_4_at_1936'), (history_of_the_soviet_union_until_second_italo_ethiopian_war_during_1_4_at_1936(true) -> write('\nRes   = true');write('\nRes   = false')).

