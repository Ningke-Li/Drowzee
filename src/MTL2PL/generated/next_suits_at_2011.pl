:- include('database.pl').
suits(Start,End) :- begin('suits',_,_,Start), end('suits',_,_,End), Start=<End.

next_suits(Start,End) :- suits(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_suits_at_2011(Res) :- setof((Start,End),next_suits(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = next_suits_at_2011'), (next_suits_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

