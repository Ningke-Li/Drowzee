:- include('database.pl').
nordisk_familjebok(Start,End) :- begin('nordisk_familjebok',_,_,Start), end('nordisk_familjebok',_,_,End), Start=<End.

world_war_ii_in_yugoslavia(Start,End) :- begin('world_war_ii_in_yugoslavia',_,_,Start), end('world_war_ii_in_yugoslavia',_,_,End), Start=<End.

nordisk_familjebok_last_till_56_61(Start,End) :- nordisk_familjebok(Start1,End1), (End1-Start1)>=56, Start is (Start1+56), End is (End1+1).

nordisk_familjebok_until_world_war_ii_in_yugoslavia_during_56_61_overlap(Start,End) :- nordisk_familjebok_last_till_56_61(Start1,End1), world_war_ii_in_yugoslavia(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

nordisk_familjebok_until_world_war_ii_in_yugoslavia_during_56_61(Start,End) :- nordisk_familjebok(W1,_), nordisk_familjebok_until_world_war_ii_in_yugoslavia_during_56_61_overlap(Start1,End1), Start is max((Start1-61),W1), End is (End1-56), Start=<End.

nordisk_familjebok_until_world_war_ii_in_yugoslavia_during_56_61_at_1884(Res) :- setof((Start,End),nordisk_familjebok_until_world_war_ii_in_yugoslavia_during_56_61(Start,End),AllINtervals), checkvalidity(1884,AllINtervals,Res).

check_query() :- write('Query = nordisk_familjebok_until_world_war_ii_in_yugoslavia_during_56_61_at_1884'), (nordisk_familjebok_until_world_war_ii_in_yugoslavia_during_56_61_at_1884(true) -> write('\nRes   = true');write('\nRes   = false')).

