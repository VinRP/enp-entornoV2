-- ESX

ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


-- REGISTROS

RegisterServerEvent('enp-entorno:getJob')
AddEventHandler('enp-entorno:getJob',function()
	local source = source
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayers[i] == source then
			TriggerClientEvent('enp-entorno:setJob', xPlayers[i],xPlayer.job.name)
		end
	end
end)

-- FORZAR  POLICIA

RegisterServerEvent('enp-entorno:forzar:sendNotify')
AddEventHandler('enp-entorno:forzar:sendNotify', function( id, vehm, vehc, streetName, plate )
	TriggerClientEvent('enp-entorno:forzar:sendNotify', -1, id, vehm, vehc, streetName, plate )
end, false)

RegisterNetEvent('enp-entorno:respuesta')
AddEventHandler('enp-entorno:respuesta', function()
	TriggerClientEvent('enp-entorno:forzar:sendNotify', -1)
end)

-- END FORZAR POLICIA

-- ENTORNO POLICIA

RegisterServerEvent('enp-entorno:sendNotify')
AddEventHandler('enp-entorno:sendNotify', function( id, msg, streetName  )
	TriggerClientEvent('enp-entorno:sendNotify', -1, id, msg, streetName )
end, false)

RegisterServerEvent('enp-entorno:setBlip')
AddEventHandler('enp-entorno:setBlip', function( pos )
	TriggerClientEvent('enp-entorno:setBlip', -1, pos.x, pos.y )
end, false)

-- END ENTORNO POLICIA
