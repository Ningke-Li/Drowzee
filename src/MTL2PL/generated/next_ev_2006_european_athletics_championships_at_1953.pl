:- include('database.pl').
ev_2006_european_athletics_championships(Start,End) :- begin('ev_2006_european_athletics_championships',_,_,Start), end('ev_2006_european_athletics_championships',_,_,End), Start=<End.

next_ev_2006_european_athletics_championships(Start,End) :- ev_2006_european_athletics_championships(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2006_european_athletics_championships_at_1953(Res) :- setof((Start,End),next_ev_2006_european_athletics_championships(Start,End),AllINtervals), checkvalidity(1953,AllINtervals,Res).

check_query() :- write('Query = next_ev_2006_european_athletics_championships_at_1953'), (next_ev_2006_european_athletics_championships_at_1953(true) -> write('\nRes   = true');write('\nRes   = false')).

