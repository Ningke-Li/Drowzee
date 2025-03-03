:- include('database.pl').
league_of_nations_mandate(Start,End) :- begin('league_of_nations_mandate',_,_,Start), end('league_of_nations_mandate',_,_,End), Start=<End.

finally_league_of_nations_mandate_during_2_17(Start,End) :- league_of_nations_mandate(Start1,End1), (Start1-17)=<(End1-2), Start is (Start1-17), End is (End1-2), Start=<End.

finally_league_of_nations_mandate_during_2_17_at_1906(Res) :- setof((Start,End),finally_league_of_nations_mandate_during_2_17(Start,End),AllINtervals), checkvalidity(1906,AllINtervals,Res).

check_query() :- write('Query = finally_league_of_nations_mandate_during_2_17_at_1906'), (finally_league_of_nations_mandate_during_2_17_at_1906(true) -> write('\nRes   = true');write('\nRes   = false')).

