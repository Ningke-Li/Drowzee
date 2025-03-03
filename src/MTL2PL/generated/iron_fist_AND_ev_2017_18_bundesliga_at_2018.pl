:- include('database.pl').
iron_fist(Start,End) :- begin('iron_fist',_,_,Start), end('iron_fist',_,_,End), Start=<End.

ev_2017_18_bundesliga(Start,End) :- begin('ev_2017_18_bundesliga',_,_,Start), end('ev_2017_18_bundesliga',_,_,End), Start=<End.

generate_facts_iron_fist_AND_ev_2017_18_bundesliga([]) :- assert(iron_fist_AND_ev_2017_18_bundesliga(-1,-1)).

generate_facts_iron_fist_AND_ev_2017_18_bundesliga([(Start,End) | Tail]) :- assert(iron_fist_AND_ev_2017_18_bundesliga(Start,End)), generate_facts_iron_fist_AND_ev_2017_18_bundesliga(Tail).

iron_fist_AND_ev_2017_18_bundesliga_aux() :- findall((Start,End),iron_fist(Start,End),Interval1), findall((Start,End),ev_2017_18_bundesliga(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_iron_fist_AND_ev_2017_18_bundesliga(Interval).

iron_fist_AND_ev_2017_18_bundesliga_at_2018(Res) :- setof((Start,End),iron_fist_AND_ev_2017_18_bundesliga(Start,End),AllINtervals), checkvalidity(2018,AllINtervals,Res).

check_query() :- write('Query = iron_fist_AND_ev_2017_18_bundesliga_at_2018'), (iron_fist_AND_ev_2017_18_bundesliga_at_2018(true) -> write('\nRes   = true');write('\nRes   = false')).
?- iron_fist_AND_ev_2017_18_bundesliga_aux().

