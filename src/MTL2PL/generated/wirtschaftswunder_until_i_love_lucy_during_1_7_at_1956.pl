:- include('database.pl').
wirtschaftswunder(Start,End) :- begin('wirtschaftswunder',_,_,Start), end('wirtschaftswunder',_,_,End), Start=<End.

i_love_lucy(Start,End) :- begin('i_love_lucy',_,_,Start), end('i_love_lucy',_,_,End), Start=<End.

wirtschaftswunder_last_till_1_7(Start,End) :- wirtschaftswunder(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

wirtschaftswunder_until_i_love_lucy_during_1_7_overlap(Start,End) :- wirtschaftswunder_last_till_1_7(Start1,End1), i_love_lucy(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

wirtschaftswunder_until_i_love_lucy_during_1_7(Start,End) :- wirtschaftswunder(W1,_), wirtschaftswunder_until_i_love_lucy_during_1_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-1), Start=<End.

wirtschaftswunder_until_i_love_lucy_during_1_7_at_1956(Res) :- setof((Start,End),wirtschaftswunder_until_i_love_lucy_during_1_7(Start,End),AllINtervals), checkvalidity(1956,AllINtervals,Res).

check_query() :- write('Query = wirtschaftswunder_until_i_love_lucy_during_1_7_at_1956'), (wirtschaftswunder_until_i_love_lucy_during_1_7_at_1956(true) -> write('\nRes   = true');write('\nRes   = false')).

