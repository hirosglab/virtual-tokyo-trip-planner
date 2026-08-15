-- ShopBoard_PopUpController.lua
-- StarterPlayerScripts に置く LocalScript 向け
-- 近づいたら SurfaceGui の PopUp_Info_Frame をフェードイン、離れたらフェードアウト

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
if not player then return end

-- 設定
local SHOPBOARD_NAME = "ShopBoard_01_Teppanyaki10"  -- 対象モデル名（必要なら複数対応に変更）
local SURFACE_PART_NAME = "Center_Display_Surface"
local SURFACE_GUI_NAME = "SurfaceGui_Front"
local POPUP_FRAME_NAME = "PopUp_Info_Frame"

local TRIGGER_DISTANCE = 8           -- studs
local TRIGGER_DISTANCE_SQ = TRIGGER_DISTANCE * TRIGGER_DISTANCE
local POLL_INTERVAL = 0.12           -- 秒（ポーリング間隔）
local TWEEN_TIME = 0.25

-- 内部状態
local isVisible = false
local lastPoll = 0

-- TweenInfo を使い回す
local tweenInfo = TweenInfo.new(TWEEN_TIME, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- 指定 ShopBoard の SurfacePart と GUI を安全に取得
local function getSurfaceGuiAndFrame()
    local board = workspace:FindFirstChild(SHOPBOARD_NAME)
    if not board then
        board = workspace:WaitForChild(SHOPBOARD_NAME, 5)
        if not board then
            return nil, nil, nil
        end
    end

    local part = board:FindFirstChild(SURFACE_PART_NAME)
    if not part then
        for _, d in ipairs(board:GetDescendants()) do
            if d:IsA("BasePart") and d.Name == SURFACE_PART_NAME then
                part = d
                break
            end
        end
    end
    if not part then return nil, nil, nil end

    local sgui = part:FindFirstChild(SURFACE_GUI_NAME)
    if not sgui then
        for _, d in ipairs(part:GetDescendants()) do
            if (d:IsA("SurfaceGui") or d:IsA("BillboardGui")) and d.Name == SURFACE_GUI_NAME then
                sgui = d
                break
            end
        end
    end
    if not sgui then return part, nil, nil end

    local frame = sgui:FindFirstChild(POPUP_FRAME_NAME)
    if not frame then
        frame = sgui:FindFirstChildWhichIsA("Frame")
    end

    return part, sgui, frame
end

-- 初期取得（存在しなければ再試行する設計）
local surfacePart, surfaceGui, popupFrame = getSurfaceGuiAndFrame()
if not surfacePart then
    warn("ShopBoard pop-up: could not find surface part: " .. tostring(SHOPBOARD_NAME) .. "/" .. tostring(SURFACE_PART_NAME))
end

-- GUI 初期化（見えない状態にする）
if popupFrame then
    popupFrame.Visible = false
    -- 初期透明度を確実にセット
    for _, v in ipairs(popupFrame:GetDescendants()) do
        if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("ImageLabel") or v:IsA("Frame") then
            if v:IsA("Frame") then
                v.BackgroundTransparency = 1
            else
                v.TextTransparency = 1
                if v:IsA("ImageLabel") then
                    v.ImageTransparency = 1
                end
            end
        end
    end
end

-- Tween をキャッシュして再利用するユーティリティ
local tweensCache = {}
local function getOrCreateTween(inst, properties)
    local key = tostring(inst) .. "|" .. table.concat((function()
        local ks = {}
        for k,_ in pairs(properties) do table.insert(ks, k) end
        table.sort(ks)
        return ks
    end)(), ",")
    if tweensCache[key] then return tweensCache[key] end
    local tw = TweenService:Create(inst, tweenInfo, properties)
    tweensCache[key] = tw
    return tw
end

local function setPopupVisible(target)
    if not popupFrame then return end
    if isVisible == target then return end
    isVisible = target

    if target then
        popupFrame.Visible = true
        -- フレームの背景と内部テキストをフェードイン
        for _, v in ipairs(popupFrame:GetDescendants()) do
            if v:IsA("Frame") then
                getOrCreateTween(v, {BackgroundTransparency = 0.15}):Play()
            elseif v:IsA("TextLabel") or v:IsA("TextButton") then
                getOrCreateTween(v, {TextTransparency = 0}):Play()
            elseif v:IsA("ImageLabel") then
                getOrCreateTween(v, {ImageTransparency = 0}):Play()
            end
        end
    else
        -- フェードアウトして完了時に Visible = false
        local completedCount = 0
        local total = 0
        for _, v in ipairs(popupFrame:GetDescendants()) do
            if v:IsA("Frame") then
                total = total + 1
                local t = getOrCreateTween(v, {BackgroundTransparency = 1})
                t:Play()
                t.Completed:Once(function()
                    completedCount = completedCount + 1
                    if completedCount >= total then
                        if not isVisible and popupFrame then
                            popupFrame.Visible = false
                        end
                    end
                end)
            elseif v:IsA("TextLabel") or v:IsA("TextButton") then
                getOrCreateTween(v, {TextTransparency = 1}):Play()
            elseif v:IsA("ImageLabel") then
                getOrCreateTween(v, {ImageTransparency = 1}):Play()
            end
        end
        if total == 0 then
            popupFrame.Visible = false
        end
    end
end

-- ポーリングループ（Heartbeat を使い、間隔で負荷を制御）
local accumulated = 0
RunService.Heartbeat:Connect(function(dt)
    accumulated = accumulated + dt
    if accumulated < POLL_INTERVAL then return end
    accumulated = 0

    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        return
    end
    if not surfacePart then
        -- 途中で生成される可能性があるため再取得
        surfacePart, surfaceGui, popupFrame = getSurfaceGuiAndFrame()
        if not surfacePart then return end
    end

    local hrp = player.Character.HumanoidRootPart
    local diff = hrp.Position - surfacePart.Position
    local distSq = diff.X * diff.X + diff.Y * diff.Y + diff.Z * diff.Z

    if distSq <= TRIGGER_DISTANCE_SQ then
        -- optional: 面に対する向きチェック（例: X > 0 相対判定）を残すならここで行う
        local localPos = surfacePart.CFrame:PointToObjectSpace(hrp.Position)
        if localPos.X > 0 then
            setPopupVisible(true)
            return
        end
    end

    setPopupVisible(false)
end)
