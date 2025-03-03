:- include('database.pl').
new_imperialism(Start,End) :- begin('new_imperialism',_,_,Start), end('new_imperialism',_,_,End), Start=<End.

cuban_war_of_independence(Start,End) :- begin('cuban_war_of_independence',_,_,Start), end('cuban_war_of_independence',_,_,End), Start=<End.

new_imperialism_last_till_14_23(Start,End) :- new_imperialism(Start1,End1), (End1-Start1)>=14, Start is (Start1+14), End is (End1+1).

new_imperialism_until_cuban_war_of_independence_during_14_23_overlap(Start,End) :- new_imperialism_last_till_14_23(Start1,End1), cuban_war_of_independence(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

new_imperialism_until_cuban_war_of_independence_during_14_23(Start,End) :- new_imperialism(W1,_), new_imperialism_until_cuban_war_of_independence_during_14_23_overlap(Start1,End1), Start is max((Start1-23),W1), End is (End1-14), Start=<End.

new_imperialism_until_cuban_war_of_independence_during_14_23_at_1881(Res) :- setof((Start,End),new_imperialism_until_cuban_war_of_independence_during_14_23(Start,End),AllINtervals), checkvalidity(1881,AllINtervals,Res).

check_query() :- write('Query = new_imperialism_until_cuban_war_of_independence_during_14_23_at_1881'), (new_imperialism_until_cuban_war_of_independence_during_14_23_at_1881(true) -> write('\nRes   = true');write('\nRes   = false')).

