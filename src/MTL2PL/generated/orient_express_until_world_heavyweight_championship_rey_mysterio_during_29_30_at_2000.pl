:- include('database.pl').
orient_express(Start,End) :- begin('orient_express',_,_,Start), end('orient_express',_,_,End), Start=<End.

world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

orient_express_last_till_29_30(Start,End) :- orient_express(Start1,End1), (End1-Start1)>=29, Start is (Start1+29), End is (End1+1).

orient_express_until_world_heavyweight_championship_rey_mysterio_during_29_30_overlap(Start,End) :- orient_express_last_till_29_30(Start1,End1), world_heavyweight_championship_rey_mysterio(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

orient_express_until_world_heavyweight_championship_rey_mysterio_during_29_30(Start,End) :- orient_express(W1,_), orient_express_until_world_heavyweight_championship_rey_mysterio_during_29_30_overlap(Start1,End1), Start is max((Start1-30),W1), End is (End1-29), Start=<End.

orient_express_until_world_heavyweight_championship_rey_mysterio_during_29_30_at_2000(Res) :- setof((Start,End),orient_express_until_world_heavyweight_championship_rey_mysterio_during_29_30(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = orient_express_until_world_heavyweight_championship_rey_mysterio_during_29_30_at_2000'), (orient_express_until_world_heavyweight_championship_rey_mysterio_during_29_30_at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).

