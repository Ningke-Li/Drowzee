:- include('database.pl').
hurricane_sandy(Start,End) :- begin('hurricane_sandy',_,_,Start), end('hurricane_sandy',_,_,End), Start=<End.

next_hurricane_sandy(Start,End) :- hurricane_sandy(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_hurricane_sandy_at_2059(Res) :- setof((Start,End),next_hurricane_sandy(Start,End),AllINtervals), checkvalidity(2059,AllINtervals,Res).

check_query() :- write('Query = next_hurricane_sandy_at_2059'), (next_hurricane_sandy_at_2059(true) -> write('\nRes   = true');write('\nRes   = false')).

