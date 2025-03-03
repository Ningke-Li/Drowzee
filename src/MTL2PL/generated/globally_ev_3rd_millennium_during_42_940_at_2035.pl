:- include('database.pl').
ev_3rd_millennium(Start,End) :- begin('ev_3rd_millennium',_,_,Start), end('ev_3rd_millennium',_,_,End), Start=<End.

globally_ev_3rd_millennium_during_42_940(Start,End) :- ev_3rd_millennium(Start1,End1), Start is (Start1-42), End is (End1-940), Start=<End.

globally_ev_3rd_millennium_during_42_940_at_2035(Res) :- setof((Start,End),globally_ev_3rd_millennium_during_42_940(Start,End),AllINtervals), checkvalidity(2035,AllINtervals,Res).

check_query() :- write('Query = globally_ev_3rd_millennium_during_42_940_at_2035'), (globally_ev_3rd_millennium_during_42_940_at_2035(true) -> write('\nRes   = true');write('\nRes   = false')).

