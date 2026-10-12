-- ============================================================
-- 思い出横丁エリア：提灯時間差出現スクリプト（PointLight制御対応版）
-- 配置場所: StarterPlayer -> StarterPlayerScripts -> LocalScript
-- ============================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

-- 演出の調整パラメータ
local TRIGGER_DISTANCE = 40  -- 反応する距離（studs）
local DELAY_TIME = 0.25      -- 各ステップ間の待ち時間（秒）
local TWEEN_TIME = 0.35      -- ポップアップにかかる時間（秒）

-- ------------------------------------------------------------
-- 1. 対象の InfoBoard およびフォルダの取得
-- ------------------------------------------------------------
local boardsFolder = workspace:WaitForChild("Featured_Sightseeing_Spots_Boards", 10)
local board = boardsFolder and boardsFolder:WaitForChild("InfoBoard_02_OmoideYokocho", 10)

if not board then
	warn("InfoBoard_02_OmoideYokocho が Featured_Sightseeing_Spots_Boards 内で見つかりません")
	return
end

-- サウンド（Sound）の参照
local audioFolder = workspace:WaitForChild("AudioAssets", 10)
local popSound = audioFolder and audioFolder:WaitForChild("SE_Pop_Common", 10)
local welcomeSound = audioFolder and audioFolder:WaitForChild("SE_Welcome_Izakaya", 10)

if popSound then
	popSound.SoundId = "rbxassetid://100517105966579"
	popSound.Volume = 0.8
	popSound.RollOffMaxDistance = 50
end

-- ------------------------------------------------------------
-- 2. Props > OmoideYokocho フォルダから各提灯を取得
-- ------------------------------------------------------------
local propsFolder = workspace:WaitForChild("Props"):WaitForChild("OmoideYokocho", 10)

if not propsFolder then
	warn("Props/OmoideYokocho フォルダが見つかりません")
	return
end

local p_Lantern1 = propsFolder:WaitForChild("Prop_Lantern_Red_01")
local p_Lantern2 = propsFolder:WaitForChild("Prop_Lantern_Red_02")
local p_Lantern3 = propsFolder:WaitForChild("Prop_Lantern_Red_03")
local p_Lantern4 = propsFolder:WaitForChild("Prop_Lantern_Red_04")
local p_Lantern5 = propsFolder:WaitForChild("Prop_Lantern_Red_05")
local p_Lantern6 = propsFolder:WaitForChild("Prop_Lantern_Red_06")
local p_Lantern7 = propsFolder:WaitForChild("Prop_Lantern_Red_07")
local p_Lantern8 = propsFolder:WaitForChild("Prop_Lantern_Red_08")

local allProps = {
	p_Lantern1, p_Lantern2,
	p_Lantern3, p_Lantern4,
	p_Lantern5, p_Lantern6,
	p_Lantern7, p_Lantern8
}

-- ------------------------------------------------------------
-- ★ 各プロップの初期サイズ・位置・スケールの記録
-- ------------------------------------------------------------
local originalData = {}

for _, prop in ipairs(allProps) do
	if prop then
		if prop:IsA("Model") then
			originalData[prop] = {
				Scale = prop:GetScale(),
				CFrame = prop:GetPivot()
			}
		elseif prop:IsA("BasePart") then
			originalData[prop] = {
				Size = prop.Size,
				CFrame = prop.CFrame
			}
		end
	end
end

-- 状態管理フラグ
local isNear = false
local isAnimating = false

-- ------------------------------------------------------------
-- ★ Light（PointLight等）のオン/オフ切り替え補助関数
-- ------------------------------------------------------------
local function setPropLightEnabled(prop, enabled)
	if not prop then return end

	-- Lightクラス（PointLight, SurfaceLight, SpotLightなど）を検索してON/OFF
	for _, child in ipairs(prop:GetDescendants()) do
		if child:IsA("Light") then
			child.Enabled = enabled
		end
	end
end

-- ------------------------------------------------------------
-- 透明度切り替え補助関数
-- ------------------------------------------------------------
local function setPropTransparency(prop, transparency)
	if not prop then return end

	if prop:IsA("BasePart") then
		prop.Transparency = transparency
	elseif prop:IsA("Model") then
		for _, child in ipairs(prop:GetDescendants()) do
			if child:IsA("BasePart") then
				child.Transparency = transparency
			end
		end
	end
end

-- ------------------------------------------------------------
-- 非表示リセット処理（透明度を1にし、ライトをOFFにする）
-- ------------------------------------------------------------
local function hideAllLanterns()
	for _, prop in ipairs(allProps) do
		if prop and originalData[prop] then
			setPropTransparency(prop, 1)
			setPropLightEnabled(prop, false) -- ★ ライトを消灯

			if prop:IsA("Model") then
				prop:ScaleTo(originalData[prop].Scale)
			elseif prop:IsA("BasePart") then
				prop.Size = originalData[prop].Size
			end
		end
	end
end

-- 初期化（開始時は非表示・消灯）
hideAllLanterns()

-- ------------------------------------------------------------
-- 効果音再生用ヘルパー関数
-- ------------------------------------------------------------
local function playPopSound()
	if popSound then
		popSound.TimePosition = 0
		popSound:Play()
	end
end

local function playWelcomeSound()
	if welcomeSound then
		welcomeSound.TimePosition = 0
		welcomeSound:Play()
	end
end

-- ------------------------------------------------------------
-- ★ ポップアップアニメーション（出現時にライトON）
-- ------------------------------------------------------------
local popTweenInfo = TweenInfo.new(
	TWEEN_TIME,
	Enum.EasingStyle.Back,   -- 弾むイージング
	Enum.EasingDirection.Out
)

local function animatePopIn(prop)
	if not prop or not originalData[prop] then return end

	-- 表示状態にし、ライトを点灯させる
	setPropTransparency(prop, 0)
	setPropLightEnabled(prop, true) -- ★ ライトを点灯

	if prop:IsA("Model") then
		local origCF = originalData[prop].CFrame
		local origScale = originalData[prop].Scale

		local startCF = origCF * CFrame.new(0, -1.5, 0)
		prop:PivotTo(startCF)
		prop:ScaleTo(origScale * 0.2)

		local startTime = os.clock()

		local conn
		conn = RunService.Heartbeat:Connect(function()
			local elapsed = os.clock() - startTime
			local alpha = math.clamp(elapsed / TWEEN_TIME, 0, 1)

			local easedAlpha = TweenService:GetValue(alpha, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

			local currentScale = (origScale * 0.2) + (origScale * 0.8) * easedAlpha
			local currentCF = startCF:Lerp(origCF, easedAlpha)

			prop:ScaleTo(currentScale)
			prop:PivotTo(currentCF)

			if alpha >= 1 then
				conn:Disconnect()
				prop:ScaleTo(origScale)
				prop:PivotTo(origCF)
			end
		end)

	elseif prop:IsA("BasePart") then
		local origCF = originalData[prop].CFrame
		local origSize = originalData[prop].Size

		prop.CFrame = origCF * CFrame.new(0, -5, 0)
		prop.Size = origSize * 0.2

		local tweenSize = TweenService:Create(prop, popTweenInfo, {
			Size = origSize,
			CFrame = origCF
		})
		tweenSize:Play()
	end
end

-- ------------------------------------------------------------
-- 順次出現アニメーション（ペアで2個ずつ出現）
-- ------------------------------------------------------------
local function showLanternSequence()
	isAnimating = true

	-- 【Step 1】 Prop_Lantern_Red_01 & Prop_Lantern_Red_02
	playPopSound()
	animatePopIn(p_Lantern1)
	animatePopIn(p_Lantern2)
	task.wait(DELAY_TIME)

	-- 【Step 2】 Prop_Lantern_Red_03 & Prop_Lantern_Red_04
	playPopSound()
	animatePopIn(p_Lantern3)
	animatePopIn(p_Lantern4)
	task.wait(DELAY_TIME)

	-- 【Step 3】 Prop_Lantern_Red_05 & Prop_Lantern_Red_06
	playPopSound()
	animatePopIn(p_Lantern5)
	animatePopIn(p_Lantern6)
	task.wait(DELAY_TIME)

	-- 【Step 4】 Prop_Lantern_Red_07 & Prop_Lantern_Red_08
	playPopSound()
	animatePopIn(p_Lantern7)
	animatePopIn(p_Lantern8)

	-- ★ 8個すべて表示・点灯完了後に居酒屋歓迎SEを再生
	playWelcomeSound()

	isAnimating = false
end

-- ============================================================
-- ★ 自分自身（LocalPlayer）との距離と「前方」の判定関数
-- ============================================================
local function checkPlayerInFront()
	local char = LocalPlayer.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		local hrp = char.HumanoidRootPart
		local boardPivot = board:GetPivot()
		local boardPos = boardPivot.Position

		-- 1. まず距離のチェック（40 studs以内か）
		local dist = (hrp.Position - boardPos).Magnitude
		if dist > TRIGGER_DISTANCE then
			return false
		end

		-- 【追加】近づきすぎたとき（例：8 studs以内）は、角度に関わらず正面にいるとみなして消えないようにする
		if dist <= 15 then
			return true
		end

		-- 2. 看板の正面方向ベクトル
		local boardForward = -boardPivot.LookVector

		-- 3. 看板からプレイヤーへのベクトル
		local toPlayer = (hrp.Position - boardPos)

		-- 高低差（Y軸）の影響を無視して、水平方向（XZ平面）だけで判定
		toPlayer = Vector3.new(toPlayer.X, 0, toPlayer.Z)
		boardForward = Vector3.new(boardForward.X, 0, boardForward.Z)

		if toPlayer.Magnitude == 0 or boardForward.Magnitude == 0 then
			return false
		end

		toPlayer = toPlayer.Unit
		boardForward = boardForward.Unit

		-- 4. 内積を計算
		local dot = boardForward:Dot(toPlayer)

		-- 離れている時は厳め（0.9 = 約25度以内）の視野角で隣の看板への誤反応を防ぐ
		return dot > 0.9
	end
	return false
end

-- ------------------------------------------------------------
-- 判定ループ（Heartbeat）
-- ------------------------------------------------------------
RunService.Heartbeat:Connect(function()
	local isInFront = checkPlayerInFront()

	if isInFront and not isNear then
		isNear = true
		if not isAnimating then
			showLanternSequence()
		end

	elseif not isInFront and isNear then
		isNear = false
		hideAllLanterns()
	end
end)
