:- include('database.pl').
grimm(Start,End) :- begin('grimm',_,_,Start), end('grimm',_,_,End), Start=<End.

next_grimm(Start,End) :- grimm(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_grimm_at_2012(Res) :- setof((Start,End),next_grimm(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = next_grimm_at_2012'), (next_grimm_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

