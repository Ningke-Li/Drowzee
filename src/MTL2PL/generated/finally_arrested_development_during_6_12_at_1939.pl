:- include('database.pl').
arrested_development(Start,End) :- begin('arrested_development',_,_,Start), end('arrested_development',_,_,End), Start=<End.

finally_arrested_development_during_6_12(Start,End) :- arrested_development(Start1,End1), (Start1-12)=<(End1-6), Start is (Start1-12), End is (End1-6), Start=<End.

finally_arrested_development_during_6_12_at_1939(Res) :- setof((Start,End),finally_arrested_development_during_6_12(Start,End),AllINtervals), checkvalidity(1939,AllINtervals,Res).

check_query() :- write('Query = finally_arrested_development_during_6_12_at_1939'), (finally_arrested_development_during_6_12_at_1939(true) -> write('\nRes   = true');write('\nRes   = false')).

