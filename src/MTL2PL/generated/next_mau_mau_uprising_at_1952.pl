:- include('database.pl').
mau_mau_uprising(Start,End) :- begin('mau_mau_uprising',_,_,Start), end('mau_mau_uprising',_,_,End), Start=<End.

next_mau_mau_uprising(Start,End) :- mau_mau_uprising(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_mau_mau_uprising_at_1952(Res) :- setof((Start,End),next_mau_mau_uprising(Start,End),AllINtervals), checkvalidity(1952,AllINtervals,Res).

check_query() :- write('Query = next_mau_mau_uprising_at_1952'), (next_mau_mau_uprising_at_1952(true) -> write('\nRes   = true');write('\nRes   = false')).

