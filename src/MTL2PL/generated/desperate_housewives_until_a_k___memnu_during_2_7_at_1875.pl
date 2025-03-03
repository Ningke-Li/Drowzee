:- include('database.pl').
desperate_housewives(Start,End) :- begin('desperate_housewives',_,_,Start), end('desperate_housewives',_,_,End), Start=<End.

a_k___memnu(Start,End) :- begin('a_k___memnu',_,_,Start), end('a_k___memnu',_,_,End), Start=<End.

desperate_housewives_last_till_2_7(Start,End) :- desperate_housewives(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

desperate_housewives_until_a_k___memnu_during_2_7_overlap(Start,End) :- desperate_housewives_last_till_2_7(Start1,End1), a_k___memnu(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

desperate_housewives_until_a_k___memnu_during_2_7(Start,End) :- desperate_housewives(W1,_), desperate_housewives_until_a_k___memnu_during_2_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-2), Start=<End.

desperate_housewives_until_a_k___memnu_during_2_7_at_1875(Res) :- setof((Start,End),desperate_housewives_until_a_k___memnu_during_2_7(Start,End),AllINtervals), checkvalidity(1875,AllINtervals,Res).

check_query() :- write('Query = desperate_housewives_until_a_k___memnu_during_2_7_at_1875'), (desperate_housewives_until_a_k___memnu_during_2_7_at_1875(true) -> write('\nRes   = true');write('\nRes   = false')).

