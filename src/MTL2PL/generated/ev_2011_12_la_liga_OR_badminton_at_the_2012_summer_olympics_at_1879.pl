:- include('database.pl').
ev_2011_12_la_liga(Start,End) :- begin('ev_2011_12_la_liga',_,_,Start), end('ev_2011_12_la_liga',_,_,End), Start=<End.

badminton_at_the_2012_summer_olympics(Start,End) :- begin('badminton_at_the_2012_summer_olympics',_,_,Start), end('badminton_at_the_2012_summer_olympics',_,_,End), Start=<End.

generate_facts_ev_2011_12_la_liga_OR_badminton_at_the_2012_summer_olympics([]) :- assert(ev_2011_12_la_liga_OR_badminton_at_the_2012_summer_olympics(-1,-1)).

generate_facts_ev_2011_12_la_liga_OR_badminton_at_the_2012_summer_olympics([(Start,End) | Tail]) :- assert(ev_2011_12_la_liga_OR_badminton_at_the_2012_summer_olympics(Start,End)), generate_facts_ev_2011_12_la_liga_OR_badminton_at_the_2012_summer_olympics(Tail).

ev_2011_12_la_liga_OR_badminton_at_the_2012_summer_olympics_aux() :- findall((Start,End),ev_2011_12_la_liga(Start,End),Interval1), findall((Start,End),badminton_at_the_2012_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2011_12_la_liga_OR_badminton_at_the_2012_summer_olympics(Interval).

ev_2011_12_la_liga_OR_badminton_at_the_2012_summer_olympics_at_1879(Res) :- setof((Start,End),ev_2011_12_la_liga_OR_badminton_at_the_2012_summer_olympics(Start,End),AllINtervals), checkvalidity(1879,AllINtervals,Res).

check_query() :- write('Query = ev_2011_12_la_liga_OR_badminton_at_the_2012_summer_olympics_at_1879'), (ev_2011_12_la_liga_OR_badminton_at_the_2012_summer_olympics_at_1879(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2011_12_la_liga_OR_badminton_at_the_2012_summer_olympics_aux().

