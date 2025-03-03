:- include('database.pl').
nip_tuck(Start,End) :- begin('nip_tuck',_,_,Start), end('nip_tuck',_,_,End), Start=<End.

ev_2007_08_la_liga(Start,End) :- begin('ev_2007_08_la_liga',_,_,Start), end('ev_2007_08_la_liga',_,_,End), Start=<End.

generate_facts_nip_tuck_AND_ev_2007_08_la_liga([]) :- assert(nip_tuck_AND_ev_2007_08_la_liga(-1,-1)).

generate_facts_nip_tuck_AND_ev_2007_08_la_liga([(Start,End) | Tail]) :- assert(nip_tuck_AND_ev_2007_08_la_liga(Start,End)), generate_facts_nip_tuck_AND_ev_2007_08_la_liga(Tail).

nip_tuck_AND_ev_2007_08_la_liga_aux() :- findall((Start,End),nip_tuck(Start,End),Interval1), findall((Start,End),ev_2007_08_la_liga(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_nip_tuck_AND_ev_2007_08_la_liga(Interval).

nip_tuck_AND_ev_2007_08_la_liga_at_1978(Res) :- setof((Start,End),nip_tuck_AND_ev_2007_08_la_liga(Start,End),AllINtervals), checkvalidity(1978,AllINtervals,Res).

check_query() :- write('Query = nip_tuck_AND_ev_2007_08_la_liga_at_1978'), (nip_tuck_AND_ev_2007_08_la_liga_at_1978(true) -> write('\nRes   = true');write('\nRes   = false')).
?- nip_tuck_AND_ev_2007_08_la_liga_aux().

