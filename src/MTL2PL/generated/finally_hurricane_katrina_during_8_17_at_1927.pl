:- include('database.pl').
hurricane_katrina(Start,End) :- begin('hurricane_katrina',_,_,Start), end('hurricane_katrina',_,_,End), Start=<End.

finally_hurricane_katrina_during_8_17(Start,End) :- hurricane_katrina(Start1,End1), (Start1-17)=<(End1-8), Start is (Start1-17), End is (End1-8), Start=<End.

finally_hurricane_katrina_during_8_17_at_1927(Res) :- setof((Start,End),finally_hurricane_katrina_during_8_17(Start,End),AllINtervals), checkvalidity(1927,AllINtervals,Res).

check_query() :- write('Query = finally_hurricane_katrina_during_8_17_at_1927'), (finally_hurricane_katrina_during_8_17_at_1927(true) -> write('\nRes   = true');write('\nRes   = false')).

