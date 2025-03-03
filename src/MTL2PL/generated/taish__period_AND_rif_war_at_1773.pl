:- include('database.pl').
taish__period(Start,End) :- begin('taish__period',_,_,Start), end('taish__period',_,_,End), Start=<End.

rif_war(Start,End) :- begin('rif_war',_,_,Start), end('rif_war',_,_,End), Start=<End.

generate_facts_taish__period_AND_rif_war([]) :- assert(taish__period_AND_rif_war(-1,-1)).

generate_facts_taish__period_AND_rif_war([(Start,End) | Tail]) :- assert(taish__period_AND_rif_war(Start,End)), generate_facts_taish__period_AND_rif_war(Tail).

taish__period_AND_rif_war_aux() :- findall((Start,End),taish__period(Start,End),Interval1), findall((Start,End),rif_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_taish__period_AND_rif_war(Interval).

taish__period_AND_rif_war_at_1773(Res) :- setof((Start,End),taish__period_AND_rif_war(Start,End),AllINtervals), checkvalidity(1773,AllINtervals,Res).

check_query() :- write('Query = taish__period_AND_rif_war_at_1773'), (taish__period_AND_rif_war_at_1773(true) -> write('\nRes   = true');write('\nRes   = false')).
?- taish__period_AND_rif_war_aux().

