local handle = io.popen("grep -c processor /proc/cpuinfo")
local numcpus = handle:read("*n")
handle:close()
listcpus = ""
for i = 1,numcpus
    do listcpus = listcpus.."CPU"..tostring(i)..": ${cpu cpu"..tostring(i).."} % ${cpubar cpu"..tostring(i).."}"

    if (i ~= numcpus) then
        listcpus = listcpus.."\n"
    end
end

function conky_cpu()
    return listcpus
end
