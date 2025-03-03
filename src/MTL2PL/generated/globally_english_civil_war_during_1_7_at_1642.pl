:- include('database.pl').
english_civil_war(Start,End) :- begin('english_civil_war',_,_,Start), end('english_civil_war',_,_,End), Start=<End.

globally_english_civil_war_during_1_7(Start,End) :- english_civil_war(Start1,End1), Start is (Start1-1), End is (End1-7), Start=<End.

globally_english_civil_war_during_1_7_at_1642(Res) :- setof((Start,End),globally_english_civil_war_during_1_7(Start,End),AllINtervals), checkvalidity(1642,AllINtervals,Res).

check_query() :- write('Query = globally_english_civil_war_during_1_7_at_1642'), (globally_english_civil_war_during_1_7_at_1642(true) -> write('\nRes   = true');write('\nRes   = false')).

