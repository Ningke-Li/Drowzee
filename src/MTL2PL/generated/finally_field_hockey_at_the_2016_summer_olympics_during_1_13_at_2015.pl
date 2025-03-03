:- include('database.pl').
field_hockey_at_the_2016_summer_olympics(Start,End) :- begin('field_hockey_at_the_2016_summer_olympics',_,_,Start), end('field_hockey_at_the_2016_summer_olympics',_,_,End), Start=<End.

finally_field_hockey_at_the_2016_summer_olympics_during_1_13(Start,End) :- field_hockey_at_the_2016_summer_olympics(Start1,End1), (Start1-13)=<(End1-1), Start is (Start1-13), End is (End1-1), Start=<End.

finally_field_hockey_at_the_2016_summer_olympics_during_1_13_at_2015(Res) :- setof((Start,End),finally_field_hockey_at_the_2016_summer_olympics_during_1_13(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = finally_field_hockey_at_the_2016_summer_olympics_during_1_13_at_2015'), (finally_field_hockey_at_the_2016_summer_olympics_during_1_13_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).

