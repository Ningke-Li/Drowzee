:- include('database.pl').
philippine_american_war(Start,End) :- begin('philippine_american_war',_,_,Start), end('philippine_american_war',_,_,End), Start=<End.

globally_philippine_american_war_during_1_3(Start,End) :- philippine_american_war(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

globally_philippine_american_war_during_1_3_at_1824(Res) :- setof((Start,End),globally_philippine_american_war_during_1_3(Start,End),AllINtervals), checkvalidity(1824,AllINtervals,Res).

check_query() :- write('Query = globally_philippine_american_war_during_1_3_at_1824'), (globally_philippine_american_war_during_1_3_at_1824(true) -> write('\nRes   = true');write('\nRes   = false')).

