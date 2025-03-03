:- include('database.pl').
the_vampire_diaries(Start,End) :- begin('the_vampire_diaries',_,_,Start), end('the_vampire_diaries',_,_,End), Start=<End.

next_the_vampire_diaries(Start,End) :- the_vampire_diaries(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_the_vampire_diaries_at_1977(Res) :- setof((Start,End),next_the_vampire_diaries(Start,End),AllINtervals), checkvalidity(1977,AllINtervals,Res).

check_query() :- write('Query = next_the_vampire_diaries_at_1977'), (next_the_vampire_diaries_at_1977(true) -> write('\nRes   = true');write('\nRes   = false')).

