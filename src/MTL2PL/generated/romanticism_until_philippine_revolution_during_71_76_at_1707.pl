:- include('database.pl').
romanticism(Start,End) :- begin('romanticism',_,_,Start), end('romanticism',_,_,End), Start=<End.

philippine_revolution(Start,End) :- begin('philippine_revolution',_,_,Start), end('philippine_revolution',_,_,End), Start=<End.

romanticism_last_till_71_76(Start,End) :- romanticism(Start1,End1), (End1-Start1)>=71, Start is (Start1+71), End is (End1+1).

romanticism_until_philippine_revolution_during_71_76_overlap(Start,End) :- romanticism_last_till_71_76(Start1,End1), philippine_revolution(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

romanticism_until_philippine_revolution_during_71_76(Start,End) :- romanticism(W1,_), romanticism_until_philippine_revolution_during_71_76_overlap(Start1,End1), Start is max((Start1-76),W1), End is (End1-71), Start=<End.

romanticism_until_philippine_revolution_during_71_76_at_1707(Res) :- setof((Start,End),romanticism_until_philippine_revolution_during_71_76(Start,End),AllINtervals), checkvalidity(1707,AllINtervals,Res).

check_query() :- write('Query = romanticism_until_philippine_revolution_during_71_76_at_1707'), (romanticism_until_philippine_revolution_during_71_76_at_1707(true) -> write('\nRes   = true');write('\nRes   = false')).

