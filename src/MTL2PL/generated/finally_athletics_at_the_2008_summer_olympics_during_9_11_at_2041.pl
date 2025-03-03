:- include('database.pl').
athletics_at_the_2008_summer_olympics(Start,End) :- begin('athletics_at_the_2008_summer_olympics',_,_,Start), end('athletics_at_the_2008_summer_olympics',_,_,End), Start=<End.

finally_athletics_at_the_2008_summer_olympics_during_9_11(Start,End) :- athletics_at_the_2008_summer_olympics(Start1,End1), (Start1-11)=<(End1-9), Start is (Start1-11), End is (End1-9), Start=<End.

finally_athletics_at_the_2008_summer_olympics_during_9_11_at_2041(Res) :- setof((Start,End),finally_athletics_at_the_2008_summer_olympics_during_9_11(Start,End),AllINtervals), checkvalidity(2041,AllINtervals,Res).

check_query() :- write('Query = finally_athletics_at_the_2008_summer_olympics_during_9_11_at_2041'), (finally_athletics_at_the_2008_summer_olympics_during_9_11_at_2041(true) -> write('\nRes   = true');write('\nRes   = false')).

