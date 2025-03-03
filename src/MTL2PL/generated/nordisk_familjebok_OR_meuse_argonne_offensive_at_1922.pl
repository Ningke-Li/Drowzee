:- include('database.pl').
nordisk_familjebok(Start,End) :- begin('nordisk_familjebok',_,_,Start), end('nordisk_familjebok',_,_,End), Start=<End.

meuse_argonne_offensive(Start,End) :- begin('meuse_argonne_offensive',_,_,Start), end('meuse_argonne_offensive',_,_,End), Start=<End.

generate_facts_nordisk_familjebok_OR_meuse_argonne_offensive([]) :- assert(nordisk_familjebok_OR_meuse_argonne_offensive(-1,-1)).

generate_facts_nordisk_familjebok_OR_meuse_argonne_offensive([(Start,End) | Tail]) :- assert(nordisk_familjebok_OR_meuse_argonne_offensive(Start,End)), generate_facts_nordisk_familjebok_OR_meuse_argonne_offensive(Tail).

nordisk_familjebok_OR_meuse_argonne_offensive_aux() :- findall((Start,End),nordisk_familjebok(Start,End),Interval1), findall((Start,End),meuse_argonne_offensive(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_nordisk_familjebok_OR_meuse_argonne_offensive(Interval).

nordisk_familjebok_OR_meuse_argonne_offensive_at_1922(Res) :- setof((Start,End),nordisk_familjebok_OR_meuse_argonne_offensive(Start,End),AllINtervals), checkvalidity(1922,AllINtervals,Res).

check_query() :- write('Query = nordisk_familjebok_OR_meuse_argonne_offensive_at_1922'), (nordisk_familjebok_OR_meuse_argonne_offensive_at_1922(true) -> write('\nRes   = true');write('\nRes   = false')).
?- nordisk_familjebok_OR_meuse_argonne_offensive_aux().

