:- include('database.pl').
arrested_development(Start,End) :- begin('arrested_development',_,_,Start), end('arrested_development',_,_,End), Start=<End.

globally_arrested_development_during_7_15(Start,End) :- arrested_development(Start1,End1), Start is (Start1-7), End is (End1-15), Start=<End.

globally_arrested_development_during_7_15_at_1997(Res) :- setof((Start,End),globally_arrested_development_during_7_15(Start,End),AllINtervals), checkvalidity(1997,AllINtervals,Res).

check_query() :- write('Query = globally_arrested_development_during_7_15_at_1997'), (globally_arrested_development_during_7_15_at_1997(true) -> write('\nRes   = true');write('\nRes   = false')).

