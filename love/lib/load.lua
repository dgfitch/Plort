-- require a dir of lua files
function requireDir( dir )
  for k, v in pairs( love.filesystem.enumerate( dir ) ) do
    if love.filesystem.isFile( dir .. v ) then
      require( dir .. v )
    end
  end
end

