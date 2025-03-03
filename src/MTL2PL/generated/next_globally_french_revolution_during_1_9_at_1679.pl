:- include('database.pl').
french_revolution(Start,End) :- begin('french_revolution',_,_,Start), end('french_revolution',_,_,End), Start=<End.

globally_french_revolution_during_1_9(Start,End) :- french_revolution(Start1,End1), Start is (Start1-1), End is (End1-9), Start=<End.

next_globally_french_revolution_during_1_9(Start,End) :- globally_french_revolution_during_1_9(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_french_revolution_during_1_9_at_1679(Res) :- setof((Start,End),next_globally_french_revolution_during_1_9(Start,End),AllINtervals), checkvalidity(1679,AllINtervals,Res).

check_query() :- write('Query = next_globally_french_revolution_during_1_9_at_1679'), (next_globally_french_revolution_during_1_9_at_1679(true) -> write('\nRes   = true');write('\nRes   = false')).

