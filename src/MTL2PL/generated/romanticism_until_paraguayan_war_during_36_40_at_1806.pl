:- include('database.pl').
romanticism(Start,End) :- begin('romanticism',_,_,Start), end('romanticism',_,_,End), Start=<End.

paraguayan_war(Start,End) :- begin('paraguayan_war',_,_,Start), end('paraguayan_war',_,_,End), Start=<End.

romanticism_last_till_36_40(Start,End) :- romanticism(Start1,End1), (End1-Start1)>=36, Start is (Start1+36), End is (End1+1).

romanticism_until_paraguayan_war_during_36_40_overlap(Start,End) :- romanticism_last_till_36_40(Start1,End1), paraguayan_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

romanticism_until_paraguayan_war_during_36_40(Start,End) :- romanticism(W1,_), romanticism_until_paraguayan_war_during_36_40_overlap(Start1,End1), Start is max((Start1-40),W1), End is (End1-36), Start=<End.

romanticism_until_paraguayan_war_during_36_40_at_1806(Res) :- setof((Start,End),romanticism_until_paraguayan_war_during_36_40(Start,End),AllINtervals), checkvalidity(1806,AllINtervals,Res).

check_query() :- write('Query = romanticism_until_paraguayan_war_during_36_40_at_1806'), (romanticism_until_paraguayan_war_during_36_40_at_1806(true) -> write('\nRes   = true');write('\nRes   = false')).

