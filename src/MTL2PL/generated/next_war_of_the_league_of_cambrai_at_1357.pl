:- include('database.pl').
war_of_the_league_of_cambrai(Start,End) :- begin('war_of_the_league_of_cambrai',_,_,Start), end('war_of_the_league_of_cambrai',_,_,End), Start=<End.

next_war_of_the_league_of_cambrai(Start,End) :- war_of_the_league_of_cambrai(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_war_of_the_league_of_cambrai_at_1357(Res) :- setof((Start,End),next_war_of_the_league_of_cambrai(Start,End),AllINtervals), checkvalidity(1357,AllINtervals,Res).

check_query() :- write('Query = next_war_of_the_league_of_cambrai_at_1357'), (next_war_of_the_league_of_cambrai_at_1357(true) -> write('\nRes   = true');write('\nRes   = false')).

