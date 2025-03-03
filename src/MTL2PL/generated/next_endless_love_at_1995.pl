:- include('database.pl').
endless_love(Start,End) :- begin('endless_love',_,_,Start), end('endless_love',_,_,End), Start=<End.

next_endless_love(Start,End) :- endless_love(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_endless_love_at_1995(Res) :- setof((Start,End),next_endless_love(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = next_endless_love_at_1995'), (next_endless_love_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).

