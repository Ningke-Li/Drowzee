:- include('database.pl').
woody_woodpecker(Start,End) :- begin('woody_woodpecker',_,_,Start), end('woody_woodpecker',_,_,End), Start=<End.

first_indochina_war(Start,End) :- begin('first_indochina_war',_,_,Start), end('first_indochina_war',_,_,End), Start=<End.

woody_woodpecker_last_till_1_11(Start,End) :- woody_woodpecker(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

woody_woodpecker_until_first_indochina_war_during_1_11_overlap(Start,End) :- woody_woodpecker_last_till_1_11(Start1,End1), first_indochina_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

woody_woodpecker_until_first_indochina_war_during_1_11(Start,End) :- woody_woodpecker(W1,_), woody_woodpecker_until_first_indochina_war_during_1_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-1), Start=<End.

woody_woodpecker_until_first_indochina_war_during_1_11_at_1952(Res) :- setof((Start,End),woody_woodpecker_until_first_indochina_war_during_1_11(Start,End),AllINtervals), checkvalidity(1952,AllINtervals,Res).

check_query() :- write('Query = woody_woodpecker_until_first_indochina_war_during_1_11_at_1952'), (woody_woodpecker_until_first_indochina_war_during_1_11_at_1952(true) -> write('\nRes   = true');write('\nRes   = false')).

