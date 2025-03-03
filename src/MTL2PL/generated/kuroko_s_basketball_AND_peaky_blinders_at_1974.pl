:- include('database.pl').
kuroko_s_basketball(Start,End) :- begin('kuroko_s_basketball',_,_,Start), end('kuroko_s_basketball',_,_,End), Start=<End.

peaky_blinders(Start,End) :- begin('peaky_blinders',_,_,Start), end('peaky_blinders',_,_,End), Start=<End.

generate_facts_kuroko_s_basketball_AND_peaky_blinders([]) :- assert(kuroko_s_basketball_AND_peaky_blinders(-1,-1)).

generate_facts_kuroko_s_basketball_AND_peaky_blinders([(Start,End) | Tail]) :- assert(kuroko_s_basketball_AND_peaky_blinders(Start,End)), generate_facts_kuroko_s_basketball_AND_peaky_blinders(Tail).

kuroko_s_basketball_AND_peaky_blinders_aux() :- findall((Start,End),kuroko_s_basketball(Start,End),Interval1), findall((Start,End),peaky_blinders(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_kuroko_s_basketball_AND_peaky_blinders(Interval).

kuroko_s_basketball_AND_peaky_blinders_at_1974(Res) :- setof((Start,End),kuroko_s_basketball_AND_peaky_blinders(Start,End),AllINtervals), checkvalidity(1974,AllINtervals,Res).

check_query() :- write('Query = kuroko_s_basketball_AND_peaky_blinders_at_1974'), (kuroko_s_basketball_AND_peaky_blinders_at_1974(true) -> write('\nRes   = true');write('\nRes   = false')).
?- kuroko_s_basketball_AND_peaky_blinders_aux().

