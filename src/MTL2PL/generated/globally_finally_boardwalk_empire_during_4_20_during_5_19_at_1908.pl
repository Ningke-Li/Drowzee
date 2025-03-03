:- include('database.pl').
boardwalk_empire(Start,End) :- begin('boardwalk_empire',_,_,Start), end('boardwalk_empire',_,_,End), Start=<End.

finally_boardwalk_empire_during_4_20(Start,End) :- boardwalk_empire(Start1,End1), (Start1-20)=<(End1-4), Start is (Start1-20), End is (End1-4), Start=<End.

globally_finally_boardwalk_empire_during_4_20_during_5_19(Start,End) :- finally_boardwalk_empire_during_4_20(Start1,End1), Start is (Start1-5), End is (End1-19), Start=<End.

globally_finally_boardwalk_empire_during_4_20_during_5_19_at_1908(Res) :- setof((Start,End),globally_finally_boardwalk_empire_during_4_20_during_5_19(Start,End),AllINtervals), checkvalidity(1908,AllINtervals,Res).

check_query() :- write('Query = globally_finally_boardwalk_empire_during_4_20_during_5_19_at_1908'), (globally_finally_boardwalk_empire_during_4_20_during_5_19_at_1908(true) -> write('\nRes   = true');write('\nRes   = false')).

