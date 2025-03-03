:- include('database.pl').
badminton_at_the_2008_summer_olympics(Start,End) :- begin('badminton_at_the_2008_summer_olympics',_,_,Start), end('badminton_at_the_2008_summer_olympics',_,_,End), Start=<End.

next_badminton_at_the_2008_summer_olympics(Start,End) :- badminton_at_the_2008_summer_olympics(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_badminton_at_the_2008_summer_olympics_at_2007(Res) :- setof((Start,End),next_badminton_at_the_2008_summer_olympics(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = next_badminton_at_the_2008_summer_olympics_at_2007'), (next_badminton_at_the_2008_summer_olympics_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).

