:- include('database.pl').
the_vampire_diaries(Start,End) :- begin('the_vampire_diaries',_,_,Start), end('the_vampire_diaries',_,_,End), Start=<End.

bates_motel(Start,End) :- begin('bates_motel',_,_,Start), end('bates_motel',_,_,End), Start=<End.

generate_facts_the_vampire_diaries_AND_bates_motel([]) :- assert(the_vampire_diaries_AND_bates_motel(-1,-1)).

generate_facts_the_vampire_diaries_AND_bates_motel([(Start,End) | Tail]) :- assert(the_vampire_diaries_AND_bates_motel(Start,End)), generate_facts_the_vampire_diaries_AND_bates_motel(Tail).

the_vampire_diaries_AND_bates_motel_aux() :- findall((Start,End),the_vampire_diaries(Start,End),Interval1), findall((Start,End),bates_motel(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_vampire_diaries_AND_bates_motel(Interval).

the_vampire_diaries_AND_bates_motel_at_2000(Res) :- setof((Start,End),the_vampire_diaries_AND_bates_motel(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = the_vampire_diaries_AND_bates_motel_at_2000'), (the_vampire_diaries_AND_bates_motel_at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_vampire_diaries_AND_bates_motel_aux().

