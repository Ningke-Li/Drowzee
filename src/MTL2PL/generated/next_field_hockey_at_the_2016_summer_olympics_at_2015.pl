:- include('database.pl').
field_hockey_at_the_2016_summer_olympics(Start,End) :- begin('field_hockey_at_the_2016_summer_olympics',_,_,Start), end('field_hockey_at_the_2016_summer_olympics',_,_,End), Start=<End.

next_field_hockey_at_the_2016_summer_olympics(Start,End) :- field_hockey_at_the_2016_summer_olympics(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_field_hockey_at_the_2016_summer_olympics_at_2015(Res) :- setof((Start,End),next_field_hockey_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = next_field_hockey_at_the_2016_summer_olympics_at_2015'), (next_field_hockey_at_the_2016_summer_olympics_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).

