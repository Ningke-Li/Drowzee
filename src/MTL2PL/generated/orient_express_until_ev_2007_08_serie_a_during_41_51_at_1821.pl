:- include('database.pl').
orient_express(Start,End) :- begin('orient_express',_,_,Start), end('orient_express',_,_,End), Start=<End.

ev_2007_08_serie_a(Start,End) :- begin('ev_2007_08_serie_a',_,_,Start), end('ev_2007_08_serie_a',_,_,End), Start=<End.

orient_express_last_till_41_51(Start,End) :- orient_express(Start1,End1), (End1-Start1)>=41, Start is (Start1+41), End is (End1+1).

orient_express_until_ev_2007_08_serie_a_during_41_51_overlap(Start,End) :- orient_express_last_till_41_51(Start1,End1), ev_2007_08_serie_a(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

orient_express_until_ev_2007_08_serie_a_during_41_51(Start,End) :- orient_express(W1,_), orient_express_until_ev_2007_08_serie_a_during_41_51_overlap(Start1,End1), Start is max((Start1-51),W1), End is (End1-41), Start=<End.

orient_express_until_ev_2007_08_serie_a_during_41_51_at_1821(Res) :- setof((Start,End),orient_express_until_ev_2007_08_serie_a_during_41_51(Start,End),AllINtervals), checkvalidity(1821,AllINtervals,Res).

check_query() :- write('Query = orient_express_until_ev_2007_08_serie_a_during_41_51_at_1821'), (orient_express_until_ev_2007_08_serie_a_during_41_51_at_1821(true) -> write('\nRes   = true');write('\nRes   = false')).

