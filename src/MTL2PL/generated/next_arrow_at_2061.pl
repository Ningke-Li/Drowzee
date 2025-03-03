:- include('database.pl').
arrow(Start,End) :- begin('arrow',_,_,Start), end('arrow',_,_,End), Start=<End.

next_arrow(Start,End) :- arrow(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_arrow_at_2061(Res) :- setof((Start,End),next_arrow(Start,End),AllINtervals), checkvalidity(2061,AllINtervals,Res).

check_query() :- write('Query = next_arrow_at_2061'), (next_arrow_at_2061(true) -> write('\nRes   = true');write('\nRes   = false')).

