trans_father(Entity_A, Entity_B) :- 
	father(Entity_A, Entity_C),
	father(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_software_engine(Entity_A, Entity_B) :- 
	software_engine(Entity_A, Entity_C),
	software_engine(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_depicted_by(Entity_A, Entity_B) :- 
	depicted_by(Entity_A, Entity_C),
	depicted_by(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_affiliation(Entity_A, Entity_B) :- 
	affiliation(Entity_A, Entity_C),
	affiliation(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_production_company(Entity_A, Entity_B) :- 
	production_company(Entity_A, Entity_C),
	production_company(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_references_work_tradition_or_theory(Entity_A, Entity_B) :- 
	references_work_tradition_or_theory(Entity_A, Entity_C),
	references_work_tradition_or_theory(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_characters(Entity_A, Entity_B) :- 
	characters(Entity_A, Entity_C),
	characters(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_compatible_with(Entity_A, Entity_B) :- 
	compatible_with(Entity_A, Entity_C),
	compatible_with(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_programmed_in(Entity_A, Entity_B) :- 
	programmed_in(Entity_A, Entity_C),
	programmed_in(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_described_by_source(Entity_A, Entity_B) :- 
	described_by_source(Entity_A, Entity_C),
	described_by_source(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_inflows(Entity_A, Entity_B) :- 
	inflows(Entity_A, Entity_C),
	inflows(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_different_from(Entity_A, Entity_B) :- 
	different_from(Entity_A, Entity_C),
	different_from(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_part_of_the_series(Entity_A, Entity_B) :- 
	part_of_the_series(Entity_A, Entity_C),
	part_of_the_series(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_exemplar_of(Entity_A, Entity_B) :- 
	exemplar_of(Entity_A, Entity_C),
	exemplar_of(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_mountain_range(Entity_A, Entity_B) :- 
	mountain_range(Entity_A, Entity_C),
	mountain_range(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_applies_to_jurisdiction(Entity_A, Entity_B) :- 
	applies_to_jurisdiction(Entity_A, Entity_C),
	applies_to_jurisdiction(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_used_by(Entity_A, Entity_B) :- 
	used_by(Entity_A, Entity_C),
	used_by(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_distributary(Entity_A, Entity_B) :- 
	distributary(Entity_A, Entity_C),
	distributary(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_topic_s_main_category(Entity_A, Entity_B) :- 
	topic_s_main_category(Entity_A, Entity_C),
	topic_s_main_category(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_collection(Entity_A, Entity_B) :- 
	collection(Entity_A, Entity_C),
	collection(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_religion_or_worldview(Entity_A, Entity_B) :- 
	religion_or_worldview(Entity_A, Entity_C),
	religion_or_worldview(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_founded_by(Entity_A, Entity_B) :- 
	founded_by(Entity_A, Entity_C),
	founded_by(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_twinned_administrative_body(Entity_A, Entity_B) :- 
	twinned_administrative_body(Entity_A, Entity_C),
	twinned_administrative_body(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_cast_member(Entity_A, Entity_B) :- 
	cast_member(Entity_A, Entity_C),
	cast_member(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_has_part_s_(Entity_A, Entity_B) :- 
	has_part_s_(Entity_A, Entity_C),
	has_part_s_(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_official_religion(Entity_A, Entity_B) :- 
	official_religion(Entity_A, Entity_C),
	official_religion(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_based_on(Entity_A, Entity_B) :- 
	based_on(Entity_A, Entity_C),
	based_on(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_adjacent_building(Entity_A, Entity_B) :- 
	adjacent_building(Entity_A, Entity_C),
	adjacent_building(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_said_to_be_the_same_as(Entity_A, Entity_B) :- 
	said_to_be_the_same_as(Entity_A, Entity_C),
	said_to_be_the_same_as(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_connects_with(Entity_A, Entity_B) :- 
	connects_with(Entity_A, Entity_C),
	connects_with(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_main_subject(Entity_A, Entity_B) :- 
	main_subject(Entity_A, Entity_C),
	main_subject(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_field_of_work(Entity_A, Entity_B) :- 
	field_of_work(Entity_A, Entity_C),
	field_of_work(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_parent_taxon(Entity_A, Entity_B) :- 
	parent_taxon(Entity_A, Entity_C),
	parent_taxon(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_media_franchise(Entity_A, Entity_B) :- 
	media_franchise(Entity_A, Entity_C),
	media_franchise(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_performer(Entity_A, Entity_B) :- 
	performer(Entity_A, Entity_C),
	performer(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_origin_of_the_watercourse(Entity_A, Entity_B) :- 
	origin_of_the_watercourse(Entity_A, Entity_C),
	origin_of_the_watercourse(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_made_from_material(Entity_A, Entity_B) :- 
	made_from_material(Entity_A, Entity_C),
	made_from_material(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_subclass_of(Entity_A, Entity_B) :- 
	subclass_of(Entity_A, Entity_C),
	subclass_of(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_genre(Entity_A, Entity_B) :- 
	genre(Entity_A, Entity_C),
	genre(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_derivative_work(Entity_A, Entity_B) :- 
	derivative_work(Entity_A, Entity_C),
	derivative_work(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_parent_organization(Entity_A, Entity_B) :- 
	parent_organization(Entity_A, Entity_C),
	parent_organization(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_sport(Entity_A, Entity_B) :- 
	sport(Entity_A, Entity_C),
	sport(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_family(Entity_A, Entity_B) :- 
	family(Entity_A, Entity_C),
	family(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_employer(Entity_A, Entity_B) :- 
	employer(Entity_A, Entity_C),
	employer(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_operator(Entity_A, Entity_B) :- 
	operator(Entity_A, Entity_C),
	operator(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_has_effect(Entity_A, Entity_B) :- 
	has_effect(Entity_A, Entity_C),
	has_effect(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_studied_in(Entity_A, Entity_B) :- 
	studied_in(Entity_A, Entity_C),
	studied_in(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_unmarried_partner(Entity_A, Entity_B) :- 
	unmarried_partner(Entity_A, Entity_C),
	unmarried_partner(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_taxonomic_type(Entity_A, Entity_B) :- 
	taxonomic_type(Entity_A, Entity_C),
	taxonomic_type(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_terminus(Entity_A, Entity_B) :- 
	terminus(Entity_A, Entity_C),
	terminus(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_ethnic_group(Entity_A, Entity_B) :- 
	ethnic_group(Entity_A, Entity_C),
	ethnic_group(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_located_in_the_administrative_territorial_entity(Entity_A, Entity_B) :- 
	located_in_the_administrative_territorial_entity(Entity_A, Entity_C),
	located_in_the_administrative_territorial_entity(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_mouth_of_the_watercourse(Entity_A, Entity_B) :- 
	mouth_of_the_watercourse(Entity_A, Entity_C),
	mouth_of_the_watercourse(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_set_in_period(Entity_A, Entity_B) :- 
	set_in_period(Entity_A, Entity_C),
	set_in_period(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_capital(Entity_A, Entity_B) :- 
	capital(Entity_A, Entity_C),
	capital(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_shares_border_with(Entity_A, Entity_B) :- 
	shares_border_with(Entity_A, Entity_C),
	shares_border_with(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_award_received(Entity_A, Entity_B) :- 
	award_received(Entity_A, Entity_C),
	award_received(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_time_period(Entity_A, Entity_B) :- 
	time_period(Entity_A, Entity_C),
	time_period(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_uses(Entity_A, Entity_B) :- 
	uses(Entity_A, Entity_C),
	uses(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_significant_drug_interaction(Entity_A, Entity_B) :- 
	significant_drug_interaction(Entity_A, Entity_C),
	significant_drug_interaction(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_headquarters_location(Entity_A, Entity_B) :- 
	headquarters_location(Entity_A, Entity_C),
	headquarters_location(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_location(Entity_A, Entity_B) :- 
	location(Entity_A, Entity_C),
	location(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_supports_programming_language(Entity_A, Entity_B) :- 
	supports_programming_language(Entity_A, Entity_C),
	supports_programming_language(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_member_of(Entity_A, Entity_B) :- 
	member_of(Entity_A, Entity_C),
	member_of(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_facet_of(Entity_A, Entity_B) :- 
	facet_of(Entity_A, Entity_C),
	facet_of(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_basic_form_of_government(Entity_A, Entity_B) :- 
	basic_form_of_government(Entity_A, Entity_C),
	basic_form_of_government(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_original_broadcaster(Entity_A, Entity_B) :- 
	original_broadcaster(Entity_A, Entity_C),
	original_broadcaster(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_terminus_location(Entity_A, Entity_B) :- 
	terminus_location(Entity_A, Entity_C),
	terminus_location(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_has_use(Entity_A, Entity_B) :- 
	has_use(Entity_A, Entity_C),
	has_use(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_field_of_this_occupation(Entity_A, Entity_B) :- 
	field_of_this_occupation(Entity_A, Entity_C),
	field_of_this_occupation(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_located_in_or_next_to_body_of_water(Entity_A, Entity_B) :- 
	located_in_or_next_to_body_of_water(Entity_A, Entity_C),
	located_in_or_next_to_body_of_water(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_replaces(Entity_A, Entity_B) :- 
	replaces(Entity_A, Entity_C),
	replaces(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_developer(Entity_A, Entity_B) :- 
	developer(Entity_A, Entity_C),
	developer(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_worshipped_by(Entity_A, Entity_B) :- 
	worshipped_by(Entity_A, Entity_C),
	worshipped_by(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_followed_by(Entity_A, Entity_B) :- 
	followed_by(Entity_A, Entity_C),
	followed_by(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_partnership_with(Entity_A, Entity_B) :- 
	partnership_with(Entity_A, Entity_C),
	partnership_with(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_generalization_of(Entity_A, Entity_B) :- 
	generalization_of(Entity_A, Entity_C),
	generalization_of(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_filming_location(Entity_A, Entity_B) :- 
	filming_location(Entity_A, Entity_C),
	filming_location(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_mother(Entity_A, Entity_B) :- 
	mother(Entity_A, Entity_C),
	mother(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_director(Entity_A, Entity_B) :- 
	director(Entity_A, Entity_C),
	director(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_instance_of(Entity_A, Entity_B) :- 
	instance_of(Entity_A, Entity_C),
	instance_of(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_published_in(Entity_A, Entity_B) :- 
	published_in(Entity_A, Entity_C),
	published_in(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_follows(Entity_A, Entity_B) :- 
	follows(Entity_A, Entity_C),
	follows(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_distributed_by(Entity_A, Entity_B) :- 
	distributed_by(Entity_A, Entity_C),
	distributed_by(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_platform(Entity_A, Entity_B) :- 
	platform(Entity_A, Entity_C),
	platform(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_located_on_street(Entity_A, Entity_B) :- 
	located_on_street(Entity_A, Entity_C),
	located_on_street(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_partially_coincident_with(Entity_A, Entity_B) :- 
	partially_coincident_with(Entity_A, Entity_C),
	partially_coincident_with(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_samples_from_work(Entity_A, Entity_B) :- 
	samples_from_work(Entity_A, Entity_C),
	samples_from_work(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_plot_expanded_in(Entity_A, Entity_B) :- 
	plot_expanded_in(Entity_A, Entity_C),
	plot_expanded_in(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_statement_is_subject_of(Entity_A, Entity_B) :- 
	statement_is_subject_of(Entity_A, Entity_C),
	statement_is_subject_of(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_capital_of(Entity_A, Entity_B) :- 
	capital_of(Entity_A, Entity_C),
	capital_of(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_contains_the_administrative_territorial_entity(Entity_A, Entity_B) :- 
	contains_the_administrative_territorial_entity(Entity_A, Entity_C),
	contains_the_administrative_territorial_entity(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_replaced_by(Entity_A, Entity_B) :- 
	replaced_by(Entity_A, Entity_C),
	replaced_by(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_country(Entity_A, Entity_B) :- 
	country(Entity_A, Entity_C),
	country(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_investor(Entity_A, Entity_B) :- 
	investor(Entity_A, Entity_C),
	investor(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_has_subsidiary(Entity_A, Entity_B) :- 
	has_subsidiary(Entity_A, Entity_C),
	has_subsidiary(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_tributary(Entity_A, Entity_B) :- 
	tributary(Entity_A, Entity_C),
	tributary(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_contains(Entity_A, Entity_B) :- 
	contains(Entity_A, Entity_C),
	contains(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_creator(Entity_A, Entity_B) :- 
	creator(Entity_A, Entity_C),
	creator(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_owner_of(Entity_A, Entity_B) :- 
	owner_of(Entity_A, Entity_C),
	owner_of(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_significant_event(Entity_A, Entity_B) :- 
	significant_event(Entity_A, Entity_C),
	significant_event(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_opposite_of(Entity_A, Entity_B) :- 
	opposite_of(Entity_A, Entity_C),
	opposite_of(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_child(Entity_A, Entity_B) :- 
	child(Entity_A, Entity_C),
	child(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_significant_person(Entity_A, Entity_B) :- 
	significant_person(Entity_A, Entity_C),
	significant_person(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_lake_on_watercourse(Entity_A, Entity_B) :- 
	lake_on_watercourse(Entity_A, Entity_C),
	lake_on_watercourse(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_edition_or_translation_of(Entity_A, Entity_B) :- 
	edition_or_translation_of(Entity_A, Entity_C),
	edition_or_translation_of(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_influenced_by(Entity_A, Entity_B) :- 
	influenced_by(Entity_A, Entity_C),
	influenced_by(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_owned_by(Entity_A, Entity_B) :- 
	owned_by(Entity_A, Entity_C),
	owned_by(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_practiced_by(Entity_A, Entity_B) :- 
	practiced_by(Entity_A, Entity_C),
	practiced_by(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_outflows(Entity_A, Entity_B) :- 
	outflows(Entity_A, Entity_C),
	outflows(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_spouse(Entity_A, Entity_B) :- 
	spouse(Entity_A, Entity_C),
	spouse(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_located_in_on_physical_feature(Entity_A, Entity_B) :- 
	located_in_on_physical_feature(Entity_A, Entity_C),
	located_in_on_physical_feature(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_drainage_basin(Entity_A, Entity_B) :- 
	drainage_basin(Entity_A, Entity_C),
	drainage_basin(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_mod_of(Entity_A, Entity_B) :- 
	mod_of(Entity_A, Entity_C),
	mod_of(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_has_edition_or_translation(Entity_A, Entity_B) :- 
	has_edition_or_translation(Entity_A, Entity_C),
	has_edition_or_translation(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_territory_overlaps(Entity_A, Entity_B) :- 
	territory_overlaps(Entity_A, Entity_C),
	territory_overlaps(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_partner_in_business_or_sport(Entity_A, Entity_B) :- 
	partner_in_business_or_sport(Entity_A, Entity_C),
	partner_in_business_or_sport(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_diplomatic_relation(Entity_A, Entity_B) :- 
	diplomatic_relation(Entity_A, Entity_C),
	diplomatic_relation(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_named_after(Entity_A, Entity_B) :- 
	named_after(Entity_A, Entity_C),
	named_after(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_participant_in(Entity_A, Entity_B) :- 
	participant_in(Entity_A, Entity_C),
	participant_in(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_takes_place_in_fictional_universe(Entity_A, Entity_B) :- 
	takes_place_in_fictional_universe(Entity_A, Entity_C),
	takes_place_in_fictional_universe(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_inspired_by(Entity_A, Entity_B) :- 
	inspired_by(Entity_A, Entity_C),
	inspired_by(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_present_in_work(Entity_A, Entity_B) :- 
	present_in_work(Entity_A, Entity_C),
	present_in_work(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_has_characteristic(Entity_A, Entity_B) :- 
	has_characteristic(Entity_A, Entity_C),
	has_characteristic(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_part_of(Entity_A, Entity_B) :- 
	part_of(Entity_A, Entity_C),
	part_of(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_set_during_recurring_event(Entity_A, Entity_B) :- 
	set_during_recurring_event(Entity_A, Entity_C),
	set_during_recurring_event(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_sibling(Entity_A, Entity_B) :- 
	sibling(Entity_A, Entity_C),
	sibling(Entity_C, Entity_B),
	Entity_A \= Entity_B.

trans_depicts(Entity_A, Entity_B) :- 
	depicts(Entity_A, Entity_C),
	depicts(Entity_C, Entity_B),
	Entity_A \= Entity_B.

