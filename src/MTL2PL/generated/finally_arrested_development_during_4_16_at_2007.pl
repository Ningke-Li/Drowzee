:- include('database.pl').
arrested_development(Start,End) :- begin('arrested_development',_,_,Start), end('arrested_development',_,_,End), Start=<End.

finally_arrested_development_during_4_16(Start,End) :- arrested_development(Start1,End1), (Start1-16)=<(End1-4), Start is (Start1-16), End is (End1-4), Start=<End.

finally_arrested_development_during_4_16_at_2007(Res) :- setof((Start,End),finally_arrested_development_during_4_16(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = finally_arrested_development_during_4_16_at_2007'), (finally_arrested_development_during_4_16_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).

