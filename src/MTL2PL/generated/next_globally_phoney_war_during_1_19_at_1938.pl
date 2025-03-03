:- include('database.pl').
phoney_war(Start,End) :- begin('phoney_war',_,_,Start), end('phoney_war',_,_,End), Start=<End.

globally_phoney_war_during_1_19(Start,End) :- phoney_war(Start1,End1), Start is (Start1-1), End is (End1-19), Start=<End.

next_globally_phoney_war_during_1_19(Start,End) :- globally_phoney_war_during_1_19(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_phoney_war_during_1_19_at_1938(Res) :- setof((Start,End),next_globally_phoney_war_during_1_19(Start,End),AllINtervals), checkvalidity(1938,AllINtervals,Res).

check_query() :- write('Query = next_globally_phoney_war_during_1_19_at_1938'), (next_globally_phoney_war_during_1_19_at_1938(true) -> write('\nRes   = true');write('\nRes   = false')).

