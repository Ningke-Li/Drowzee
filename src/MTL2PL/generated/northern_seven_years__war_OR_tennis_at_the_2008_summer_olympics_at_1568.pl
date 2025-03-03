:- include('database.pl').
northern_seven_years__war(Start,End) :- begin('northern_seven_years__war',_,_,Start), end('northern_seven_years__war',_,_,End), Start=<End.

tennis_at_the_2008_summer_olympics(Start,End) :- begin('tennis_at_the_2008_summer_olympics',_,_,Start), end('tennis_at_the_2008_summer_olympics',_,_,End), Start=<End.

generate_facts_northern_seven_years__war_OR_tennis_at_the_2008_summer_olympics([]) :- assert(northern_seven_years__war_OR_tennis_at_the_2008_summer_olympics(-1,-1)).

generate_facts_northern_seven_years__war_OR_tennis_at_the_2008_summer_olympics([(Start,End) | Tail]) :- assert(northern_seven_years__war_OR_tennis_at_the_2008_summer_olympics(Start,End)), generate_facts_northern_seven_years__war_OR_tennis_at_the_2008_summer_olympics(Tail).

northern_seven_years__war_OR_tennis_at_the_2008_summer_olympics_aux() :- findall((Start,End),northern_seven_years__war(Start,End),Interval1), findall((Start,End),tennis_at_the_2008_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_northern_seven_years__war_OR_tennis_at_the_2008_summer_olympics(Interval).

northern_seven_years__war_OR_tennis_at_the_2008_summer_olympics_at_1568(Res) :- setof((Start,End),northern_seven_years__war_OR_tennis_at_the_2008_summer_olympics(Start,End),AllINtervals), checkvalidity(1568,AllINtervals,Res).

check_query() :- write('Query = northern_seven_years__war_OR_tennis_at_the_2008_summer_olympics_at_1568'), (northern_seven_years__war_OR_tennis_at_the_2008_summer_olympics_at_1568(true) -> write('\nRes   = true');write('\nRes   = false')).
?- northern_seven_years__war_OR_tennis_at_the_2008_summer_olympics_aux().

