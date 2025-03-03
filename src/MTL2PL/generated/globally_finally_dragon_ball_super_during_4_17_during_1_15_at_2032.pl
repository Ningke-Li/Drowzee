:- include('database.pl').
dragon_ball_super(Start,End) :- begin('dragon_ball_super',_,_,Start), end('dragon_ball_super',_,_,End), Start=<End.

finally_dragon_ball_super_during_4_17(Start,End) :- dragon_ball_super(Start1,End1), (Start1-17)=<(End1-4), Start is (Start1-17), End is (End1-4), Start=<End.

globally_finally_dragon_ball_super_during_4_17_during_1_15(Start,End) :- finally_dragon_ball_super_during_4_17(Start1,End1), Start is (Start1-1), End is (End1-15), Start=<End.

globally_finally_dragon_ball_super_during_4_17_during_1_15_at_2032(Res) :- setof((Start,End),globally_finally_dragon_ball_super_during_4_17_during_1_15(Start,End),AllINtervals), checkvalidity(2032,AllINtervals,Res).

check_query() :- write('Query = globally_finally_dragon_ball_super_during_4_17_during_1_15_at_2032'), (globally_finally_dragon_ball_super_during_4_17_during_1_15_at_2032(true) -> write('\nRes   = true');write('\nRes   = false')).

