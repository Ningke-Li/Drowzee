:- include('database.pl').
copa_am_rica_centenario(Start,End) :- begin('copa_am_rica_centenario',_,_,Start), end('copa_am_rica_centenario',_,_,End), Start=<End.

next_copa_am_rica_centenario(Start,End) :- copa_am_rica_centenario(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_copa_am_rica_centenario_at_1929(Res) :- setof((Start,End),next_copa_am_rica_centenario(Start,End),AllINtervals), checkvalidity(1929,AllINtervals,Res).

check_query() :- write('Query = next_copa_am_rica_centenario_at_1929'), (next_copa_am_rica_centenario_at_1929(true) -> write('\nRes   = true');write('\nRes   = false')).

