# qvr-piano
QB RedM Framework Basic Piano Script


#Requirements 

- Go to `qbr-core` client > prompt.lua open file. 

```
local function getPrompt()
    if Prompts then 
    return Prompts
    end
end

local function getPromptGroup()
    if PromptGroups then 
    return PromptGroups
    end
end


local function deletePrompt(name)
    if Prompts then
        Citizen.InvokeNative(0x8A0FB4D03A630D21, Prompts[name].prompt, false)
        Citizen.InvokeNative(0x71215ACCFDE075EE, Prompts[name].prompt, false)
        Prompts[name] = nil
    end
end

local function deletePromptGroup(name)
    if PromptGroups then
        Citizen.InvokeNative(0x8A0FB4D03A630D21, PromptGroups[name].prompt, false)
        Citizen.InvokeNative(0x71215ACCFDE075EE, PromptGroups[name].prompt, false)
        PromptGroups[name] = nil
    end
end
```
Add this and then 
Go bottom line
```
exports('getPrompt', getPrompt)
exports('getPromptGroup',getPromptGroup)
exports('deletePrompt', deletePrompt)
exports('deletePromptGroup',deletePromptGroup)
```
Add this exports

# If you other location 
- For now, I was able to find these locations. If there are locations that you find different, do not hesitate to let me know.

