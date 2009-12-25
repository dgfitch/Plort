-- require a dir of lua files
function requireDir( dir )
  for k, v in pairs( love.filesystem.enumerate( dir ) ) do
    require( dir .. v )
  end
end

