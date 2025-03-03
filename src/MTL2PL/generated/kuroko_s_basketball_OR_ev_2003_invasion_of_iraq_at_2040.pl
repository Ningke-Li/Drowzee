:- include('database.pl').
kuroko_s_basketball(Start,End) :- begin('kuroko_s_basketball',_,_,Start), end('kuroko_s_basketball',_,_,End), Start=<End.

ev_2003_invasion_of_iraq(Start,End) :- begin('ev_2003_invasion_of_iraq',_,_,Start), end('ev_2003_invasion_of_iraq',_,_,End), Start=<End.

generate_facts_kuroko_s_basketball_OR_ev_2003_invasion_of_iraq([]) :- assert(kuroko_s_basketball_OR_ev_2003_invasion_of_iraq(-1,-1)).

generate_facts_kuroko_s_basketball_OR_ev_2003_invasion_of_iraq([(Start,End) | Tail]) :- assert(kuroko_s_basketball_OR_ev_2003_invasion_of_iraq(Start,End)), generate_facts_kuroko_s_basketball_OR_ev_2003_invasion_of_iraq(Tail).

kuroko_s_basketball_OR_ev_2003_invasion_of_iraq_aux() :- findall((Start,End),kuroko_s_basketball(Start,End),Interval1), findall((Start,End),ev_2003_invasion_of_iraq(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_kuroko_s_basketball_OR_ev_2003_invasion_of_iraq(Interval).

kuroko_s_basketball_OR_ev_2003_invasion_of_iraq_at_2040(Res) :- setof((Start,End),kuroko_s_basketball_OR_ev_2003_invasion_of_iraq(Start,End),AllINtervals), checkvalidity(2040,AllINtervals,Res).

check_query() :- write('Query = kuroko_s_basketball_OR_ev_2003_invasion_of_iraq_at_2040'), (kuroko_s_basketball_OR_ev_2003_invasion_of_iraq_at_2040(true) -> write('\nRes   = true');write('\nRes   = false')).
?- kuroko_s_basketball_OR_ev_2003_invasion_of_iraq_aux().

