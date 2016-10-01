local handle = io.popen("df -h | grep ^/ | tr -s ' ' | cut -d ' ' -f 6")
local numparts = handle:read("*a")
handle:close()
listparts = ""
for i = 1,numparts
    print numparts(i)
end

function conky_part()
    return 1
end