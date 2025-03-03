:- include('database.pl').
battle_of_smolensk(Start,End) :- begin('battle_of_smolensk',_,_,Start), end('battle_of_smolensk',_,_,End), Start=<End.

csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

generate_facts_battle_of_smolensk_OR_csi__miami([]) :- assert(battle_of_smolensk_OR_csi__miami(-1,-1)).

generate_facts_battle_of_smolensk_OR_csi__miami([(Start,End) | Tail]) :- assert(battle_of_smolensk_OR_csi__miami(Start,End)), generate_facts_battle_of_smolensk_OR_csi__miami(Tail).

battle_of_smolensk_OR_csi__miami_aux() :- findall((Start,End),battle_of_smolensk(Start,End),Interval1), findall((Start,End),csi__miami(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_smolensk_OR_csi__miami(Interval).

battle_of_smolensk_OR_csi__miami_at_2026(Res) :- setof((Start,End),battle_of_smolensk_OR_csi__miami(Start,End),AllINtervals), checkvalidity(2026,AllINtervals,Res).

check_query() :- write('Query = battle_of_smolensk_OR_csi__miami_at_2026'), (battle_of_smolensk_OR_csi__miami_at_2026(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_smolensk_OR_csi__miami_aux().

