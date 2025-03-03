:- include('database.pl').
franklin_s_lost_expedition(Start,End) :- begin('franklin_s_lost_expedition',_,_,Start), end('franklin_s_lost_expedition',_,_,End), Start=<End.

globally_franklin_s_lost_expedition_during_1_2(Start,End) :- franklin_s_lost_expedition(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

next_globally_franklin_s_lost_expedition_during_1_2(Start,End) :- globally_franklin_s_lost_expedition_during_1_2(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_franklin_s_lost_expedition_during_1_2_at_1844(Res) :- setof((Start,End),next_globally_franklin_s_lost_expedition_during_1_2(Start,End),AllINtervals), checkvalidity(1844,AllINtervals,Res).

check_query() :- write('Query = next_globally_franklin_s_lost_expedition_during_1_2_at_1844'), (next_globally_franklin_s_lost_expedition_during_1_2_at_1844(true) -> write('\nRes   = true');write('\nRes   = false')).

