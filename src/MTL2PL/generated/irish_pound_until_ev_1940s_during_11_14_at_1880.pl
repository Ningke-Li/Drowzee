:- include('database.pl').
irish_pound(Start,End) :- begin('irish_pound',_,_,Start), end('irish_pound',_,_,End), Start=<End.

ev_1940s(Start,End) :- begin('ev_1940s',_,_,Start), end('ev_1940s',_,_,End), Start=<End.

irish_pound_last_till_11_14(Start,End) :- irish_pound(Start1,End1), (End1-Start1)>=11, Start is (Start1+11), End is (End1+1).

irish_pound_until_ev_1940s_during_11_14_overlap(Start,End) :- irish_pound_last_till_11_14(Start1,End1), ev_1940s(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

irish_pound_until_ev_1940s_during_11_14(Start,End) :- irish_pound(W1,_), irish_pound_until_ev_1940s_during_11_14_overlap(Start1,End1), Start is max((Start1-14),W1), End is (End1-11), Start=<End.

irish_pound_until_ev_1940s_during_11_14_at_1880(Res) :- setof((Start,End),irish_pound_until_ev_1940s_during_11_14(Start,End),AllINtervals), checkvalidity(1880,AllINtervals,Res).

check_query() :- write('Query = irish_pound_until_ev_1940s_during_11_14_at_1880'), (irish_pound_until_ev_1940s_during_11_14_at_1880(true) -> write('\nRes   = true');write('\nRes   = false')).

