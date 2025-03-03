:- include('database.pl').
white__migr_(Start,End) :- begin('white__migr_',_,_,Start), end('white__migr_',_,_,End), Start=<End.

revenge(Start,End) :- begin('revenge',_,_,Start), end('revenge',_,_,End), Start=<End.

generate_facts_white__migr__OR_revenge([]) :- assert(white__migr__OR_revenge(-1,-1)).

generate_facts_white__migr__OR_revenge([(Start,End) | Tail]) :- assert(white__migr__OR_revenge(Start,End)), generate_facts_white__migr__OR_revenge(Tail).

white__migr__OR_revenge_aux() :- findall((Start,End),white__migr_(Start,End),Interval1), findall((Start,End),revenge(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_white__migr__OR_revenge(Interval).

white__migr__OR_revenge_at_2026(Res) :- setof((Start,End),white__migr__OR_revenge(Start,End),AllINtervals), checkvalidity(2026,AllINtervals,Res).

check_query() :- write('Query = white__migr__OR_revenge_at_2026'), (white__migr__OR_revenge_at_2026(true) -> write('\nRes   = true');write('\nRes   = false')).
?- white__migr__OR_revenge_aux().

