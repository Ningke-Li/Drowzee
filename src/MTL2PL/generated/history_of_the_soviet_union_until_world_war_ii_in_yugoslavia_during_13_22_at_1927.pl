:- include('database.pl').
history_of_the_soviet_union(Start,End) :- begin('history_of_the_soviet_union',_,_,Start), end('history_of_the_soviet_union',_,_,End), Start=<End.

world_war_ii_in_yugoslavia(Start,End) :- begin('world_war_ii_in_yugoslavia',_,_,Start), end('world_war_ii_in_yugoslavia',_,_,End), Start=<End.

history_of_the_soviet_union_last_till_13_22(Start,End) :- history_of_the_soviet_union(Start1,End1), (End1-Start1)>=13, Start is (Start1+13), End is (End1+1).

history_of_the_soviet_union_until_world_war_ii_in_yugoslavia_during_13_22_overlap(Start,End) :- history_of_the_soviet_union_last_till_13_22(Start1,End1), world_war_ii_in_yugoslavia(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

history_of_the_soviet_union_until_world_war_ii_in_yugoslavia_during_13_22(Start,End) :- history_of_the_soviet_union(W1,_), history_of_the_soviet_union_until_world_war_ii_in_yugoslavia_during_13_22_overlap(Start1,End1), Start is max((Start1-22),W1), End is (End1-13), Start=<End.

history_of_the_soviet_union_until_world_war_ii_in_yugoslavia_during_13_22_at_1927(Res) :- setof((Start,End),history_of_the_soviet_union_until_world_war_ii_in_yugoslavia_during_13_22(Start,End),AllINtervals), checkvalidity(1927,AllINtervals,Res).

check_query() :- write('Query = history_of_the_soviet_union_until_world_war_ii_in_yugoslavia_during_13_22_at_1927'), (history_of_the_soviet_union_until_world_war_ii_in_yugoslavia_during_13_22_at_1927(true) -> write('\nRes   = true');write('\nRes   = false')).

