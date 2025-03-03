:- include('database.pl').
ducktales(Start,End) :- begin('ducktales',_,_,Start), end('ducktales',_,_,End), Start=<End.

finally_ducktales_during_6_12(Start,End) :- ducktales(Start1,End1), (Start1-12)=<(End1-6), Start is (Start1-12), End is (End1-6), Start=<End.

finally_ducktales_during_6_12_at_1942(Res) :- setof((Start,End),finally_ducktales_during_6_12(Start,End),AllINtervals), checkvalidity(1942,AllINtervals,Res).

check_query() :- write('Query = finally_ducktales_during_6_12_at_1942'), (finally_ducktales_during_6_12_at_1942(true) -> write('\nRes   = true');write('\nRes   = false')).

