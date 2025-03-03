:- include('database.pl').
iraqi_civil_war_of_2014_2017(Start,End) :- begin('iraqi_civil_war_of_2014_2017',_,_,Start), end('iraqi_civil_war_of_2014_2017',_,_,End), Start=<End.

next_iraqi_civil_war_of_2014_2017(Start,End) :- iraqi_civil_war_of_2014_2017(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_iraqi_civil_war_of_2014_2017_at_2033(Res) :- setof((Start,End),next_iraqi_civil_war_of_2014_2017(Start,End),AllINtervals), checkvalidity(2033,AllINtervals,Res).

check_query() :- write('Query = next_iraqi_civil_war_of_2014_2017_at_2033'), (next_iraqi_civil_war_of_2014_2017_at_2033(true) -> write('\nRes   = true');write('\nRes   = false')).

