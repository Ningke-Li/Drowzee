:- include('database.pl').
ozark(Start,End) :- begin('ozark',_,_,Start), end('ozark',_,_,End), Start=<End.

next_ozark(Start,End) :- ozark(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ozark_at_2020(Res) :- setof((Start,End),next_ozark(Start,End),AllINtervals), checkvalidity(2020,AllINtervals,Res).

check_query() :- write('Query = next_ozark_at_2020'), (next_ozark_at_2020(true) -> write('\nRes   = true');write('\nRes   = false')).

