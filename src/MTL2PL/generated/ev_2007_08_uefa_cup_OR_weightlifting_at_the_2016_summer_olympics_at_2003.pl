:- include('database.pl').
ev_2007_08_uefa_cup(Start,End) :- begin('ev_2007_08_uefa_cup',_,_,Start), end('ev_2007_08_uefa_cup',_,_,End), Start=<End.

weightlifting_at_the_2016_summer_olympics(Start,End) :- begin('weightlifting_at_the_2016_summer_olympics',_,_,Start), end('weightlifting_at_the_2016_summer_olympics',_,_,End), Start=<End.

generate_facts_ev_2007_08_uefa_cup_OR_weightlifting_at_the_2016_summer_olympics([]) :- assert(ev_2007_08_uefa_cup_OR_weightlifting_at_the_2016_summer_olympics(-1,-1)).

generate_facts_ev_2007_08_uefa_cup_OR_weightlifting_at_the_2016_summer_olympics([(Start,End) | Tail]) :- assert(ev_2007_08_uefa_cup_OR_weightlifting_at_the_2016_summer_olympics(Start,End)), generate_facts_ev_2007_08_uefa_cup_OR_weightlifting_at_the_2016_summer_olympics(Tail).

ev_2007_08_uefa_cup_OR_weightlifting_at_the_2016_summer_olympics_aux() :- findall((Start,End),ev_2007_08_uefa_cup(Start,End),Interval1), findall((Start,End),weightlifting_at_the_2016_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2007_08_uefa_cup_OR_weightlifting_at_the_2016_summer_olympics(Interval).

ev_2007_08_uefa_cup_OR_weightlifting_at_the_2016_summer_olympics_at_2003(Res) :- setof((Start,End),ev_2007_08_uefa_cup_OR_weightlifting_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = ev_2007_08_uefa_cup_OR_weightlifting_at_the_2016_summer_olympics_at_2003'), (ev_2007_08_uefa_cup_OR_weightlifting_at_the_2016_summer_olympics_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2007_08_uefa_cup_OR_weightlifting_at_the_2016_summer_olympics_aux().

