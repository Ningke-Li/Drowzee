:- include('database.pl').
ev_2_broke_girls(Start,End) :- begin('ev_2_broke_girls',_,_,Start), end('ev_2_broke_girls',_,_,End), Start=<End.

vostok_programme(Start,End) :- begin('vostok_programme',_,_,Start), end('vostok_programme',_,_,End), Start=<End.

generate_facts_ev_2_broke_girls_AND_vostok_programme([]) :- assert(ev_2_broke_girls_AND_vostok_programme(-1,-1)).

generate_facts_ev_2_broke_girls_AND_vostok_programme([(Start,End) | Tail]) :- assert(ev_2_broke_girls_AND_vostok_programme(Start,End)), generate_facts_ev_2_broke_girls_AND_vostok_programme(Tail).

ev_2_broke_girls_AND_vostok_programme_aux() :- findall((Start,End),ev_2_broke_girls(Start,End),Interval1), findall((Start,End),vostok_programme(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2_broke_girls_AND_vostok_programme(Interval).

ev_2_broke_girls_AND_vostok_programme_at_2056(Res) :- setof((Start,End),ev_2_broke_girls_AND_vostok_programme(Start,End),AllINtervals), checkvalidity(2056,AllINtervals,Res).

check_query() :- write('Query = ev_2_broke_girls_AND_vostok_programme_at_2056'), (ev_2_broke_girls_AND_vostok_programme_at_2056(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2_broke_girls_AND_vostok_programme_aux().

