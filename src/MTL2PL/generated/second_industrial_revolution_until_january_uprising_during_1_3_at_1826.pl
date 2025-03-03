:- include('database.pl').
second_industrial_revolution(Start,End) :- begin('second_industrial_revolution',_,_,Start), end('second_industrial_revolution',_,_,End), Start=<End.

january_uprising(Start,End) :- begin('january_uprising',_,_,Start), end('january_uprising',_,_,End), Start=<End.

second_industrial_revolution_last_till_1_3(Start,End) :- second_industrial_revolution(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

second_industrial_revolution_until_january_uprising_during_1_3_overlap(Start,End) :- second_industrial_revolution_last_till_1_3(Start1,End1), january_uprising(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

second_industrial_revolution_until_january_uprising_during_1_3(Start,End) :- second_industrial_revolution(W1,_), second_industrial_revolution_until_january_uprising_during_1_3_overlap(Start1,End1), Start is max((Start1-3),W1), End is (End1-1), Start=<End.

second_industrial_revolution_until_january_uprising_during_1_3_at_1826(Res) :- setof((Start,End),second_industrial_revolution_until_january_uprising_during_1_3(Start,End),AllINtervals), checkvalidity(1826,AllINtervals,Res).

check_query() :- write('Query = second_industrial_revolution_until_january_uprising_during_1_3_at_1826'), (second_industrial_revolution_until_january_uprising_during_1_3_at_1826(true) -> write('\nRes   = true');write('\nRes   = false')).

