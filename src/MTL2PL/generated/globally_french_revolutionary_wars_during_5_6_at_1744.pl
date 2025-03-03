:- include('database.pl').
french_revolutionary_wars(Start,End) :- begin('french_revolutionary_wars',_,_,Start), end('french_revolutionary_wars',_,_,End), Start=<End.

globally_french_revolutionary_wars_during_5_6(Start,End) :- french_revolutionary_wars(Start1,End1), Start is (Start1-5), End is (End1-6), Start=<End.

globally_french_revolutionary_wars_during_5_6_at_1744(Res) :- setof((Start,End),globally_french_revolutionary_wars_during_5_6(Start,End),AllINtervals), checkvalidity(1744,AllINtervals,Res).

check_query() :- write('Query = globally_french_revolutionary_wars_during_5_6_at_1744'), (globally_french_revolutionary_wars_during_5_6_at_1744(true) -> write('\nRes   = true');write('\nRes   = false')).

