:- include('database.pl').
entourage(Start,End) :- begin('entourage',_,_,Start), end('entourage',_,_,End), Start=<End.

kuroko_s_basketball(Start,End) :- begin('kuroko_s_basketball',_,_,Start), end('kuroko_s_basketball',_,_,End), Start=<End.

entourage_last_till_2_4(Start,End) :- entourage(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

entourage_until_kuroko_s_basketball_during_2_4_overlap(Start,End) :- entourage_last_till_2_4(Start1,End1), kuroko_s_basketball(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

entourage_until_kuroko_s_basketball_during_2_4(Start,End) :- entourage(W1,_), entourage_until_kuroko_s_basketball_during_2_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-2), Start=<End.

entourage_until_kuroko_s_basketball_during_2_4_at_2012(Res) :- setof((Start,End),entourage_until_kuroko_s_basketball_during_2_4(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = entourage_until_kuroko_s_basketball_during_2_4_at_2012'), (entourage_until_kuroko_s_basketball_during_2_4_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

