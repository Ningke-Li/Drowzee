:- include('database.pl').
white__migr_(Start,End) :- begin('white__migr_',_,_,Start), end('white__migr_',_,_,End), Start=<End.

tulip_mania(Start,End) :- begin('tulip_mania',_,_,Start), end('tulip_mania',_,_,End), Start=<End.

generate_facts_white__migr__OR_tulip_mania([]) :- assert(white__migr__OR_tulip_mania(-1,-1)).

generate_facts_white__migr__OR_tulip_mania([(Start,End) | Tail]) :- assert(white__migr__OR_tulip_mania(Start,End)), generate_facts_white__migr__OR_tulip_mania(Tail).

white__migr__OR_tulip_mania_aux() :- findall((Start,End),white__migr_(Start,End),Interval1), findall((Start,End),tulip_mania(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_white__migr__OR_tulip_mania(Interval).

white__migr__OR_tulip_mania_at_1917(Res) :- setof((Start,End),white__migr__OR_tulip_mania(Start,End),AllINtervals), checkvalidity(1917,AllINtervals,Res).

check_query() :- write('Query = white__migr__OR_tulip_mania_at_1917'), (white__migr__OR_tulip_mania_at_1917(true) -> write('\nRes   = true');write('\nRes   = false')).
?- white__migr__OR_tulip_mania_aux().

