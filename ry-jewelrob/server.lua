ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local basicBeklemeCd = 7200 
local hardBeklemeCd = 7200 

local shops = {
    [1] = {
		["son_basic_cd"] = 0,
    },
    [2] = {
		["son_basic_cd"] = 0,
    },
    [3] = {
		["son_basic_cd"] = 0,
    },
    [4] = {
		["son_basic_cd"] = 0,
    },
    [5] = {
		["son_basic_cd"] = 0,
    },
    [6] = {
		["son_basic_cd"] = 0,
    },
    [7] = {
		["son_basic_cd"] = 0,
    },
    [8] = {
		["son_basic_cd"] = 0,
    },
    [9] = {
		["son_basic_cd"] = 0,
    },
    [10] = {
		["son_basic_cd"] = 0,
    },
    [11] = {
		["son_basic_cd"] = 0,
    },
    [12] = {
		["son_basic_cd"] = 0,
    },
	[13] = {
		["son_basic_cd"] = 0,
    },
	[14] = {
		["son_basic_cd"] = 0,
    },
    [15] = {
		["son_basic_cd"] = 0,
    },
	[16] = {
		["son_basic_cd"] = 0,
    },
    [17] = {
		["son_basic_cd"] = 0,
    },
	[18] = {
		["son_basic_cd"] = 0,
    },
	[19] = {
		["son_basic_cd"] = 0,
    },
    [20] = {
		["son_basic_cd"] = 0,
    },
    [21] = {
      ["son_basic_cd"] = 0,
      },
}

local shops2 = {
  [1] = {
  ["son_basic_cd"] = 0,
  },
}

ESX.RegisterServerCallback('ry-jewel:serversidecooldown', function(source, cb, marketNo, tip)
  local xPlayer = ESX.GetPlayerFromId(source)
  if marketNo ~= nil then
      if tip == "basic" and (os.time() - shops[marketNo]["son_basic_cd"]) > basicBeklemeCd then
          cb(true)
      else
        TriggerClientEvent('servernotification', source, 'No jewels here!')
          cb(false)
      end   
  else
    TriggerClientEvent('servernotification', source, 'Get closer the box!')
  end
end)

RegisterServerEvent("ry-jewel:givereward")
AddEventHandler("ry-jewel:givereward", function(tip, kasaNo)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if tip == "basic" and (os.time() - shops[kasaNo]["son_basic_cd"]) > basicBeklemeCd then
        local random1 = math.random(1, 4)
        local random2 = math.random(1, 4)
        local random3 = math.random(1, 4)
        xPlayer.addInventoryItem(Config.Item.Ring, random1)
        xPlayer.addInventoryItem(Config.Item.Rolex, random2)
        xPlayer.addInventoryItem(Config.Item.GB, random3)
        TriggerClientEvent('servernotification', source, 'You take the jewels and move on to the next!')
        shops[kasaNo]["son_basic_cd"] = os.time()
    else
      TriggerClientEvent('servernotification', source, 'No jewels here!')
    end
end)

ESX.RegisterServerCallback('ry-jewel:serversidecooldown2', function(source, cb, marketNo, tip)
  local xPlayer = ESX.GetPlayerFromId(source)
  if marketNo ~= nil then
      if tip == "basic" and (os.time() - shops2[marketNo]["son_basic_cd"]) > basicBeklemeCd then
          cb(true)
      else
          cb(false)
      end   
  else
  end
end)

RegisterServerEvent("ry-jewel:givereward2")
AddEventHandler("ry-jewel:givereward2", function(tip, kasaNo)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if tip == "basic" and (os.time() - shops2[kasaNo]["son_basic_cd"]) > basicBeklemeCd then
      xPlayer.removeInventoryItem('thermite', 1)
      shops2[kasaNo]["son_basic_cd"] = os.time()
    end
end)

RegisterServerEvent('batuflexisiktim')
AddEventHandler('batuflexisiktim', function(gelecekpara, item, count)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.addMoney(gelecekpara)
    print(item)
    xPlayer.removeInventoryItem(item, count)
end)

ESX.RegisterServerCallback('CheckItem', function(source, cb, item)
  local xPlayer = ESX.GetPlayerFromId(source)
  local qy = xPlayer.getInventoryItem(item).count
  cb(qy)
end)

ESX.RegisterServerCallback('jewel:CheckItem', function(source, cb, item)
  local xPlayer = ESX.GetPlayerFromId(source)
  local qy = xPlayer.getQuantity(item)
  if qy > 0 then
      cb(true)
  else
      cb(false)
  end
end)