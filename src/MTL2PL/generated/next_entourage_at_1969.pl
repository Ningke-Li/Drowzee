:- include('database.pl').
entourage(Start,End) :- begin('entourage',_,_,Start), end('entourage',_,_,End), Start=<End.

next_entourage(Start,End) :- entourage(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_entourage_at_1969(Res) :- setof((Start,End),next_entourage(Start,End),AllINtervals), checkvalidity(1969,AllINtervals,Res).

check_query() :- write('Query = next_entourage_at_1969'), (next_entourage_at_1969(true) -> write('\nRes   = true');write('\nRes   = false')).

