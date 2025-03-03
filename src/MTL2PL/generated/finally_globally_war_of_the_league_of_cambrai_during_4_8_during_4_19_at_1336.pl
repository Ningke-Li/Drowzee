:- include('database.pl').
war_of_the_league_of_cambrai(Start,End) :- begin('war_of_the_league_of_cambrai',_,_,Start), end('war_of_the_league_of_cambrai',_,_,End), Start=<End.

globally_war_of_the_league_of_cambrai_during_4_8(Start,End) :- war_of_the_league_of_cambrai(Start1,End1), Start is (Start1-4), End is (End1-8), Start=<End.

finally_globally_war_of_the_league_of_cambrai_during_4_8_during_4_19(Start,End) :- globally_war_of_the_league_of_cambrai_during_4_8(Start1,End1), (Start1-19)=<(End1-4), Start is (Start1-19), End is (End1-4), Start=<End.

finally_globally_war_of_the_league_of_cambrai_during_4_8_during_4_19_at_1336(Res) :- setof((Start,End),finally_globally_war_of_the_league_of_cambrai_during_4_8_during_4_19(Start,End),AllINtervals), checkvalidity(1336,AllINtervals,Res).

check_query() :- write('Query = finally_globally_war_of_the_league_of_cambrai_during_4_8_during_4_19_at_1336'), (finally_globally_war_of_the_league_of_cambrai_during_4_8_during_4_19_at_1336(true) -> write('\nRes   = true');write('\nRes   = false')).

