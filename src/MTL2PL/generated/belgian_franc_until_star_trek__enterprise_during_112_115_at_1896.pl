:- include('database.pl').
belgian_franc(Start,End) :- begin('belgian_franc',_,_,Start), end('belgian_franc',_,_,End), Start=<End.

star_trek__enterprise(Start,End) :- begin('star_trek__enterprise',_,_,Start), end('star_trek__enterprise',_,_,End), Start=<End.

belgian_franc_last_till_112_115(Start,End) :- belgian_franc(Start1,End1), (End1-Start1)>=112, Start is (Start1+112), End is (End1+1).

belgian_franc_until_star_trek__enterprise_during_112_115_overlap(Start,End) :- belgian_franc_last_till_112_115(Start1,End1), star_trek__enterprise(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

belgian_franc_until_star_trek__enterprise_during_112_115(Start,End) :- belgian_franc(W1,_), belgian_franc_until_star_trek__enterprise_during_112_115_overlap(Start1,End1), Start is max((Start1-115),W1), End is (End1-112), Start=<End.

belgian_franc_until_star_trek__enterprise_during_112_115_at_1896(Res) :- setof((Start,End),belgian_franc_until_star_trek__enterprise_during_112_115(Start,End),AllINtervals), checkvalidity(1896,AllINtervals,Res).

check_query() :- write('Query = belgian_franc_until_star_trek__enterprise_during_112_115_at_1896'), (belgian_franc_until_star_trek__enterprise_during_112_115_at_1896(true) -> write('\nRes   = true');write('\nRes   = false')).

