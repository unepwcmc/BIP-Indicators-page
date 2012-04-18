# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

goals = [
  {:code => 'A', :title => 'Strategic Goal A: Address the underlying causes of biodiversity loss by mainstreaming biodiversity across government and society'},
  {:code => 'B', :title => 'Strategic Goal B: Reduce the direct pressures on biodiversity and promote sustainable use'},
  {:code => 'C', :title => 'Strategic Goal C: To improve the status of biodiversity by safeguarding ecosystems, species and genetic diversity'},
  {:code => 'D', :title => 'Strategic Goal D: Enhance the benefits to all from biodiversity and ecosystem services'},
  {:code => 'E', :title => 'Strategic Goal E: Enhance implementation through participatory planning, knowledge management and capacity building'}
]

targets = [
  {:code => 1, :keyword => 'Awareness of BD values', :title =>'Target 1: By 2020, at the latest, people are aware of the values of biodiversity and the steps they can take to conserve and use it sustainably.'},
  {:code => 2, :keyword => 'Integration of BD values', :title =>'Target 2: By 2020, at the latest, biodiversity values have been integrated into national and local development and poverty reduction strategies and planning processes and are being incorporated into national accounting, as appropriate, and reporting systems.'},
  {:code => 3, :keyword => 'Incentives', :title =>'Target 3: By 2020, at the latest, incentives, including subsidies, harmful to biodiversity are eliminated, phased out or reformed in order to minimize or avoid negative impacts, and positive incentives for the conservation and sustainable use of biodiversity are developed and applied, consistent and in harmony with the Convention and other relevant international obligations, taking into account national socio economic conditions.'},
  {:code => 4, :keyword => 'Use of nat. resources', :title =>'Target 4: By 2020, at the latest, Governments, business and stakeholders at all levels have taken steps to achieve or have implemented plans for sustainable production and consumption and have kept the impacts of use of natural resources well within safe ecological limits.'},
  {:code => 5, :keyword => 'Loss of habitats', :title =>'Target 5: By 2020, the rate of loss of all natural habitats, including forests, is at least halved and where feasible brought close to zero, and degradation and fragmentation is significantly reduced.'},
  {:code => 6, :keyword => 'Sust. fisheries', :title =>'Target 6: By 2020 all fish and invertebrate stocks and aquatic plants are managed and harvested sustainably, legally and applying ecosystem based approaches, so that overfishing is avoided, recovery plans and measures are in place for all depleted species, fisheries have no significant adverse impacts on threatened species and vulnerable ecosystems and the impacts of fisheries on stocks, species and ecosystems are within safe ecological limits.'},
  {:code => 7, :keyword => 'Areas under sust. mgt.', :title =>'Target 7: By 2020 areas under agriculture, aquaculture and forestry are managed sustainably, ensuring conservation of biodiversity.'},
  {:code => 8, :keyword => 'Pollution', :title =>'Target 8: By 2020, pollution, including from excess nutrients, has been brought to levels that are not detrimental to ecosystem function and biodiversity.'},
  {:code => 9, :keyword => 'IAS', :title =>'Target 9: By 2020, invasive alien species and pathways are identified and prioritized, priority species are controlled or eradicated, and measures are in place to manage pathways to prevent their introduction and establishment. '},
  {:code => 10, :keyword => 'Vulnerable eco.', :title =>'Target 10: By 2015, the multiple anthropogenic pressures on coral reefs, and other vulnerable ecosystems impacted by climate change or ocean acidification are minimized, so as to maintain their integrity and functioning.'},
  {:code => 11, :keyword => 'Protected areas', :title =>'Target 11: By 2020, at least 17 per cent of terrestrial and inland water, and 10 per cent of coastal and marine areas, especially areas of particular importance for biodiversity and ecosystem services, are conserved through effectively and equitably managed, ecologically representative and well connected systems of protected areas and other effective area-based conservation measures, and integrated into the wider landscapes and seascapes.'},
  {:code => 12, :keyword => 'Preventing extinctions', :title =>'Target 12: By 2020 the extinction of known threatened species has been prevented and their conservation status, particularly of those most in decline, has been improved and sustained.'},
  {:code => 13, :keyword => 'Agricultural BD', :title =>'Target 13: By 2020, the genetic diversity of cultivated plants and farmed and domesticated animals and of wild relatives, including other socio-economically as well as culturally valuable species, is maintained, and strategies have been developed and implemented for minimizing genetic erosion and safeguarding their genetic diversity.'},
  {:code => 14, :keyword => 'Essential eco. services', :title =>'Target 14: By 2020, ecosystems that provide essential services, including services related to water, and contribute to health, livelihoods and well-being, are restored and safeguarded, taking into account the needs of women, indigenous and local communities, and the poor and vulnerable.'},
  {:code => 15, :keyword => 'BD & carbon stocks', :title =>'Target 15: By 2020, ecosystem resilience and the contribution of biodiversity to carbon stocks has been enhanced, through conservation and restoration, including restoration of at least 15 per cent of degraded ecosystems, thereby contributing to climate change mitigation and adaptation and to combating desertification.'},
  {:code => 16, :keyword => 'ABS implementation', :title =>'Target 16: By 2015, the Nagoya Protocol on Access to Genetic Resources and the Fair and Equitable Sharing of Benefits Arising from their Utilization is in force and operational, consistent with national legislation.'},
  {:code => 17, :keyword => 'NBSAPs', :title =>'Target 17: By 2015 each Party has developed, adopted as a policy instrument, and has commenced implementing an effective, participatory and updated national biodiversity strategy and action plan.'},
  {:code => 18, :keyword => 'Trad. knowledge', :title =>'Target 18: By 2020, the traditional knowledge, innovations and practices of indigenous and local communities relevant for the conservation and sustainable use of biodiversity, and their customary use of biological resources, are respected, subject to national legislation and relevant international obligations, and fully integrated and reflected in the implementation of the Convention with the full and effective participation of indigenous and local communities, at all relevant levels.'},
  {:code => 19, :keyword => 'BD knowledge', :title =>'Target 19: By 2020, knowledge, the science base and technologies relating to biodiversity, its values, functioning, status and trends, and the consequences of its loss, are improved, widely shared and transferred, and applied.'},
  {:code => 20, :keyword => 'Resource mobilization', :title =>'Target 20: By 2020, at the latest, the mobilization of financial resources for effectively implementing the Strategic Plan for Biodiversity 2011-2020 from all sources, and in accordance with the consolidated and agreed process in the Strategy for Resource Mobilization, should increase substantially from the current levels. This target will be subject to changes contingent to resource needs assessments to be developed and reported by Parties.'}
]

headlines = [
  {:code => 1, :title => 'Trends in extent, condition and vulnerability of ecosystems, biomes and habitats', :position =>1},
  {:code => 2, :title => 'Trends in abundance, distribution and extinction risk of species ', :position =>2},
  {:code => 3, :title => 'Trends in genetic diversity of species', :position =>3},
  {:code => 4, :title => 'Trends in pressures from unsustainable agriculture, forestry, fisheries and aquaculture', :position =>4},
  {:code => 5, :title => 'Trends in pressures from habitat conversion, pollution, invasive species, climate change, overexploitation and underlying drivers', :position =>5},
  {:code => 6, :title => 'Trends in distribution, condition and sustainability of ecosystem services for equitable human well-being', :position =>6},
  {:code => 7, :title => 'Trends in awareness, attitudes and public engagement in support of biological diversity and ecosystem services', :position =>7},
  {:code => 8, :title => 'Trends in integration of biodiversity, ecosystem services and benefits sharing into planning, policy formulation and implementation and incentives', :position =>8},
  {:code => 9, :title => 'Trends in access and equity of benefit sharing of genetic resources', :position =>9},
  {:code => 10, :title => 'Trends in accessibility of scientific/technical/traditional knowledge and its application', :position =>10},
  {:code => 11, :title => 'Trends in coverage, condition, representativeness and effectiveness of protected areas and other area-based approaches', :position =>11},
  {:code => 12, :title => 'Trends in mobilisation of financial resources', :position =>12}
]

operational_indicators = [
  {:code => 1, :title => 'Trends in proportion of degraded/threatened habitats'},
  {:code => 2, :title => 'Extinction risk trends of habitat dependent species in each major habitat type'},
  {:code => 3, :title => 'Trends in extent of selected biomes, ecosystems and habitats'},
  {:code => 4, :title => 'Trends in condition and vulnerability of ecosystems'},
  {:code => 5, :title => 'Trends in the proportion of natural habitats converted'},
  {:code => 6, :title => 'Trends in fragmentation of natural habitats'},
  {:code => 7, :title => 'Trends in abundance of selected species'},
  {:code => 8, :title => 'Trends in extinction risk of species'},
  {:code => 9, :title => 'Trends in distribution of selected species'},
  {:code => 10, :title => 'Trends in genetic diversity of cultivated plants, and farmed and domesticated animals and their wild relatives'},
  {:code => 11, :title => 'Trends in genetic diversity of selected species'},
  {:code => 12, :title => 'Trends in primary productivity'},
  {:code => 13, :title => 'Trends in proportion of land affected by desertification'},
  {:code => 14, :title => 'Trends in population of forest and agriculture dependent species in production systems'},
  {:code => 15, :title => 'Trends in production per input'},
  {:code => 16, :title => 'Trends in Ecological Footprint and/or related concepts'},
  {:code => 17, :title => 'Trends in population and extinction risk of utilized species, including species in trade'},
  {:code => 18, :title => 'Ecological limits assessed in terms of sustainable production and consumption'},
  {:code => 19, :title => 'Trends in proportion of products derived from sustainable sources'},
  {:code => 20, :title => 'Trends in catch per unit effort'},
  {:code => 21, :title => 'Trends in fishing effort capacity'},
  {:code => 22, :title => 'Trends in extinction risk of target and bycatch aquatic species'},
  {:code => 23, :title => 'Trends in population of target and bycatch aquatic species'},
  {:code => 24, :title => 'Trends in proportion of utilized stocks outside safe biological limits'},
  {:code => 25, :title => 'Trends in area, frequency, and/or intensity of destructive fishing practices'},
  {:code => 26, :title => 'Population trends of habitat dependent species in each major habitat type'},
  {:code => 27, :title => 'Trends in biodiversity of cities'},
  {:code => 28, :title => 'Trends in the impact of invasive alien species on extinction risk trends'},
  {:code => 29, :title => 'Trends in the economic impacts of selected invasive alien species'},
  {:code => 30, :title => 'Extinction risk trends of coral and reef fish'},
  {:code => 31, :title => 'Trends in climate change impacts on extinction risk'},
  {:code => 32, :title => 'Trends in coral reef condition'},
  {:code => 33, :title => 'Trends in extent, and rate of shifts of boundaries, of vulnerable ecosystems'},
  {:code => 34, :title => 'Trends in climatic impacts on community composition'},
  {:code => 35, :title => 'Trends in climatic impacts on population trends'},
  {:code => 36, :title => 'Trends in number of invasive alien species'},
  {:code => 37, :title => 'Trends in incidence of wildlife diseases caused by invasive alien species'},
  {:code => 38, :title => 'Trends in incidence of hypoxic zones and algal blooms'},
  {:code => 39, :title => 'Trends in water quality in aquatic ecosystems'},
  {:code => 40, :title => 'Impact of pollution on extinction risk trends'},
  {:code => 41, :title => 'Trends in pollution deposition rate'},
  {:code => 42, :title => 'Trends in sediment transfer rates'},
  {:code => 43, :title => 'Trend in emission to the environment of pollutants relevant for biodiversity'},
  {:code => 44, :title => 'Trend in levels of contaminants in wildlife'},
  {:code => 45, :title => 'Trends in nitrogen footprint of consumption activities'},
  {:code => 46, :title => 'Trends in ozone levels in natural ecosystems'},
  {:code => 47, :title => 'Trends in proportion of wastewater discharged after treatment'},
  {:code => 48, :title => 'Trends in UV-radiation levels'},
  {:code => 49, :title => 'Trends in benefits that humans derive from selected ecosystem services'},
  {:code => 50, :title => 'Trends in delivery of multiple ecosystem services'},
  {:code => 51, :title => 'Trends in economic and non-economic values value of selected ecosystem services'},
  {:code => 52, :title => 'Trends in proportion of  the population using improved  water services'},
  {:code => 53, :title => 'Trends in proportion of total freshwater resources used'},
  {:code => 54, :title => 'Trends in health and wellbeing of communities who depend directly on local ecosystem goods and services'},
  {:code => 55, :title => 'Trends in human  and economic losses due to water or natural resource related disasters'},
  {:code => 56, :title => 'Trends in nutritional contribution of biodiversity: Food composition'},
  {:code => 57, :title => 'Trends in incidence of emerging zoonotic diseases'},
  {:code => 58, :title => 'Trends in inclusive wealth'},
  {:code => 59, :title => 'Trends in nutritional contribution of biodiversity: Food consumption'},
  {:code => 60, :title => 'Trends in prevalence of underweight children under-five years of age'},
  {:code => 61, :title => 'Trends in natural resource conflicts'},
  {:code => 62, :title => 'Trends in the condition of selected ecosystem services'},
  {:code => 63, :title => 'Population trends and extinction risk trends of species that provide ecosystem services'},
  {:code => 64, :title => 'Status and trends in extent and condition of habitats that provide carbon storage'},
  {:code => 65, :title => 'Trends in biocapacity'},
  {:code => 66, :title => 'Trends in awareness and attitudes to biodiversity'},
  {:code => 67, :title => 'Trends in public engagement with biodiversity'},
  {:code => 68, :title => 'Trends in communication programmes and actions promoting social corporate responsibility'},
  {:code => 69, :title => 'Trends in land-use change and land tenure in the traditional territories of indigenous and local communities'},
  {:code => 70, :title => 'Trends in the practice of traditional occupations'},
  {:code => 71, :title => 'Trends in number of effective policy mechanisms implemented to reduce genetic erosion and safeguard genetic diversity related to plant and animal genetic resources'},
  {:code => 72, :title => 'Trends in invasive alien species pathways management'},
  {:code => 73, :title => 'Trends in implementation of National Biodiversity Strategies and Action Plans, including development, comprehensiveness, adoption and implementation'},
  {:code => 74, :title => 'Trends in the number and value of incentives, including subsidies, harmful to biodiversity, removed, reformed or phased out'},
  {:code => 75, :title => 'Trends in identification, assessment and establishment and strengthening of incentives that reward positive contribution to biodiversity and ecosystem services penalize adverse impacts'},
  {:code => 76, :title => 'Trends in number of countries that have assessed values of biodiversity, in accordance with the Convention'},
  {:code => 77, :title => 'Trends in area of forest, agricultural and aquaculture ecosystems under sustainable management'},
  {:code => 78, :title => 'Trends in number of countries incorporating natural resource, biodiversity, and ecosystem service values into national accounting systems'},
  {:code => 79, :title => 'Trends in guidelines and applications of economic appraisal tools'},
  {:code => 80, :title => 'Trends in integration of biodiversity and ecosystem service values into integrated in sectoral and development policies'},
  {:code => 81, :title => 'Trends in policies considering biodiversity and ecosystem service  in environmental impact assessment and strategic environmental assessment'},
  {:code => 82, :title => 'Trends in policy responses, legislation and management plans to control and prevent spread of invasive alien species'},
  {:code => 83, :title => 'Trends in extent to which biodiversity and ecosystem service values are incorporated into organizational accounting and reporting'},
  {:code => 84, :title => 'Trends in proportion  of depleted target and bycatch species with recovery plans'},
  {:code => 85, :title => 'ABS indicator to be specified through the ABS process'},
  {:code => 86, :title => 'Trends in degree to which traditional knowledge and practices are respected through: full integration, participation and safeguards in national implementation of the Strategic Plan'},
  {:code => 87, :title => 'Trends of linguistic diversity and numbers of speakers of indigenous languages'},
  {:code => 88, :title => 'Trends in coverage of comprehensive policy-relevant sub-global assessments including related capacity building and knowledge transfer, plus trends in uptake into policy'},
  {:code => 89, :title => 'Number of maintained species inventories being used to implement the Convention'},
  {:code => 90, :title => 'Trends in extent of marine protected areas, coverage of key biodiversity areas and management effectiveness'},
  {:code => 91, :title => 'Trends in area of degraded ecosystems restored or being restored'},
  {:code => 92, :title => 'Population trends of forest-dependent species in forests under restoration'},
  {:code => 93, :title => 'Trends in protected area condition and/or management effectiveness including more equitable management'},
  {:code => 94, :title => 'Trends in representative coverage of protected areas and other area based approaches, including sites of particular importance for biodiversity, and of terrestrial, marine and inland water systems'},
  {:code => 95, :title => 'Trends in the connectivity of protected  and other area based approaches integrated into land and sea scapes'},
  {:code => 96, :title => 'Trends in the delivery of ecosystem services and equitable benefits from protected areas'},
  {:code => 97, :title => 'Indicators agreed in decision X/3'}
]

indicators = [
  {:title => 'Extent of forests and forest types', :position => 1, :rel_link => 'forestextent'},
  {:title => 'Extent of assorted habitats', :position => 2, :rel_link => 'marinehabitats'},
  {:title => 'Living Planet Index', :position => 3, :rel_link => 'lpi'},
  {:title => 'Global Wild Bird Index', :position => 4, :rel_link => 'wbi'},
  {:title => 'Waterbird Indicator', :position => 5, :rel_link => ''},
  {:title => 'Coverage of Protected Areas', :position => 6, :rel_link => 'pacoverage'},
  {:title => 'Overlays with biodiversity', :position => 7, :rel_link => 'paoverlays'},
  {:title => 'Management effectiveness', :position => 8, :rel_link => 'pamanagement'},
  {:title => 'Red List Index and Sampled Red List Index', :position => 9, :rel_link => 'rli'},
  {:title => 'Ex situ crop collections', :position => 10, :rel_link => 'cropcollections'},
  {:title => 'Genetic diversity of terrestrial domesticated animals', :position => 11, :rel_link => 'domesticatedanimals'},
  {:title => 'Area of forest under sustainable management: certification', :position => 12, :rel_link => 'forestcertification'},
  {:title => 'Area of forest under sustainable management: degradation and deforestation', :position => 13, :rel_link => 'forestdegradation'},
  {:title => 'Area of agricultural ecosystems under sustainable management', :position => 14, :rel_link => 'sustainableagriculture'},
  {:title => 'Proportion of fish stocks in safe biological limits', :position => 15, :rel_link => ''},
  {:title => 'Status of species in trade', :position => 16, :rel_link => 'speciestrade'},
  {:title => 'Wild Commodities Index', :position => 17, :rel_link => 'wildcommoditiesindex'},
  {:title => 'Ecological Footprint and related concepts', :position => 18, :rel_link => 'ecologicalfootprint'},
  {:title => 'Nitrogen Deposition', :position => 19, :rel_link => 'nitrogendeposition'},
  {:title => 'Trends in Invasive Alien Species', :position => 20, :rel_link => 'invasivealienspecies'},
  {:title => 'Marine Trophic Index ', :position => 21, :rel_link => 'mti'},
  {:title => 'Water Quality Index for Biodiversity', :position => 22, :rel_link => 'wqib'},
  {:title => 'Forest Fragmentation', :position => 23, :rel_link => 'forestfragmentation'},
  {:title => 'River fragmentation and flow regulation', :position => 24, :rel_link => 'newindicatorspage/strategicgoalb/riverfragmentation'},
  {:title => 'Health and well being of communities directly dependant on ecosystem goods and services', :position => 25, :rel_link => 'healthofcommunities'},
  {:title => 'Nutritional status of biodiversity', :position => 26, :rel_link => 'nutritionindicators'},
  {:title => 'Biodiversity for food and medicine', :position => 27, :rel_link => 'foodandmedicine'},
  {:title => 'Status and trends of linguistic diversity and numbers of speakers of indigenous languages', :position => 28, :rel_link => 'linguisticdiversity'},
  {:title => 'Official development assistance provided in support of the Convention', :position => 29, :rel_link => 'oda'}
]

focal_areas = [
  {:code => 1, :name => 'Responses', :question => 'What do we do about biodiversity loss?'},
  {:code => 2, :name => 'Pressures', :question => 'Why are we losing biodiversity?'},
  {:code => 3, :name => 'State', :question => 'How is the status of biodiversity changing?'},
  {:code => 4, :name => 'Benefits', :question => 'What are the implications of biodiversity loss?'}
]

partners = [
  {:code => 1, :name => 'BirdLife International'},
  {:code => 2, :name => 'Convention on International Trade in Endangered Species (CITES)'},
  {:code => 3, :name => 'Food and Agriculture Organization of the United Nations (FAO)'},
  {:code => 4, :name => 'Global Footprint Network (GFN)'},
  {:code => 5, :name => 'Global Invasive Species Programme (GISP)'},
  {:code => 6, :name => 'IUCN'},
  {:code => 7, :name => 'International Nitrogen Initiative (INI)'},
  {:code => 8, :name => 'IUCN Sustainable Use Speciailist Group'},
  {:code => 9, :name => 'Organisation for Economic Co-operation and Development (OECD)'},
  {:code => 10, :name => 'Royal Society for the Protection of Birds (RSPB)'},
  {:code => 11, :name => 'The Nature Conservancy (TNC)'},
  {:code => 12, :name => 'The University of Queensland'},
  {:code => 13, :name => 'TRAFFIC International'},
  {:code => 14, :name => 'United Nations Educational, Scientific and Cultural Organization (UNESCO)'},
  {:code => 15, :name => 'UNEP-WCMC'},
  {:code => 16, :name => 'UNEP GEMS/Water Programme'},
  {:code => 17, :name => 'University of British Columbia Fisheries Centre'},
  {:code => 18, :name => 'WWF'},
  {:code => 19, :name => 'Zoological Society of London (ZSL)'},
  {:code => 20, :name => 'Bioversity International'},
  {:code => 21, :name => 'Conservation Intrenational (CI)'},
  {:code => 22, :name => 'Global Biodiversity Information Facility (GBIF)'},
  {:code => 23, :name => 'International Livestock Research Institute (ILRI)'},
  {:code => 24, :name => 'IUCN Species Survival Commission (SSC)'},
  {:code => 25, :name => 'IUCN World Commission on Protected Areas (WCPA)'},
  {:code => 26, :name => 'Kew Gardens'},
  {:code => 27, :name => 'NatureServe'},
  {:code => 28, :name => 'Ramsar Covention on Wetlands'},
  {:code => 29, :name => 'Terralingua'},
  {:code => 30, :name => 'Sapienza Universitá di Roma'},
  {:code => 31, :name => 'Wildlife Conservation Society (WCS)'},
  {:code => 32, :name => 'World Health Organization (WHO)'},
  {:code => 33, :name => 'DST-NRF Centre of Excellence for Invasion Biology (CIB)'},
  {:code => 34, :name => 'European Environment Agency (EEA)'},
  {:code => 35, :name => 'Umea University'},
  {:code => 36, :name => 'Scope'},
  {:code => 37, :name => 'IGBP'},
  {:code => 38, :name => 'GEF'},
  {:code => 39, :name => 'Alliance for Zero Extinction (AZE)'}
]

#code => index
goals_targets = {
  'A' => [1,2,3,4],
  'B' => [5,6,7,8,9,10],
  'C' => [11,12,13],
  'D' => [14,15,16],
  'E' => [17,18,19,20]
}

#code => position
#TODO this mapping is completely made up for testing purposes
targets_indicators = {
  1 => [1,2,3],
  2 => [4,5],
  3 => [6,7,8],
  4 => [1,8,9],
  5 => [10,11],
  6 => [6,7],
  7 => [12,13,14],
  8 => [13],
  9 => [13,14,15,16,17,18,19,20],
  10 => [21,22],
  11 => [23],
  12 => [23,24,25],
  13 => [25,27],
  14 => [26],
  15 => [28,29],
  16 => [28],
  17 => [28],
  18 => [28],
  19 => [28],
  20 => [28]
}

#code => position
headlines_indicators = {
  1 => [1,2,3],
  2 => [4,5],
  3 => [6,7,8],
  4 => [9],
  5 => [10,11],
  6 => [12,13,14],
  7 => [15,16,17],
  8 => [18],
  9 => [19],
  10 => [20],
  11 => [21],
  12 => [22]
}

#code => position
partners_indicators = {
  1 => [4],
  2 => [16],
  3 => [1,2,10,11,13,14,26],
  4 => [18],
  5 => [20],
  6 => [19],
  7 => [17],
  8 => [29],
  9 => [4],
  10 => [24],
  11 => [8],
  12 => [27],
  13 => [28],
  14 => [2,6,7,8,12,16,17,23,25],
  15 => [22],
  16 => [21],
  17 => [3],
  18 => [3,9]
}

#code => position
focal_areas_indicators = {
  1 => [1],
  2 => [2],
  3 => [3],
  4 => [4]
}

indicators.each { |i| Indicator.create(i) }

partners.each do |p|
  partner = Partner.create(p)
  if partners_indicators[partner.code]
    partner.indicators = Indicator.find(partners_indicators[partner.code])
  end
end

focal_areas.each do |f|
  focal_area = FocalArea.create(f)
  if focal_areas_indicators[focal_area.code]
    focal_area.indicators = Indicator.find(focal_areas_indicators[focal_area.code])
  end
end

headlines.each do |h|
  headline = Headline.create(h)
  if headlines_indicators[headline.code]
    headline.indicators = Indicator.find(headlines_indicators[headline.code])
  end
end

targets.each do |t|
  target = Target.create(t)
  if targets_indicators[target.code]
    target.indicators = Indicator.find(targets_indicators[target.code])
  end
end

goals.each do |g|
  goal = Goal.create(g)
  if goals_targets[goal.code]
    goal.targets = Target.find(goals_targets[goal.code])
  end
end
