:- include('database.pl').
french_revolution(Start,End) :- begin('french_revolution',_,_,Start), end('french_revolution',_,_,End), Start=<End.

finally_french_revolution_during_5_13(Start,End) :- french_revolution(Start1,End1), (Start1-13)=<(End1-5), Start is (Start1-13), End is (End1-5), Start=<End.

finally_french_revolution_during_5_13_at_1777(Res) :- setof((Start,End),finally_french_revolution_during_5_13(Start,End),AllINtervals), checkvalidity(1777,AllINtervals,Res).

check_query() :- write('Query = finally_french_revolution_during_5_13_at_1777'), (finally_french_revolution_during_5_13_at_1777(true) -> write('\nRes   = true');write('\nRes   = false')).

