:- include('database.pl').
entourage(Start,End) :- begin('entourage',_,_,Start), end('entourage',_,_,End), Start=<End.

jonas(Start,End) :- begin('jonas',_,_,Start), end('jonas',_,_,End), Start=<End.

entourage_last_till_2_4(Start,End) :- entourage(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

entourage_until_jonas_during_2_4_overlap(Start,End) :- entourage_last_till_2_4(Start1,End1), jonas(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

entourage_until_jonas_during_2_4(Start,End) :- entourage(W1,_), entourage_until_jonas_during_2_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-2), Start=<End.

entourage_until_jonas_during_2_4_at_2006(Res) :- setof((Start,End),entourage_until_jonas_during_2_4(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = entourage_until_jonas_during_2_4_at_2006'), (entourage_until_jonas_during_2_4_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

