:- include('database.pl').
french_franc(Start,End) :- begin('french_franc',_,_,Start), end('french_franc',_,_,End), Start=<End.

globally_french_franc_during_37_173(Start,End) :- french_franc(Start1,End1), Start is (Start1-37), End is (End1-173), Start=<End.

globally_french_franc_during_37_173_at_1757(Res) :- setof((Start,End),globally_french_franc_during_37_173(Start,End),AllINtervals), checkvalidity(1757,AllINtervals,Res).

check_query() :- write('Query = globally_french_franc_during_37_173_at_1757'), (globally_french_franc_during_37_173_at_1757(true) -> write('\nRes   = true');write('\nRes   = false')).

