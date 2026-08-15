-- ==========================================
-- ShopBoardのCenter_Display_Surfaceに近づいたらPopupInfoを表示、離れたら非表示
-- ==========================================


-- ==========================================
-- 1. サービスの取得
-- ==========================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

-- ==========================================
-- 2. UI要素と3Dパーツの参照
-- ==========================================
-- 看板パーツを Workspace から直接取得します
local shopBoard = workspace:WaitForChild("ShopBoard_01_Teppanyaki10")
local surfacePart = shopBoard:WaitForChild("Center_Display_Surface")
local surfaceGui = surfacePart:WaitForChild("SurfaceGui_Front")

-- UI要素を取得
local frame = surfaceGui:WaitForChild("PopUp_Info_Frame")
local spotName = frame:WaitForChild("Spot_Name")
local description = frame:WaitForChild("Description")

-- ==========================================
-- 3. 設定値の定義
-- ==========================================
local TRIGGER_DISTANCE = 8 -- ポップアップを表示させる距離（Studs）
local TWEEN_TIME = 0.3     -- アニメーション時間（秒）

-- ==========================================
-- 4. 初期状態のセットアップ
-- ==========================================
local isVisible = false

print("★ 1. スクリプトが起動し、初期化を開始しました")

frame.BackgroundTransparency = 1
spotName.TextTransparency = 1
description.TextTransparency = 1
frame.Visible = false

print("★ 2. 初期化（非表示処理）が完了しました")

-- ==========================================
-- 5. フェードイン・フェードアウト処理関数
-- ==========================================
local function fadeUI(targetVisible)
	if isVisible == targetVisible then return end
	isVisible = targetVisible

	local tweenInfo = TweenInfo.new(TWEEN_TIME, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

	if targetVisible then
		-- ★ 表示する処理（フェードイン）
		frame.Visible = true

		TweenService:Create(frame, tweenInfo, {BackgroundTransparency = 0.15}):Play()
		TweenService:Create(spotName, tweenInfo, {TextTransparency = 0}):Play()
		TweenService:Create(description, tweenInfo, {TextTransparency = 0}):Play()
	else
		-- ★ 消す処理（フェードアウト）
		local tFrame = TweenService:Create(frame, tweenInfo, {BackgroundTransparency = 1})
		tFrame:Play()

		TweenService:Create(spotName, tweenInfo, {TextTransparency = 1}):Play()
		TweenService:Create(description, tweenInfo, {TextTransparency = 1}):Play()

		tFrame.Completed:Connect(function()
			if not isVisible then
				frame.Visible = false
			end
		end)
	end
end

-- ==========================================
-- 6. プレイヤーの位置・向きを常に判定するループ処理
-- ==========================================
RunService.Heartbeat:Connect(function()
	if not surfacePart or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
		return
	end

	local hrp = player.Character.HumanoidRootPart
	local partCFrame = surfacePart.CFrame
	local distance = (hrp.Position - surfacePart.Position).Magnitude

	if distance <= TRIGGER_DISTANCE then
		local localPos = partCFrame:PointToObjectSpace(hrp.Position)

		if localPos.X > 0 then
			fadeUI(true)
			return
		end
	end

	fadeUI(false)
end)
