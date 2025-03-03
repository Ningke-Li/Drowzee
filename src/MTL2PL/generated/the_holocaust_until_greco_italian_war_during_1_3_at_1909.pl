:- include('database.pl').
the_holocaust(Start,End) :- begin('the_holocaust',_,_,Start), end('the_holocaust',_,_,End), Start=<End.

greco_italian_war(Start,End) :- begin('greco_italian_war',_,_,Start), end('greco_italian_war',_,_,End), Start=<End.

the_holocaust_last_till_1_3(Start,End) :- the_holocaust(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

the_holocaust_until_greco_italian_war_during_1_3_overlap(Start,End) :- the_holocaust_last_till_1_3(Start1,End1), greco_italian_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_holocaust_until_greco_italian_war_during_1_3(Start,End) :- the_holocaust(W1,_), the_holocaust_until_greco_italian_war_during_1_3_overlap(Start1,End1), Start is max((Start1-3),W1), End is (End1-1), Start=<End.

the_holocaust_until_greco_italian_war_during_1_3_at_1909(Res) :- setof((Start,End),the_holocaust_until_greco_italian_war_during_1_3(Start,End),AllINtervals), checkvalidity(1909,AllINtervals,Res).

check_query() :- write('Query = the_holocaust_until_greco_italian_war_during_1_3_at_1909'), (the_holocaust_until_greco_italian_war_during_1_3_at_1909(true) -> write('\nRes   = true');write('\nRes   = false')).

