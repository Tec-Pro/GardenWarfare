json.array! @characters do |character|
	json.(character,:id, :type, :money, :blueMoney, :strength, :vitality, :dexterity,:level, :experience,:inventoryCapacity,:user, :name)
end