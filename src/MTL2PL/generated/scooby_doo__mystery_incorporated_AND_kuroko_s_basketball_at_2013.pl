:- include('database.pl').
scooby_doo__mystery_incorporated(Start,End) :- begin('scooby_doo__mystery_incorporated',_,_,Start), end('scooby_doo__mystery_incorporated',_,_,End), Start=<End.

kuroko_s_basketball(Start,End) :- begin('kuroko_s_basketball',_,_,Start), end('kuroko_s_basketball',_,_,End), Start=<End.

generate_facts_scooby_doo__mystery_incorporated_AND_kuroko_s_basketball([]) :- assert(scooby_doo__mystery_incorporated_AND_kuroko_s_basketball(-1,-1)).

generate_facts_scooby_doo__mystery_incorporated_AND_kuroko_s_basketball([(Start,End) | Tail]) :- assert(scooby_doo__mystery_incorporated_AND_kuroko_s_basketball(Start,End)), generate_facts_scooby_doo__mystery_incorporated_AND_kuroko_s_basketball(Tail).

scooby_doo__mystery_incorporated_AND_kuroko_s_basketball_aux() :- findall((Start,End),scooby_doo__mystery_incorporated(Start,End),Interval1), findall((Start,End),kuroko_s_basketball(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_scooby_doo__mystery_incorporated_AND_kuroko_s_basketball(Interval).

scooby_doo__mystery_incorporated_AND_kuroko_s_basketball_at_2013(Res) :- setof((Start,End),scooby_doo__mystery_incorporated_AND_kuroko_s_basketball(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = scooby_doo__mystery_incorporated_AND_kuroko_s_basketball_at_2013'), (scooby_doo__mystery_incorporated_AND_kuroko_s_basketball_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).
?- scooby_doo__mystery_incorporated_AND_kuroko_s_basketball_aux().

