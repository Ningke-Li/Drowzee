:- include('database.pl').
nip_tuck(Start,End) :- begin('nip_tuck',_,_,Start), end('nip_tuck',_,_,End), Start=<End.

mad_men(Start,End) :- begin('mad_men',_,_,Start), end('mad_men',_,_,End), Start=<End.

generate_facts_nip_tuck_AND_mad_men([]) :- assert(nip_tuck_AND_mad_men(-1,-1)).

generate_facts_nip_tuck_AND_mad_men([(Start,End) | Tail]) :- assert(nip_tuck_AND_mad_men(Start,End)), generate_facts_nip_tuck_AND_mad_men(Tail).

nip_tuck_AND_mad_men_aux() :- findall((Start,End),nip_tuck(Start,End),Interval1), findall((Start,End),mad_men(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_nip_tuck_AND_mad_men(Interval).

nip_tuck_AND_mad_men_at_2007(Res) :- setof((Start,End),nip_tuck_AND_mad_men(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = nip_tuck_AND_mad_men_at_2007'), (nip_tuck_AND_mad_men_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).
?- nip_tuck_AND_mad_men_aux().

