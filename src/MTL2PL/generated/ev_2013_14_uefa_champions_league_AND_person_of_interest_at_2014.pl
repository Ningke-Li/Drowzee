:- include('database.pl').
ev_2013_14_uefa_champions_league(Start,End) :- begin('ev_2013_14_uefa_champions_league',_,_,Start), end('ev_2013_14_uefa_champions_league',_,_,End), Start=<End.

person_of_interest(Start,End) :- begin('person_of_interest',_,_,Start), end('person_of_interest',_,_,End), Start=<End.

generate_facts_ev_2013_14_uefa_champions_league_AND_person_of_interest([]) :- assert(ev_2013_14_uefa_champions_league_AND_person_of_interest(-1,-1)).

generate_facts_ev_2013_14_uefa_champions_league_AND_person_of_interest([(Start,End) | Tail]) :- assert(ev_2013_14_uefa_champions_league_AND_person_of_interest(Start,End)), generate_facts_ev_2013_14_uefa_champions_league_AND_person_of_interest(Tail).

ev_2013_14_uefa_champions_league_AND_person_of_interest_aux() :- findall((Start,End),ev_2013_14_uefa_champions_league(Start,End),Interval1), findall((Start,End),person_of_interest(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2013_14_uefa_champions_league_AND_person_of_interest(Interval).

ev_2013_14_uefa_champions_league_AND_person_of_interest_at_2014(Res) :- setof((Start,End),ev_2013_14_uefa_champions_league_AND_person_of_interest(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = ev_2013_14_uefa_champions_league_AND_person_of_interest_at_2014'), (ev_2013_14_uefa_champions_league_AND_person_of_interest_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_14_uefa_champions_league_AND_person_of_interest_aux().

