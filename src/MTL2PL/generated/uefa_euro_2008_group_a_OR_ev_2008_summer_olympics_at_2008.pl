:- include('database.pl').
uefa_euro_2008_group_a(Start,End) :- begin('uefa_euro_2008_group_a',_,_,Start), end('uefa_euro_2008_group_a',_,_,End), Start=<End.

ev_2008_summer_olympics(Start,End) :- begin('ev_2008_summer_olympics',_,_,Start), end('ev_2008_summer_olympics',_,_,End), Start=<End.

generate_facts_uefa_euro_2008_group_a_OR_ev_2008_summer_olympics([]) :- assert(uefa_euro_2008_group_a_OR_ev_2008_summer_olympics(-1,-1)).

generate_facts_uefa_euro_2008_group_a_OR_ev_2008_summer_olympics([(Start,End) | Tail]) :- assert(uefa_euro_2008_group_a_OR_ev_2008_summer_olympics(Start,End)), generate_facts_uefa_euro_2008_group_a_OR_ev_2008_summer_olympics(Tail).

uefa_euro_2008_group_a_OR_ev_2008_summer_olympics_aux() :- findall((Start,End),uefa_euro_2008_group_a(Start,End),Interval1), findall((Start,End),ev_2008_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_uefa_euro_2008_group_a_OR_ev_2008_summer_olympics(Interval).

uefa_euro_2008_group_a_OR_ev_2008_summer_olympics_at_2008(Res) :- setof((Start,End),uefa_euro_2008_group_a_OR_ev_2008_summer_olympics(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = uefa_euro_2008_group_a_OR_ev_2008_summer_olympics_at_2008'), (uefa_euro_2008_group_a_OR_ev_2008_summer_olympics_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- uefa_euro_2008_group_a_OR_ev_2008_summer_olympics_aux().

