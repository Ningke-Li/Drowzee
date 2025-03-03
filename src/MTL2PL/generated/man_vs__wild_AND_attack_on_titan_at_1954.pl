:- include('database.pl').
man_vs__wild(Start,End) :- begin('man_vs__wild',_,_,Start), end('man_vs__wild',_,_,End), Start=<End.

attack_on_titan(Start,End) :- begin('attack_on_titan',_,_,Start), end('attack_on_titan',_,_,End), Start=<End.

generate_facts_man_vs__wild_AND_attack_on_titan([]) :- assert(man_vs__wild_AND_attack_on_titan(-1,-1)).

generate_facts_man_vs__wild_AND_attack_on_titan([(Start,End) | Tail]) :- assert(man_vs__wild_AND_attack_on_titan(Start,End)), generate_facts_man_vs__wild_AND_attack_on_titan(Tail).

man_vs__wild_AND_attack_on_titan_aux() :- findall((Start,End),man_vs__wild(Start,End),Interval1), findall((Start,End),attack_on_titan(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_man_vs__wild_AND_attack_on_titan(Interval).

man_vs__wild_AND_attack_on_titan_at_1954(Res) :- setof((Start,End),man_vs__wild_AND_attack_on_titan(Start,End),AllINtervals), checkvalidity(1954,AllINtervals,Res).

check_query() :- write('Query = man_vs__wild_AND_attack_on_titan_at_1954'), (man_vs__wild_AND_attack_on_titan_at_1954(true) -> write('\nRes   = true');write('\nRes   = false')).
?- man_vs__wild_AND_attack_on_titan_aux().

