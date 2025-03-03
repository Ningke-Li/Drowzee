:- include('database.pl').
codename__kids_next_door(Start,End) :- begin('codename__kids_next_door',_,_,Start), end('codename__kids_next_door',_,_,End), Start=<End.

globally_codename__kids_next_door_during_3_6(Start,End) :- codename__kids_next_door(Start1,End1), Start is (Start1-3), End is (End1-6), Start=<End.

next_globally_codename__kids_next_door_during_3_6(Start,End) :- globally_codename__kids_next_door_during_3_6(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_codename__kids_next_door_during_3_6_at_1995(Res) :- setof((Start,End),next_globally_codename__kids_next_door_during_3_6(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = next_globally_codename__kids_next_door_during_3_6_at_1995'), (next_globally_codename__kids_next_door_during_3_6_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).

