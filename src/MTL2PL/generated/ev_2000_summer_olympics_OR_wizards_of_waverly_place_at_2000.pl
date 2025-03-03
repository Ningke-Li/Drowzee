:- include('database.pl').
ev_2000_summer_olympics(Start,End) :- begin('ev_2000_summer_olympics',_,_,Start), end('ev_2000_summer_olympics',_,_,End), Start=<End.

wizards_of_waverly_place(Start,End) :- begin('wizards_of_waverly_place',_,_,Start), end('wizards_of_waverly_place',_,_,End), Start=<End.

generate_facts_ev_2000_summer_olympics_OR_wizards_of_waverly_place([]) :- assert(ev_2000_summer_olympics_OR_wizards_of_waverly_place(-1,-1)).

generate_facts_ev_2000_summer_olympics_OR_wizards_of_waverly_place([(Start,End) | Tail]) :- assert(ev_2000_summer_olympics_OR_wizards_of_waverly_place(Start,End)), generate_facts_ev_2000_summer_olympics_OR_wizards_of_waverly_place(Tail).

ev_2000_summer_olympics_OR_wizards_of_waverly_place_aux() :- findall((Start,End),ev_2000_summer_olympics(Start,End),Interval1), findall((Start,End),wizards_of_waverly_place(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2000_summer_olympics_OR_wizards_of_waverly_place(Interval).

ev_2000_summer_olympics_OR_wizards_of_waverly_place_at_2000(Res) :- setof((Start,End),ev_2000_summer_olympics_OR_wizards_of_waverly_place(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = ev_2000_summer_olympics_OR_wizards_of_waverly_place_at_2000'), (ev_2000_summer_olympics_OR_wizards_of_waverly_place_at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2000_summer_olympics_OR_wizards_of_waverly_place_aux().

