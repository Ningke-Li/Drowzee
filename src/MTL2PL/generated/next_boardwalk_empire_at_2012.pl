:- include('database.pl').
boardwalk_empire(Start,End) :- begin('boardwalk_empire',_,_,Start), end('boardwalk_empire',_,_,End), Start=<End.

next_boardwalk_empire(Start,End) :- boardwalk_empire(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_boardwalk_empire_at_2012(Res) :- setof((Start,End),next_boardwalk_empire(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = next_boardwalk_empire_at_2012'), (next_boardwalk_empire_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

