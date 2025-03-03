:- include('database.pl').
august_2005(Start,End) :- begin('august_2005',_,_,Start), end('august_2005',_,_,End), Start=<End.

next_august_2005(Start,End) :- august_2005(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_august_2005_at_1969(Res) :- setof((Start,End),next_august_2005(Start,End),AllINtervals), checkvalidity(1969,AllINtervals,Res).

check_query() :- write('Query = next_august_2005_at_1969'), (next_august_2005_at_1969(true) -> write('\nRes   = true');write('\nRes   = false')).

