:- include('database.pl').
iraqi_civil_war_of_2014_2017(Start,End) :- begin('iraqi_civil_war_of_2014_2017',_,_,Start), end('iraqi_civil_war_of_2014_2017',_,_,End), Start=<End.

globally_iraqi_civil_war_of_2014_2017_during_1_3(Start,End) :- iraqi_civil_war_of_2014_2017(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

globally_iraqi_civil_war_of_2014_2017_during_1_3_at_2014(Res) :- setof((Start,End),globally_iraqi_civil_war_of_2014_2017_during_1_3(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = globally_iraqi_civil_war_of_2014_2017_during_1_3_at_2014'), (globally_iraqi_civil_war_of_2014_2017_during_1_3_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).

