:- include('database.pl').
the_vampire_diaries(Start,End) :- begin('the_vampire_diaries',_,_,Start), end('the_vampire_diaries',_,_,End), Start=<End.

kuroko_s_basketball(Start,End) :- begin('kuroko_s_basketball',_,_,Start), end('kuroko_s_basketball',_,_,End), Start=<End.

generate_facts_the_vampire_diaries_AND_kuroko_s_basketball([]) :- assert(the_vampire_diaries_AND_kuroko_s_basketball(-1,-1)).

generate_facts_the_vampire_diaries_AND_kuroko_s_basketball([(Start,End) | Tail]) :- assert(the_vampire_diaries_AND_kuroko_s_basketball(Start,End)), generate_facts_the_vampire_diaries_AND_kuroko_s_basketball(Tail).

the_vampire_diaries_AND_kuroko_s_basketball_aux() :- findall((Start,End),the_vampire_diaries(Start,End),Interval1), findall((Start,End),kuroko_s_basketball(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_vampire_diaries_AND_kuroko_s_basketball(Interval).

the_vampire_diaries_AND_kuroko_s_basketball_at_1865(Res) :- setof((Start,End),the_vampire_diaries_AND_kuroko_s_basketball(Start,End),AllINtervals), checkvalidity(1865,AllINtervals,Res).

check_query() :- write('Query = the_vampire_diaries_AND_kuroko_s_basketball_at_1865'), (the_vampire_diaries_AND_kuroko_s_basketball_at_1865(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_vampire_diaries_AND_kuroko_s_basketball_aux().

