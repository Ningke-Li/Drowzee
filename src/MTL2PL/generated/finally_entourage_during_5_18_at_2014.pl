:- include('database.pl').
entourage(Start,End) :- begin('entourage',_,_,Start), end('entourage',_,_,End), Start=<End.

finally_entourage_during_5_18(Start,End) :- entourage(Start1,End1), (Start1-18)=<(End1-5), Start is (Start1-18), End is (End1-5), Start=<End.

finally_entourage_during_5_18_at_2014(Res) :- setof((Start,End),finally_entourage_during_5_18(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = finally_entourage_during_5_18_at_2014'), (finally_entourage_during_5_18_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).

