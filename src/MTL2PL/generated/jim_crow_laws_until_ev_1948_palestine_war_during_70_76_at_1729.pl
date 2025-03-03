:- include('database.pl').
jim_crow_laws(Start,End) :- begin('jim_crow_laws',_,_,Start), end('jim_crow_laws',_,_,End), Start=<End.

ev_1948_palestine_war(Start,End) :- begin('ev_1948_palestine_war',_,_,Start), end('ev_1948_palestine_war',_,_,End), Start=<End.

jim_crow_laws_last_till_70_76(Start,End) :- jim_crow_laws(Start1,End1), (End1-Start1)>=70, Start is (Start1+70), End is (End1+1).

jim_crow_laws_until_ev_1948_palestine_war_during_70_76_overlap(Start,End) :- jim_crow_laws_last_till_70_76(Start1,End1), ev_1948_palestine_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

jim_crow_laws_until_ev_1948_palestine_war_during_70_76(Start,End) :- jim_crow_laws(W1,_), jim_crow_laws_until_ev_1948_palestine_war_during_70_76_overlap(Start1,End1), Start is max((Start1-76),W1), End is (End1-70), Start=<End.

jim_crow_laws_until_ev_1948_palestine_war_during_70_76_at_1729(Res) :- setof((Start,End),jim_crow_laws_until_ev_1948_palestine_war_during_70_76(Start,End),AllINtervals), checkvalidity(1729,AllINtervals,Res).

check_query() :- write('Query = jim_crow_laws_until_ev_1948_palestine_war_during_70_76_at_1729'), (jim_crow_laws_until_ev_1948_palestine_war_during_70_76_at_1729(true) -> write('\nRes   = true');write('\nRes   = false')).

