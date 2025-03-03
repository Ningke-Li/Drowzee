:- include('database.pl').
volleyball_at_the_2016_summer_olympics(Start,End) :- begin('volleyball_at_the_2016_summer_olympics',_,_,Start), end('volleyball_at_the_2016_summer_olympics',_,_,End), Start=<End.

ouran_high_school_host_club(Start,End) :- begin('ouran_high_school_host_club',_,_,Start), end('ouran_high_school_host_club',_,_,End), Start=<End.

generate_facts_volleyball_at_the_2016_summer_olympics_OR_ouran_high_school_host_club([]) :- assert(volleyball_at_the_2016_summer_olympics_OR_ouran_high_school_host_club(-1,-1)).

generate_facts_volleyball_at_the_2016_summer_olympics_OR_ouran_high_school_host_club([(Start,End) | Tail]) :- assert(volleyball_at_the_2016_summer_olympics_OR_ouran_high_school_host_club(Start,End)), generate_facts_volleyball_at_the_2016_summer_olympics_OR_ouran_high_school_host_club(Tail).

volleyball_at_the_2016_summer_olympics_OR_ouran_high_school_host_club_aux() :- findall((Start,End),volleyball_at_the_2016_summer_olympics(Start,End),Interval1), findall((Start,End),ouran_high_school_host_club(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_volleyball_at_the_2016_summer_olympics_OR_ouran_high_school_host_club(Interval).

volleyball_at_the_2016_summer_olympics_OR_ouran_high_school_host_club_at_2028(Res) :- setof((Start,End),volleyball_at_the_2016_summer_olympics_OR_ouran_high_school_host_club(Start,End),AllINtervals), checkvalidity(2028,AllINtervals,Res).

check_query() :- write('Query = volleyball_at_the_2016_summer_olympics_OR_ouran_high_school_host_club_at_2028'), (volleyball_at_the_2016_summer_olympics_OR_ouran_high_school_host_club_at_2028(true) -> write('\nRes   = true');write('\nRes   = false')).
?- volleyball_at_the_2016_summer_olympics_OR_ouran_high_school_host_club_aux().

