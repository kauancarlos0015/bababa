local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder", player)
	leaderstats.Name = "leaderstats"

	local money = Instance.new("NumberValue", leaderstats)
	money.Name = "$"
	money.Value = 0

	local mps = Instance.new("NumberValue", player)
	mps.Name = "MPS"
	mps.Value = 1 -- renda inicial

	task.spawn(function()
		while player.Parent do
			money.Value += mps.Value
			task.wait(1)
		end
	end)
end)
