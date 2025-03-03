:- include('database.pl').
french_and_indian_war(Start,End) :- begin('french_and_indian_war',_,_,Start), end('french_and_indian_war',_,_,End), Start=<End.

next_french_and_indian_war(Start,End) :- french_and_indian_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_french_and_indian_war_at_1762(Res) :- setof((Start,End),next_french_and_indian_war(Start,End),AllINtervals), checkvalidity(1762,AllINtervals,Res).

check_query() :- write('Query = next_french_and_indian_war_at_1762'), (next_french_and_indian_war_at_1762(true) -> write('\nRes   = true');write('\nRes   = false')).

