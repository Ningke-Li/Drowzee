:- include('database.pl').
csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

westgate_shopping_mall_shooting(Start,End) :- begin('westgate_shopping_mall_shooting',_,_,Start), end('westgate_shopping_mall_shooting',_,_,End), Start=<End.

generate_facts_csi__miami_OR_westgate_shopping_mall_shooting([]) :- assert(csi__miami_OR_westgate_shopping_mall_shooting(-1,-1)).

generate_facts_csi__miami_OR_westgate_shopping_mall_shooting([(Start,End) | Tail]) :- assert(csi__miami_OR_westgate_shopping_mall_shooting(Start,End)), generate_facts_csi__miami_OR_westgate_shopping_mall_shooting(Tail).

csi__miami_OR_westgate_shopping_mall_shooting_aux() :- findall((Start,End),csi__miami(Start,End),Interval1), findall((Start,End),westgate_shopping_mall_shooting(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_csi__miami_OR_westgate_shopping_mall_shooting(Interval).

csi__miami_OR_westgate_shopping_mall_shooting_at_2054(Res) :- setof((Start,End),csi__miami_OR_westgate_shopping_mall_shooting(Start,End),AllINtervals), checkvalidity(2054,AllINtervals,Res).

check_query() :- write('Query = csi__miami_OR_westgate_shopping_mall_shooting_at_2054'), (csi__miami_OR_westgate_shopping_mall_shooting_at_2054(true) -> write('\nRes   = true');write('\nRes   = false')).
?- csi__miami_OR_westgate_shopping_mall_shooting_aux().

