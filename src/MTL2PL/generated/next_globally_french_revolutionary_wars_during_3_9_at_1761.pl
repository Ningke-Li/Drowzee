:- include('database.pl').
french_revolutionary_wars(Start,End) :- begin('french_revolutionary_wars',_,_,Start), end('french_revolutionary_wars',_,_,End), Start=<End.

globally_french_revolutionary_wars_during_3_9(Start,End) :- french_revolutionary_wars(Start1,End1), Start is (Start1-3), End is (End1-9), Start=<End.

next_globally_french_revolutionary_wars_during_3_9(Start,End) :- globally_french_revolutionary_wars_during_3_9(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_french_revolutionary_wars_during_3_9_at_1761(Res) :- setof((Start,End),next_globally_french_revolutionary_wars_during_3_9(Start,End),AllINtervals), checkvalidity(1761,AllINtervals,Res).

check_query() :- write('Query = next_globally_french_revolutionary_wars_during_3_9_at_1761'), (next_globally_french_revolutionary_wars_during_3_9_at_1761(true) -> write('\nRes   = true');write('\nRes   = false')).

