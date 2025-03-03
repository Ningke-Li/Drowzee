:- include('database.pl').
franklin_s_lost_expedition(Start,End) :- begin('franklin_s_lost_expedition',_,_,Start), end('franklin_s_lost_expedition',_,_,End), Start=<End.

globally_franklin_s_lost_expedition_during_1_3(Start,End) :- franklin_s_lost_expedition(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

globally_franklin_s_lost_expedition_during_1_3_at_1845(Res) :- setof((Start,End),globally_franklin_s_lost_expedition_during_1_3(Start,End),AllINtervals), checkvalidity(1845,AllINtervals,Res).

check_query() :- write('Query = globally_franklin_s_lost_expedition_during_1_3_at_1845'), (globally_franklin_s_lost_expedition_during_1_3_at_1845(true) -> write('\nRes   = true');write('\nRes   = false')).

