-- ==========================================
-- ShopBoardのCenter_Display_Surfaceに近づいたらPopupInfoを表示、離れたら非表示
-- ==========================================

-- ==================================================================
-- 1. サービスの取得
-- ==================================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

-- ==================================================================
-- 2. 設定値の定義
-- ==================================================================
local TRIGGER_DISTANCE = 8 -- ポップアップを表示させる距離(Studs)
local TARGET_NAME_PREFIX = "ShopBoard_" -- 対象オブジェクト名の接頭辞

-- 各ボードの状態管理テーブル
local boardsData = {}

-- ==================================================================
-- 3. ボードの初期化関数
-- ==================================================================
local function setupBoard(shopBoard)
	-- 名前が "ShopBoard_" で始まっているか確認
	if string.sub(shopBoard.Name, 1, #TARGET_NAME_PREFIX) ~= TARGET_NAME_PREFIX then
		return
	end

	local surfacePart = shopBoard:WaitForChild("Center_Display_Surface", 5)
	if not surfacePart then return end
	
	local surfaceGui = surfacePart:WaitForChild("SurfaceGui_Front", 5)
	if not surfaceGui then return end
	
	local frame = surfaceGui:WaitForChild("PopUp_Info_Frame", 5)
	if not frame then return end

-- 初期化処理: スクリプト読み込み時にUIを非表示
	frame.Visible = false
	
	-- 登録済みでなければ追加
	table.insert(boardsData, {
		board = shopBoard,
		surfacePart = surfacePart,
		frame = frame,
		isOpen = false
	})
end

-- ==================================================================
-- 4. Workspaceの走査・自動取得
-- ==================================================================
-- Workspace 内の既存オブジェクトを走査
for _, object in ipairs(workspace:GetDescendants()) do
	setupBoard(object)
end

-- ゲーム実行中にWorkspaceへ動的に追加されたオブジェクトにも対応
workspace.DescendantAdded:Connect(setupBoard)

-- ==================================================================
-- 5. 距離判定・ポップアップ制御ループ
-- ==================================================================
RunService.Heartbeat:Connect(function()
	local character = player.Character
	if not character then return end
	
	local hrp = character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	-- 登録されているすべてのボードに対して距離判定
	for _, data in ipairs(boardsData) do
		local distance = (hrp.Position - data.surfacePart.Position).Magnitude
		
		if distance <= TRIGGER_DISTANCE and not data.isOpen then
			data.isOpen = true
			data.frame.Visible = true
		elseif distance > TRIGGER_DISTANCE and data.isOpen then
			data.isOpen = false
			data.frame.Visible = false
		end
	end
end)
