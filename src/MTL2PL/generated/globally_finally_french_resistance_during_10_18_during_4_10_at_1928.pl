:- include('database.pl').
french_resistance(Start,End) :- begin('french_resistance',_,_,Start), end('french_resistance',_,_,End), Start=<End.

finally_french_resistance_during_10_18(Start,End) :- french_resistance(Start1,End1), (Start1-18)=<(End1-10), Start is (Start1-18), End is (End1-10), Start=<End.

globally_finally_french_resistance_during_10_18_during_4_10(Start,End) :- finally_french_resistance_during_10_18(Start1,End1), Start is (Start1-4), End is (End1-10), Start=<End.

globally_finally_french_resistance_during_10_18_during_4_10_at_1928(Res) :- setof((Start,End),globally_finally_french_resistance_during_10_18_during_4_10(Start,End),AllINtervals), checkvalidity(1928,AllINtervals,Res).

check_query() :- write('Query = globally_finally_french_resistance_during_10_18_during_4_10_at_1928'), (globally_finally_french_resistance_during_10_18_during_4_10_at_1928(true) -> write('\nRes   = true');write('\nRes   = false')).

