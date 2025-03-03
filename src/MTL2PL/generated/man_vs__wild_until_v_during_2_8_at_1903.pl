:- include('database.pl').
man_vs__wild(Start,End) :- begin('man_vs__wild',_,_,Start), end('man_vs__wild',_,_,End), Start=<End.

v(Start,End) :- begin('v',_,_,Start), end('v',_,_,End), Start=<End.

man_vs__wild_last_till_2_8(Start,End) :- man_vs__wild(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

man_vs__wild_until_v_during_2_8_overlap(Start,End) :- man_vs__wild_last_till_2_8(Start1,End1), v(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

man_vs__wild_until_v_during_2_8(Start,End) :- man_vs__wild(W1,_), man_vs__wild_until_v_during_2_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-2), Start=<End.

man_vs__wild_until_v_during_2_8_at_1903(Res) :- setof((Start,End),man_vs__wild_until_v_during_2_8(Start,End),AllINtervals), checkvalidity(1903,AllINtervals,Res).

check_query() :- write('Query = man_vs__wild_until_v_during_2_8_at_1903'), (man_vs__wild_until_v_during_2_8_at_1903(true) -> write('\nRes   = true');write('\nRes   = false')).

