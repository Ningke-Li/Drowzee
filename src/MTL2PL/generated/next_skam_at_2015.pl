:- include('database.pl').
skam(Start,End) :- begin('skam',_,_,Start), end('skam',_,_,End), Start=<End.

next_skam(Start,End) :- skam(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_skam_at_2015(Res) :- setof((Start,End),next_skam(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = next_skam_at_2015'), (next_skam_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).

