:- include('database.pl').
boardwalk_empire(Start,End) :- begin('boardwalk_empire',_,_,Start), end('boardwalk_empire',_,_,End), Start=<End.

globally_boardwalk_empire_during_1_3(Start,End) :- boardwalk_empire(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

globally_boardwalk_empire_during_1_3_at_1992(Res) :- setof((Start,End),globally_boardwalk_empire_during_1_3(Start,End),AllINtervals), checkvalidity(1992,AllINtervals,Res).

check_query() :- write('Query = globally_boardwalk_empire_during_1_3_at_1992'), (globally_boardwalk_empire_during_1_3_at_1992(true) -> write('\nRes   = true');write('\nRes   = false')).

