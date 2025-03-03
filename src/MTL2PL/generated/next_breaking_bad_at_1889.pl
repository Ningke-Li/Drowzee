:- include('database.pl').
breaking_bad(Start,End) :- begin('breaking_bad',_,_,Start), end('breaking_bad',_,_,End), Start=<End.

next_breaking_bad(Start,End) :- breaking_bad(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_breaking_bad_at_1889(Res) :- setof((Start,End),next_breaking_bad(Start,End),AllINtervals), checkvalidity(1889,AllINtervals,Res).

check_query() :- write('Query = next_breaking_bad_at_1889'), (next_breaking_bad_at_1889(true) -> write('\nRes   = true');write('\nRes   = false')).

