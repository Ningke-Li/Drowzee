:- include('database.pl').
little_britain(Start,End) :- begin('little_britain',_,_,Start), end('little_britain',_,_,End), Start=<End.

finally_little_britain_during_8_17(Start,End) :- little_britain(Start1,End1), (Start1-17)=<(End1-8), Start is (Start1-17), End is (End1-8), Start=<End.

finally_little_britain_during_8_17_at_2029(Res) :- setof((Start,End),finally_little_britain_during_8_17(Start,End),AllINtervals), checkvalidity(2029,AllINtervals,Res).

check_query() :- write('Query = finally_little_britain_during_8_17_at_2029'), (finally_little_britain_during_8_17_at_2029(true) -> write('\nRes   = true');write('\nRes   = false')).

