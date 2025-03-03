:- include('database.pl').
indian_independence_movement(Start,End) :- begin('indian_independence_movement',_,_,Start), end('indian_independence_movement',_,_,End), Start=<End.

indonesian_national_revolution(Start,End) :- begin('indonesian_national_revolution',_,_,Start), end('indonesian_national_revolution',_,_,End), Start=<End.

indian_independence_movement_last_till_57_63(Start,End) :- indian_independence_movement(Start1,End1), (End1-Start1)>=57, Start is (Start1+57), End is (End1+1).

indian_independence_movement_until_indonesian_national_revolution_during_57_63_overlap(Start,End) :- indian_independence_movement_last_till_57_63(Start1,End1), indonesian_national_revolution(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

indian_independence_movement_until_indonesian_national_revolution_during_57_63(Start,End) :- indian_independence_movement(W1,_), indian_independence_movement_until_indonesian_national_revolution_during_57_63_overlap(Start1,End1), Start is max((Start1-63),W1), End is (End1-57), Start=<End.

indian_independence_movement_until_indonesian_national_revolution_during_57_63_at_1887(Res) :- setof((Start,End),indian_independence_movement_until_indonesian_national_revolution_during_57_63(Start,End),AllINtervals), checkvalidity(1887,AllINtervals,Res).

check_query() :- write('Query = indian_independence_movement_until_indonesian_national_revolution_during_57_63_at_1887'), (indian_independence_movement_until_indonesian_national_revolution_during_57_63_at_1887(true) -> write('\nRes   = true');write('\nRes   = false')).

