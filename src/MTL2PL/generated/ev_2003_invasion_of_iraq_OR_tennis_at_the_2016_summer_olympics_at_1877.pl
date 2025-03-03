:- include('database.pl').
ev_2003_invasion_of_iraq(Start,End) :- begin('ev_2003_invasion_of_iraq',_,_,Start), end('ev_2003_invasion_of_iraq',_,_,End), Start=<End.

tennis_at_the_2016_summer_olympics(Start,End) :- begin('tennis_at_the_2016_summer_olympics',_,_,Start), end('tennis_at_the_2016_summer_olympics',_,_,End), Start=<End.

generate_facts_ev_2003_invasion_of_iraq_OR_tennis_at_the_2016_summer_olympics([]) :- assert(ev_2003_invasion_of_iraq_OR_tennis_at_the_2016_summer_olympics(-1,-1)).

generate_facts_ev_2003_invasion_of_iraq_OR_tennis_at_the_2016_summer_olympics([(Start,End) | Tail]) :- assert(ev_2003_invasion_of_iraq_OR_tennis_at_the_2016_summer_olympics(Start,End)), generate_facts_ev_2003_invasion_of_iraq_OR_tennis_at_the_2016_summer_olympics(Tail).

ev_2003_invasion_of_iraq_OR_tennis_at_the_2016_summer_olympics_aux() :- findall((Start,End),ev_2003_invasion_of_iraq(Start,End),Interval1), findall((Start,End),tennis_at_the_2016_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2003_invasion_of_iraq_OR_tennis_at_the_2016_summer_olympics(Interval).

ev_2003_invasion_of_iraq_OR_tennis_at_the_2016_summer_olympics_at_1877(Res) :- setof((Start,End),ev_2003_invasion_of_iraq_OR_tennis_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(1877,AllINtervals,Res).

check_query() :- write('Query = ev_2003_invasion_of_iraq_OR_tennis_at_the_2016_summer_olympics_at_1877'), (ev_2003_invasion_of_iraq_OR_tennis_at_the_2016_summer_olympics_at_1877(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2003_invasion_of_iraq_OR_tennis_at_the_2016_summer_olympics_aux().

