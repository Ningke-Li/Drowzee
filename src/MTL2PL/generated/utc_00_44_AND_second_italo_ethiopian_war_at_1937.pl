:- include('database.pl').
utc_00_44(Start,End) :- begin('utc_00_44',_,_,Start), end('utc_00_44',_,_,End), Start=<End.

second_italo_ethiopian_war(Start,End) :- begin('second_italo_ethiopian_war',_,_,Start), end('second_italo_ethiopian_war',_,_,End), Start=<End.

generate_facts_utc_00_44_AND_second_italo_ethiopian_war([]) :- assert(utc_00_44_AND_second_italo_ethiopian_war(-1,-1)).

generate_facts_utc_00_44_AND_second_italo_ethiopian_war([(Start,End) | Tail]) :- assert(utc_00_44_AND_second_italo_ethiopian_war(Start,End)), generate_facts_utc_00_44_AND_second_italo_ethiopian_war(Tail).

utc_00_44_AND_second_italo_ethiopian_war_aux() :- findall((Start,End),utc_00_44(Start,End),Interval1), findall((Start,End),second_italo_ethiopian_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_utc_00_44_AND_second_italo_ethiopian_war(Interval).

utc_00_44_AND_second_italo_ethiopian_war_at_1937(Res) :- setof((Start,End),utc_00_44_AND_second_italo_ethiopian_war(Start,End),AllINtervals), checkvalidity(1937,AllINtervals,Res).

check_query() :- write('Query = utc_00_44_AND_second_italo_ethiopian_war_at_1937'), (utc_00_44_AND_second_italo_ethiopian_war_at_1937(true) -> write('\nRes   = true');write('\nRes   = false')).
?- utc_00_44_AND_second_italo_ethiopian_war_aux().

