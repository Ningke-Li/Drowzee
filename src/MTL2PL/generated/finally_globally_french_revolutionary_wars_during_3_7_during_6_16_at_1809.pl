:- include('database.pl').
french_revolutionary_wars(Start,End) :- begin('french_revolutionary_wars',_,_,Start), end('french_revolutionary_wars',_,_,End), Start=<End.

globally_french_revolutionary_wars_during_3_7(Start,End) :- french_revolutionary_wars(Start1,End1), Start is (Start1-3), End is (End1-7), Start=<End.

finally_globally_french_revolutionary_wars_during_3_7_during_6_16(Start,End) :- globally_french_revolutionary_wars_during_3_7(Start1,End1), (Start1-16)=<(End1-6), Start is (Start1-16), End is (End1-6), Start=<End.

finally_globally_french_revolutionary_wars_during_3_7_during_6_16_at_1809(Res) :- setof((Start,End),finally_globally_french_revolutionary_wars_during_3_7_during_6_16(Start,End),AllINtervals), checkvalidity(1809,AllINtervals,Res).

check_query() :- write('Query = finally_globally_french_revolutionary_wars_during_3_7_during_6_16_at_1809'), (finally_globally_french_revolutionary_wars_during_3_7_during_6_16_at_1809(true) -> write('\nRes   = true');write('\nRes   = false')).

