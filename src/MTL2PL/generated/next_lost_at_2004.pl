:- include('database.pl').
lost(Start,End) :- begin('lost',_,_,Start), end('lost',_,_,End), Start=<End.

next_lost(Start,End) :- lost(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_lost_at_2004(Res) :- setof((Start,End),next_lost(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = next_lost_at_2004'), (next_lost_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).

