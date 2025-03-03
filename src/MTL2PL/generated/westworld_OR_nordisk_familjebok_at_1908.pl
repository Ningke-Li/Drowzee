:- include('database.pl').
westworld(Start,End) :- begin('westworld',_,_,Start), end('westworld',_,_,End), Start=<End.

nordisk_familjebok(Start,End) :- begin('nordisk_familjebok',_,_,Start), end('nordisk_familjebok',_,_,End), Start=<End.

generate_facts_westworld_OR_nordisk_familjebok([]) :- assert(westworld_OR_nordisk_familjebok(-1,-1)).

generate_facts_westworld_OR_nordisk_familjebok([(Start,End) | Tail]) :- assert(westworld_OR_nordisk_familjebok(Start,End)), generate_facts_westworld_OR_nordisk_familjebok(Tail).

westworld_OR_nordisk_familjebok_aux() :- findall((Start,End),westworld(Start,End),Interval1), findall((Start,End),nordisk_familjebok(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_westworld_OR_nordisk_familjebok(Interval).

westworld_OR_nordisk_familjebok_at_1908(Res) :- setof((Start,End),westworld_OR_nordisk_familjebok(Start,End),AllINtervals), checkvalidity(1908,AllINtervals,Res).

check_query() :- write('Query = westworld_OR_nordisk_familjebok_at_1908'), (westworld_OR_nordisk_familjebok_at_1908(true) -> write('\nRes   = true');write('\nRes   = false')).
?- westworld_OR_nordisk_familjebok_aux().

