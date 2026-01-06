local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StocksData = require(ReplicatedStorage.Shared.StocksData)

local buyStock = ReplicatedStorage.RemoteEvents.BuyStock

buyStock.OnServerEvent:Connect(function(player, stockName)
	local money = player.leaderstats["$"]
	local mps = player:FindFirstChild("MPS")

	for _,stock in ipairs(StocksData) do
		if stock.Name == stockName and money.Value >= stock.Cost then
			money.Value -= stock.Cost
			mps.Value += stock.MPS
			break
		end
	end
end)
