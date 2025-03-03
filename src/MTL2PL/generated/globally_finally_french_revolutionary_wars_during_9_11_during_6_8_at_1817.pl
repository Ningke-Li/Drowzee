:- include('database.pl').
french_revolutionary_wars(Start,End) :- begin('french_revolutionary_wars',_,_,Start), end('french_revolutionary_wars',_,_,End), Start=<End.

finally_french_revolutionary_wars_during_9_11(Start,End) :- french_revolutionary_wars(Start1,End1), (Start1-11)=<(End1-9), Start is (Start1-11), End is (End1-9), Start=<End.

globally_finally_french_revolutionary_wars_during_9_11_during_6_8(Start,End) :- finally_french_revolutionary_wars_during_9_11(Start1,End1), Start is (Start1-6), End is (End1-8), Start=<End.

globally_finally_french_revolutionary_wars_during_9_11_during_6_8_at_1817(Res) :- setof((Start,End),globally_finally_french_revolutionary_wars_during_9_11_during_6_8(Start,End),AllINtervals), checkvalidity(1817,AllINtervals,Res).

check_query() :- write('Query = globally_finally_french_revolutionary_wars_during_9_11_during_6_8_at_1817'), (globally_finally_french_revolutionary_wars_during_9_11_during_6_8_at_1817(true) -> write('\nRes   = true');write('\nRes   = false')).

