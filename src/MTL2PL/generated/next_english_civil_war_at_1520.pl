:- include('database.pl').
english_civil_war(Start,End) :- begin('english_civil_war',_,_,Start), end('english_civil_war',_,_,End), Start=<End.

next_english_civil_war(Start,End) :- english_civil_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_english_civil_war_at_1520(Res) :- setof((Start,End),next_english_civil_war(Start,End),AllINtervals), checkvalidity(1520,AllINtervals,Res).

check_query() :- write('Query = next_english_civil_war_at_1520'), (next_english_civil_war_at_1520(true) -> write('\nRes   = true');write('\nRes   = false')).

