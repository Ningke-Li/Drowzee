:- include('database.pl').
new_girl(Start,End) :- begin('new_girl',_,_,Start), end('new_girl',_,_,End), Start=<End.

kuroko_s_basketball(Start,End) :- begin('kuroko_s_basketball',_,_,Start), end('kuroko_s_basketball',_,_,End), Start=<End.

generate_facts_new_girl_AND_kuroko_s_basketball([]) :- assert(new_girl_AND_kuroko_s_basketball(-1,-1)).

generate_facts_new_girl_AND_kuroko_s_basketball([(Start,End) | Tail]) :- assert(new_girl_AND_kuroko_s_basketball(Start,End)), generate_facts_new_girl_AND_kuroko_s_basketball(Tail).

new_girl_AND_kuroko_s_basketball_aux() :- findall((Start,End),new_girl(Start,End),Interval1), findall((Start,End),kuroko_s_basketball(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_new_girl_AND_kuroko_s_basketball(Interval).

new_girl_AND_kuroko_s_basketball_at_2013(Res) :- setof((Start,End),new_girl_AND_kuroko_s_basketball(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = new_girl_AND_kuroko_s_basketball_at_2013'), (new_girl_AND_kuroko_s_basketball_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).
?- new_girl_AND_kuroko_s_basketball_aux().

