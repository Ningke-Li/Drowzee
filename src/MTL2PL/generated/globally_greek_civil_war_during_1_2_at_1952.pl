:- include('database.pl').
greek_civil_war(Start,End) :- begin('greek_civil_war',_,_,Start), end('greek_civil_war',_,_,End), Start=<End.

globally_greek_civil_war_during_1_2(Start,End) :- greek_civil_war(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_greek_civil_war_during_1_2_at_1952(Res) :- setof((Start,End),globally_greek_civil_war_during_1_2(Start,End),AllINtervals), checkvalidity(1952,AllINtervals,Res).

check_query() :- write('Query = globally_greek_civil_war_during_1_2_at_1952'), (globally_greek_civil_war_during_1_2_at_1952(true) -> write('\nRes   = true');write('\nRes   = false')).

