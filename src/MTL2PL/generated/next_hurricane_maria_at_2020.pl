:- include('database.pl').
hurricane_maria(Start,End) :- begin('hurricane_maria',_,_,Start), end('hurricane_maria',_,_,End), Start=<End.

next_hurricane_maria(Start,End) :- hurricane_maria(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_hurricane_maria_at_2020(Res) :- setof((Start,End),next_hurricane_maria(Start,End),AllINtervals), checkvalidity(2020,AllINtervals,Res).

check_query() :- write('Query = next_hurricane_maria_at_2020'), (next_hurricane_maria_at_2020(true) -> write('\nRes   = true');write('\nRes   = false')).

