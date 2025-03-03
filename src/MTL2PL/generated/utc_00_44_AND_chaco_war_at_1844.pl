:- include('database.pl').
utc_00_44(Start,End) :- begin('utc_00_44',_,_,Start), end('utc_00_44',_,_,End), Start=<End.

chaco_war(Start,End) :- begin('chaco_war',_,_,Start), end('chaco_war',_,_,End), Start=<End.

generate_facts_utc_00_44_AND_chaco_war([]) :- assert(utc_00_44_AND_chaco_war(-1,-1)).

generate_facts_utc_00_44_AND_chaco_war([(Start,End) | Tail]) :- assert(utc_00_44_AND_chaco_war(Start,End)), generate_facts_utc_00_44_AND_chaco_war(Tail).

utc_00_44_AND_chaco_war_aux() :- findall((Start,End),utc_00_44(Start,End),Interval1), findall((Start,End),chaco_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_utc_00_44_AND_chaco_war(Interval).

utc_00_44_AND_chaco_war_at_1844(Res) :- setof((Start,End),utc_00_44_AND_chaco_war(Start,End),AllINtervals), checkvalidity(1844,AllINtervals,Res).

check_query() :- write('Query = utc_00_44_AND_chaco_war_at_1844'), (utc_00_44_AND_chaco_war_at_1844(true) -> write('\nRes   = true');write('\nRes   = false')).
?- utc_00_44_AND_chaco_war_aux().

