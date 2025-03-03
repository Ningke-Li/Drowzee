:- include('database.pl').
drake___josh(Start,End) :- begin('drake___josh',_,_,Start), end('drake___josh',_,_,End), Start=<End.

next_drake___josh(Start,End) :- drake___josh(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_drake___josh_at_1887(Res) :- setof((Start,End),next_drake___josh(Start,End),AllINtervals), checkvalidity(1887,AllINtervals,Res).

check_query() :- write('Query = next_drake___josh_at_1887'), (next_drake___josh_at_1887(true) -> write('\nRes   = true');write('\nRes   = false')).

