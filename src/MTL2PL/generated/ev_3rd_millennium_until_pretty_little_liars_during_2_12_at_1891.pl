:- include('database.pl').
ev_3rd_millennium(Start,End) :- begin('ev_3rd_millennium',_,_,Start), end('ev_3rd_millennium',_,_,End), Start=<End.

pretty_little_liars(Start,End) :- begin('pretty_little_liars',_,_,Start), end('pretty_little_liars',_,_,End), Start=<End.

ev_3rd_millennium_last_till_2_12(Start,End) :- ev_3rd_millennium(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

ev_3rd_millennium_until_pretty_little_liars_during_2_12_overlap(Start,End) :- ev_3rd_millennium_last_till_2_12(Start1,End1), pretty_little_liars(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_3rd_millennium_until_pretty_little_liars_during_2_12(Start,End) :- ev_3rd_millennium(W1,_), ev_3rd_millennium_until_pretty_little_liars_during_2_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-2), Start=<End.

ev_3rd_millennium_until_pretty_little_liars_during_2_12_at_1891(Res) :- setof((Start,End),ev_3rd_millennium_until_pretty_little_liars_during_2_12(Start,End),AllINtervals), checkvalidity(1891,AllINtervals,Res).

check_query() :- write('Query = ev_3rd_millennium_until_pretty_little_liars_during_2_12_at_1891'), (ev_3rd_millennium_until_pretty_little_liars_during_2_12_at_1891(true) -> write('\nRes   = true');write('\nRes   = false')).

