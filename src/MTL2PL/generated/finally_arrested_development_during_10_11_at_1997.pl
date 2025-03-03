:- include('database.pl').
arrested_development(Start,End) :- begin('arrested_development',_,_,Start), end('arrested_development',_,_,End), Start=<End.

finally_arrested_development_during_10_11(Start,End) :- arrested_development(Start1,End1), (Start1-11)=<(End1-10), Start is (Start1-11), End is (End1-10), Start=<End.

finally_arrested_development_during_10_11_at_1997(Res) :- setof((Start,End),finally_arrested_development_during_10_11(Start,End),AllINtervals), checkvalidity(1997,AllINtervals,Res).

check_query() :- write('Query = finally_arrested_development_during_10_11_at_1997'), (finally_arrested_development_during_10_11_at_1997(true) -> write('\nRes   = true');write('\nRes   = false')).

