local ReplicatedStorage = game:GetService("ReplicatedStorage")

local spinEvent = ReplicatedStorage.RemoteEvents.SpinRoulette
local buyLuckEvent = ReplicatedStorage.RemoteEvents.BuyLuck

spinEvent.OnServerEvent:Connect(function(player, percent)
	local money = player.leaderstats["$"]
	local luck = player:GetAttribute("Luck") or 50

	local bet = money.Value * (percent/100)
	if bet <= 0 then return end

	if math.random(1,100) <= luck then
		money.Value += bet
	else
		money.Value -= bet
	end
end)

buyLuckEvent.OnServerEvent:Connect(function(player)
	local money = player.leaderstats["$"]
	local luck = player:GetAttribute("Luck") or 50

	if money.Value >= 100000 then
		money.Value -= 100000
		player:SetAttribute("Luck", luck + 1)
	end
end)
