
local SMODShas_enh = SMODS.has_enhancement
function SMODS.has_enhancement(card, key)
	if key == "m_steel" and 
	(card.config.center.key == "m_felijo_steel_t2" or 
	card.config.center.key == "m_felijo_steel_t3" or 
	card.config.center.key == "m_felijo_steel_t4") then return true end
	if key == "m_glass" and 
	(card.config.center.key == "m_felijo_glass_t2" or 
	card.config.center.key == "m_felijo_glass_t3" or 
	card.config.center.key == "m_felijo_glass_t4") then return true end
	if key == "m_mult" and 
	(card.config.center.key == "m_felijo_mult_t2" or 
	card.config.center.key == "m_felijo_mult_t3" or 
	card.config.center.key == "m_felijo_mult_t4") then return true end
	if key == "m_bonus" and 
	(card.config.center.key == "m_felijo_bonus_t2" or 
	card.config.center.key == "m_felijo_bonus_t3" or 
	card.config.center.key == "m_felijo_bonus_t4") then return true end
	if key == "m_stone" and 
	(card.config.center.key == "m_felijo_stone_t2" or 
	card.config.center.key == "m_felijo_stone_t3" or 
	card.config.center.key == "m_felijo_stone_t4") then return true end
	if key == "m_lucky" and 
	(card.config.center.key == "m_felijo_lucky_t2" or 
	card.config.center.key == "m_felijo_lucky_t3" or 
	card.config.center.key == "m_felijo_lucky_t4") then return true end
	if key == "m_gold" and 
	(card.config.center.key == "m_felijo_gold_t2" or 
	card.config.center.key == "m_felijo_gold_t3" or 
	card.config.center.key == "m_felijo_gold_t4") then return true end
	return SMODShas_enh(card,key)
end