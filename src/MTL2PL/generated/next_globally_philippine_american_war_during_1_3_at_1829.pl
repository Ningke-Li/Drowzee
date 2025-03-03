:- include('database.pl').
philippine_american_war(Start,End) :- begin('philippine_american_war',_,_,Start), end('philippine_american_war',_,_,End), Start=<End.

globally_philippine_american_war_during_1_3(Start,End) :- philippine_american_war(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

next_globally_philippine_american_war_during_1_3(Start,End) :- globally_philippine_american_war_during_1_3(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_philippine_american_war_during_1_3_at_1829(Res) :- setof((Start,End),next_globally_philippine_american_war_during_1_3(Start,End),AllINtervals), checkvalidity(1829,AllINtervals,Res).

check_query() :- write('Query = next_globally_philippine_american_war_during_1_3_at_1829'), (next_globally_philippine_american_war_during_1_3_at_1829(true) -> write('\nRes   = true');write('\nRes   = false')).

