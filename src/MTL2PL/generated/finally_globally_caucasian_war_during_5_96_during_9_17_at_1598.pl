:- include('database.pl').
caucasian_war(Start,End) :- begin('caucasian_war',_,_,Start), end('caucasian_war',_,_,End), Start=<End.

globally_caucasian_war_during_5_96(Start,End) :- caucasian_war(Start1,End1), Start is (Start1-5), End is (End1-96), Start=<End.

finally_globally_caucasian_war_during_5_96_during_9_17(Start,End) :- globally_caucasian_war_during_5_96(Start1,End1), (Start1-17)=<(End1-9), Start is (Start1-17), End is (End1-9), Start=<End.

finally_globally_caucasian_war_during_5_96_during_9_17_at_1598(Res) :- setof((Start,End),finally_globally_caucasian_war_during_5_96_during_9_17(Start,End),AllINtervals), checkvalidity(1598,AllINtervals,Res).

check_query() :- write('Query = finally_globally_caucasian_war_during_5_96_during_9_17_at_1598'), (finally_globally_caucasian_war_during_5_96_during_9_17_at_1598(true) -> write('\nRes   = true');write('\nRes   = false')).

