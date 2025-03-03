:- include('database.pl').
criminal_minds(Start,End) :- begin('criminal_minds',_,_,Start), end('criminal_minds',_,_,End), Start=<End.

ev_2017_18_bundesliga(Start,End) :- begin('ev_2017_18_bundesliga',_,_,Start), end('ev_2017_18_bundesliga',_,_,End), Start=<End.

generate_facts_criminal_minds_AND_ev_2017_18_bundesliga([]) :- assert(criminal_minds_AND_ev_2017_18_bundesliga(-1,-1)).

generate_facts_criminal_minds_AND_ev_2017_18_bundesliga([(Start,End) | Tail]) :- assert(criminal_minds_AND_ev_2017_18_bundesliga(Start,End)), generate_facts_criminal_minds_AND_ev_2017_18_bundesliga(Tail).

criminal_minds_AND_ev_2017_18_bundesliga_aux() :- findall((Start,End),criminal_minds(Start,End),Interval1), findall((Start,End),ev_2017_18_bundesliga(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_criminal_minds_AND_ev_2017_18_bundesliga(Interval).

criminal_minds_AND_ev_2017_18_bundesliga_at_1992(Res) :- setof((Start,End),criminal_minds_AND_ev_2017_18_bundesliga(Start,End),AllINtervals), checkvalidity(1992,AllINtervals,Res).

check_query() :- write('Query = criminal_minds_AND_ev_2017_18_bundesliga_at_1992'), (criminal_minds_AND_ev_2017_18_bundesliga_at_1992(true) -> write('\nRes   = true');write('\nRes   = false')).
?- criminal_minds_AND_ev_2017_18_bundesliga_aux().

