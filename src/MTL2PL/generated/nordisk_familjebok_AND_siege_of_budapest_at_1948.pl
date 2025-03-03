:- include('database.pl').
nordisk_familjebok(Start,End) :- begin('nordisk_familjebok',_,_,Start), end('nordisk_familjebok',_,_,End), Start=<End.

siege_of_budapest(Start,End) :- begin('siege_of_budapest',_,_,Start), end('siege_of_budapest',_,_,End), Start=<End.

generate_facts_nordisk_familjebok_AND_siege_of_budapest([]) :- assert(nordisk_familjebok_AND_siege_of_budapest(-1,-1)).

generate_facts_nordisk_familjebok_AND_siege_of_budapest([(Start,End) | Tail]) :- assert(nordisk_familjebok_AND_siege_of_budapest(Start,End)), generate_facts_nordisk_familjebok_AND_siege_of_budapest(Tail).

nordisk_familjebok_AND_siege_of_budapest_aux() :- findall((Start,End),nordisk_familjebok(Start,End),Interval1), findall((Start,End),siege_of_budapest(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_nordisk_familjebok_AND_siege_of_budapest(Interval).

nordisk_familjebok_AND_siege_of_budapest_at_1948(Res) :- setof((Start,End),nordisk_familjebok_AND_siege_of_budapest(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = nordisk_familjebok_AND_siege_of_budapest_at_1948'), (nordisk_familjebok_AND_siege_of_budapest_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).
?- nordisk_familjebok_AND_siege_of_budapest_aux().

