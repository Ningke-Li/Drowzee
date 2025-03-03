:- include('database.pl').
dust_bowl(Start,End) :- begin('dust_bowl',_,_,Start), end('dust_bowl',_,_,End), Start=<End.

nordisk_familjebok(Start,End) :- begin('nordisk_familjebok',_,_,Start), end('nordisk_familjebok',_,_,End), Start=<End.

generate_facts_dust_bowl_AND_nordisk_familjebok([]) :- assert(dust_bowl_AND_nordisk_familjebok(-1,-1)).

generate_facts_dust_bowl_AND_nordisk_familjebok([(Start,End) | Tail]) :- assert(dust_bowl_AND_nordisk_familjebok(Start,End)), generate_facts_dust_bowl_AND_nordisk_familjebok(Tail).

dust_bowl_AND_nordisk_familjebok_aux() :- findall((Start,End),dust_bowl(Start,End),Interval1), findall((Start,End),nordisk_familjebok(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_dust_bowl_AND_nordisk_familjebok(Interval).

dust_bowl_AND_nordisk_familjebok_at_1781(Res) :- setof((Start,End),dust_bowl_AND_nordisk_familjebok(Start,End),AllINtervals), checkvalidity(1781,AllINtervals,Res).

check_query() :- write('Query = dust_bowl_AND_nordisk_familjebok_at_1781'), (dust_bowl_AND_nordisk_familjebok_at_1781(true) -> write('\nRes   = true');write('\nRes   = false')).
?- dust_bowl_AND_nordisk_familjebok_aux().

