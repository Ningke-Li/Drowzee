:- include('database.pl').
cypriot_pound(Start,End) :- begin('cypriot_pound',_,_,Start), end('cypriot_pound',_,_,End), Start=<End.

italo_turkish_war(Start,End) :- begin('italo_turkish_war',_,_,Start), end('italo_turkish_war',_,_,End), Start=<End.

generate_facts_cypriot_pound_AND_italo_turkish_war([]) :- assert(cypriot_pound_AND_italo_turkish_war(-1,-1)).

generate_facts_cypriot_pound_AND_italo_turkish_war([(Start,End) | Tail]) :- assert(cypriot_pound_AND_italo_turkish_war(Start,End)), generate_facts_cypriot_pound_AND_italo_turkish_war(Tail).

cypriot_pound_AND_italo_turkish_war_aux() :- findall((Start,End),cypriot_pound(Start,End),Interval1), findall((Start,End),italo_turkish_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_cypriot_pound_AND_italo_turkish_war(Interval).

cypriot_pound_AND_italo_turkish_war_at_1911(Res) :- setof((Start,End),cypriot_pound_AND_italo_turkish_war(Start,End),AllINtervals), checkvalidity(1911,AllINtervals,Res).

check_query() :- write('Query = cypriot_pound_AND_italo_turkish_war_at_1911'), (cypriot_pound_AND_italo_turkish_war_at_1911(true) -> write('\nRes   = true');write('\nRes   = false')).
?- cypriot_pound_AND_italo_turkish_war_aux().

