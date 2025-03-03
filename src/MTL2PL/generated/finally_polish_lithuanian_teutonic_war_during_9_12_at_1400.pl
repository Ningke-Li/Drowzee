:- include('database.pl').
polish_lithuanian_teutonic_war(Start,End) :- begin('polish_lithuanian_teutonic_war',_,_,Start), end('polish_lithuanian_teutonic_war',_,_,End), Start=<End.

finally_polish_lithuanian_teutonic_war_during_9_12(Start,End) :- polish_lithuanian_teutonic_war(Start1,End1), (Start1-12)=<(End1-9), Start is (Start1-12), End is (End1-9), Start=<End.

finally_polish_lithuanian_teutonic_war_during_9_12_at_1400(Res) :- setof((Start,End),finally_polish_lithuanian_teutonic_war_during_9_12(Start,End),AllINtervals), checkvalidity(1400,AllINtervals,Res).

check_query() :- write('Query = finally_polish_lithuanian_teutonic_war_during_9_12_at_1400'), (finally_polish_lithuanian_teutonic_war_during_9_12_at_1400(true) -> write('\nRes   = true');write('\nRes   = false')).

