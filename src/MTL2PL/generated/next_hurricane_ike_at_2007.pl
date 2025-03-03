:- include('database.pl').
hurricane_ike(Start,End) :- begin('hurricane_ike',_,_,Start), end('hurricane_ike',_,_,End), Start=<End.

next_hurricane_ike(Start,End) :- hurricane_ike(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_hurricane_ike_at_2007(Res) :- setof((Start,End),next_hurricane_ike(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = next_hurricane_ike_at_2007'), (next_hurricane_ike_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).

