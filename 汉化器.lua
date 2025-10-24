-- 使用一个更稳定的 UI 库
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 创建窗口
local Window = Rayfield:CreateWindow({
   Name = "皮空重制版 - 超级汉化器",
   LoadingTitle = "皮空重制版",
   LoadingSubtitle = "正在加载...",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "皮空脚本",
      FileName = "配置"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "皮空验证系统",
      Subtitle = "请输入卡密",
      Note = "加Q:1046855905 获取卡密",
      FileName = "皮空密钥",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"皮空脚本垃圾", "皮炎是司空的爸爸"}
   }
})

-- 等待验证通过
Rayfield:LoadConfiguration()

-- 创建标签页
local MainTab = Window:CreateTab("主界面", 4483362458)
local HHTab = Window:CreateTab("超级汉化", 4483362458)

-- 在主界面显示欢迎信息
local MainSection = MainTab:CreateSection("皮空重制版")
MainTab:CreateLabel("欢迎使用皮空重制版脚本！")
MainTab:CreateLabel("所有功能已解锁，请尽情使用！")
MainTab:CreateLabel("作者: 皮炎")
MainTab:CreateLabel("联系方式: 快手1466456286")

-- ========== 系统信息显示 ==========
local InfoSection = MainTab:CreateSection("系统信息")

-- 注入器信息
if identifyexecutor then
    MainTab:CreateLabel("你的注入器: " .. identifyexecutor())
else
    MainTab:CreateLabel("你的注入器: 未知")
end

-- 帧率显示
local FPSLabel = MainTab:CreateLabel("帧率: 计算中...")

-- 用户信息
local player = game.Players.LocalPlayer
MainTab:CreateLabel("用户名: " .. player.Name)
MainTab:CreateLabel("显示名: " .. player.DisplayName)
MainTab:CreateLabel("用户ID: " .. player.UserId)
MainTab:CreateLabel("账号年龄: " .. player.AccountAge .. " 天")

-- 更新帧率
spawn(function()
    local RunService = game:GetService("RunService")
    local counter = 0
    local lastTime = tick()
    
    while true do
        counter = counter + 1
        if tick() - lastTime >= 1 then
            FPSLabel:SetText("帧率: " .. counter .. " FPS")
            counter = 0
            lastTime = tick()
        end
        RunService.RenderStepped:Wait()
    end
end)

-- ========== 超级汉化功能 ==========
local HHSection = HHTab:CreateSection("一键汉化")

-- 超级汉化词典 (完整3000+词汇)
local superDictionary = {
    -- 基础词汇
    ["Start"] = "开始", ["Play"] = "游玩", ["Settings"] = "设置", ["Options"] = "选项",
    ["Exit"] = "退出", ["Back"] = "返回", ["Next"] = "下一步", ["Confirm"] = "确认",
    ["Cancel"] = "取消", ["OK"] = "确定", ["Yes"] = "是", ["No"] = "否", ["Close"] = "关闭",
    ["Open"] = "打开", ["Save"] = "保存", ["Load"] = "加载", ["Reset"] = "重置",
    ["Refresh"] = "刷新", ["Search"] = "搜索", ["Filter"] = "筛选", ["Sort"] = "排序",
    
    -- 游戏机制
    ["Player"] = "玩家", ["Players"] = "玩家", ["Enemy"] = "敌人", ["Boss"] = "首领",
    ["NPC"] = "NPC", ["Health"] = "生命值", ["HP"] = "生命值", ["Mana"] = "魔法值",
    ["Stamina"] = "体力", ["Experience"] = "经验", ["Level"] = "等级", ["Score"] = "分数",
    ["Money"] = "金钱", ["Coins"] = "金币", ["Gold"] = "金币", ["Gems"] = "宝石",
    ["Diamonds"] = "钻石", ["Points"] = "点数", ["Tokens"] = "代币", ["Currency"] = "货币",
    ["Damage"] = "伤害", ["Defense"] = "防御", ["Attack"] = "攻击", ["Power"] = "力量",
    ["Strength"] = "力量", ["Agility"] = "敏捷", ["Intelligence"] = "智力", ["Luck"] = "幸运",
    ["Critical"] = "暴击", ["Dodge"] = "闪避", ["Accuracy"] = "命中", ["Speed"] = "速度",
    ["Energy"] = "能量", ["Fuel"] = "燃料", ["Ammo"] = "弹药", ["Clip"] = "弹夹",
    
    -- 界面元素
    ["Menu"] = "菜单", ["Inventory"] = "背包", ["Shop"] = "商店", ["Store"] = "商店",
    ["Leaderboard"] = "排行榜", ["Chat"] = "聊天", ["Friends"] = "好友", ["Profile"] = "个人资料",
    ["Stats"] = "统计", ["Achievements"] = "成就", ["Quests"] = "任务", ["Skills"] = "技能",
    ["Equipment"] = "装备", ["Items"] = "物品", ["Weapons"] = "武器", ["Armor"] = "护甲",
    ["Tools"] = "工具", ["Consumables"] = "消耗品", ["Materials"] = "材料", ["Resources"] = "资源",
    ["Crafting"] = "制作", ["Upgrade"] = "升级", ["Enhance"] = "强化", ["Modify"] = "修改",
    ["Customize"] = "自定义", ["Appearance"] = "外观", ["Skins"] = "皮肤", ["Cosmetics"] = "装饰品",
    
    -- 动作状态
    ["Jump"] = "跳跃", ["Run"] = "奔跑", ["Walk"] = "行走", ["Sprint"] = "冲刺",
    ["Crouch"] = "蹲下", ["Swim"] = "游泳", ["Fly"] = "飞行", ["Drive"] = "驾驶",
    ["Use"] = "使用", ["Equip"] = "装备", ["Drop"] = "丢弃", ["Collect"] = "收集",
    ["Craft"] = "制作", ["Build"] = "建造", ["Destroy"] = "摧毁", ["Repair"] = "修理",
    ["Heal"] = "治疗", ["Revive"] = "复活", ["Respawn"] = "重生", ["Teleport"] = "传送",
    
    -- 状态消息
    ["Enabled"] = "已启用", ["Disabled"] = "已禁用", ["Active"] = "活跃中", ["Inactive"] = "未激活",
    ["Loading"] = "加载中", ["Processing"] = "处理中", ["Connecting"] = "连接中", ["Downloading"] = "下载中",
    ["Installing"] = "安装中", ["Updating"] = "更新中", ["Success"] = "成功", ["Failed"] = "失败",
    ["Error"] = "错误", ["Warning"] = "警告", ["Critical"] = "严重", ["Ready"] = "就绪",
    ["Complete"] = "完成", ["Finished"] = "已完成", ["Pending"] = "等待中", ["Waiting"] = "等待",
    
    -- 作弊功能
    ["Cheat"] = "作弊", ["Hack"] = "黑客", ["Script"] = "脚本", ["Executor"] = "执行器",
    ["Injector"] = "注入器", ["Exploit"] = "漏洞", ["God Mode"] = "上帝模式", ["Fly"] = "飞行",
    ["Speed"] = "速度", ["ESP"] = "透视", ["Aimbot"] = "自瞄", ["Wallhack"] = "透视",
    ["Noclip"] = "穿墙", ["Infinite"] = "无限", ["Unlimited"] = "无限", ["Auto"] = "自动",
    ["Farm"] = "刷资源", ["Win"] = "获胜", ["Kill"] = "击杀", ["Destroy"] = "摧毁",
    
    -- 设置选项
    ["Graphics"] = "图形", ["Audio"] = "音频", ["Sound"] = "声音", ["Music"] = "音乐",
    ["Controls"] = "控制", ["Keybind"] = "按键绑定", ["Resolution"] = "分辨率", ["Quality"] = "质量",
    ["Low"] = "低", ["Medium"] = "中", ["High"] = "高", ["Ultra"] = "极高",
    ["Brightness"] = "亮度", ["Volume"] = "音量", ["Sensitivity"] = "灵敏度", ["FOV"] = "视野",
    ["Language"] = "语言", ["Region"] = "区域", ["Server"] = "服务器", ["Network"] = "网络",
    
    -- 时间天气
    ["Time"] = "时间", ["Day"] = "白天", ["Night"] = "夜晚", ["Morning"] = "早晨",
    ["Afternoon"] = "下午", ["Evening"] = "傍晚", ["Weather"] = "天气", ["Sunny"] = "晴朗",
    ["Rain"] = "下雨", ["Snow"] = "下雪", ["Storm"] = "风暴", ["Fog"] = "雾",
    ["Wind"] = "风", ["Temperature"] = "温度", ["Hot"] = "热", ["Cold"] = "冷",
    
    -- 世界环境
    ["Map"] = "地图", ["World"] = "世界", ["Environment"] = "环境", ["Location"] = "位置",
    ["Area"] = "区域", ["Zone"] = "区域", ["Region"] = "地区", ["City"] = "城市",
    ["Town"] = "城镇", ["Village"] = "村庄", ["Forest"] = "森林", ["Mountain"] = "山脉",
    ["River"] = "河流", ["Lake"] = "湖泊", ["Ocean"] = "海洋", ["Desert"] = "沙漠",
    ["Cave"] = "洞穴", ["Dungeon"] = "地下城", ["Base"] = "基地", ["House"] = "房子",
    
    -- 系统功能
    ["System"] = "系统", ["Client"] = "客户端", ["Server"] = "服务器", ["Network"] = "网络",
    ["Update"] = "更新", ["Version"] = "版本", ["Download"] = "下载", ["Install"] = "安装",
    ["Uninstall"] = "卸载", ["Patch"] = "补丁", ["Fix"] = "修复", ["Bug"] = "漏洞",
    ["Crash"] = "崩溃", ["Lag"] = "延迟", ["Ping"] = "ping值", ["FPS"] = "帧率",
    
    -- 多人游戏
    ["Multiplayer"] = "多人游戏", ["Co-op"] = "合作", ["PvP"] = "玩家对战", ["Team"] = "队伍",
    ["Squad"] = "小队", ["Party"] = "队伍", ["Guild"] = "公会", ["Clan"] = "部落",
    ["Alliance"] = "联盟", ["Friend"] = "好友", ["Enemy"] = "敌人", ["Neutral"] = "中立",
    
    -- 高级功能
    ["Advanced"] = "高级", ["Premium"] = "高级", ["VIP"] = "VIP", ["Beta"] = "测试版",
    ["Experimental"] = "实验性", ["Developer"] = "开发者", ["Debug"] = "调试", ["Console"] = "控制台",
    ["Command"] = "命令", ["Interface"] = "界面", ["Theme"] = "主题", ["Color"] = "颜色",
    ["Background"] = "背景", ["Transparency"] = "透明度", ["Style"] = "样式", ["Config"] = "配置",
    
    -- 新增游戏特定词汇
    ["Spawn"] = "生成点", ["Respawn"] = "重生点", ["Checkpoint"] = "检查点", ["Save Point"] = "保存点",
    ["Objective"] = "目标", ["Mission"] = "任务", ["Quest"] = "任务", ["Challenge"] = "挑战",
    ["Event"] = "事件", ["Daily"] = "每日", ["Weekly"] = "每周", ["Monthly"] = "每月",
    ["Reward"] = "奖励", ["Prize"] = "奖品", ["Loot"] = "战利品", ["Drop"] = "掉落",
    ["Crate"] = "箱子", ["Box"] = "盒子", ["Chest"] = "宝箱", ["Container"] = "容器",
    ["Vehicle"] = "载具", ["Car"] = "汽车", ["Boat"] = "船", ["Plane"] = "飞机",
    ["Helicopter"] = "直升机", ["Bike"] = "自行车", ["Mount"] = "坐骑", ["Pet"] = "宠物",
    
    -- 角色属性
    ["Character"] = "角色", ["Avatar"] = "角色", ["Model"] = "模型", ["Mesh"] = "网格",
    ["Texture"] = "纹理", ["Animation"] = "动画", ["Emote"] = "表情", ["Gesture"] = "手势",
    ["Pose"] = "姿势", ["Face"] = "面部", ["Head"] = "头部", ["Body"] = "身体",
    ["Arms"] = "手臂", ["Legs"] = "腿部", ["Hands"] = "手", ["Feet"] = "脚",
    
    -- 游戏模式
    ["Mode"] = "模式", ["Game Mode"] = "游戏模式", ["Survival"] = "生存", ["Creative"] = "创造",
    ["Adventure"] = "冒险", ["Sandbox"] = "沙盒", ["Roleplay"] = "角色扮演", ["Minigame"] = "小游戏",
    ["Battle"] = "战斗", ["Arena"] = "竞技场", ["Tournament"] = "锦标赛", ["Competitive"] = "竞技",
    
    -- 界面组件
    ["Button"] = "按钮", ["Label"] = "标签", ["Text"] = "文本", ["Image"] = "图像",
    ["Icon"] = "图标", ["Panel"] = "面板", ["Frame"] = "框架", ["Window"] = "窗口",
    ["Tab"] = "标签页", ["Slider"] = "滑块", ["Toggle"] = "开关", ["Checkbox"] = "复选框",
    ["Dropdown"] = "下拉菜单", ["Input"] = "输入框", ["Field"] = "字段", ["Form"] = "表单",
    
    -- 通知消息
    ["Notification"] = "通知", ["Alert"] = "警报", ["Message"] = "消息", ["Info"] = "信息",
    ["Hint"] = "提示", ["Tip"] = "技巧", ["Help"] = "帮助", ["Support"] = "支持",
    ["Feedback"] = "反馈", ["Report"] = "报告", ["Contact"] = "联系", ["About"] = "关于",
    
    -- 权限安全
    ["Permission"] = "权限", ["Access"] = "访问", ["Security"] = "安全", ["Privacy"] = "隐私",
    ["Account"] = "账户", ["Login"] = "登录", ["Register"] = "注册", ["Password"] = "密码",
    ["Username"] = "用户名", ["Email"] = "邮箱", ["Verify"] = "验证", ["Authenticate"] = "认证",
    
    -- 经济交易
    ["Economy"] = "经济", ["Market"] = "市场", ["Trade"] = "交易", ["Sell"] = "出售",
    ["Buy"] = "购买", ["Price"] = "价格", ["Cost"] = "成本", ["Value"] = "价值",
    ["Discount"] = "折扣", ["Sale"] = "销售", ["Offer"] = "优惠", ["Deal"] = "交易",
    
    -- 技术术语
    ["Engine"] = "引擎", ["Render"] = "渲染", ["Shader"] = "着色器", ["Lighting"] = "照明",
    ["Shadow"] = "阴影", ["Particle"] = "粒子", ["Effect"] = "效果", ["Post Processing"] = "后期处理",
    ["Anti-Aliasing"] = "抗锯齿", ["VSync"] = "垂直同步", ["Fullscreen"] = "全屏", ["Windowed"] = "窗口化",
    
    -- 社交功能
    ["Social"] = "社交", ["Community"] = "社区", ["Group"] = "群组", ["Channel"] = "频道",
    ["Broadcast"] = "广播", ["Stream"] = "直播", ["Share"] = "分享", ["Invite"] = "邀请",
    ["Join"] = "加入", ["Leave"] = "离开", ["Kick"] = "踢出", ["Ban"] = "封禁",
    
    -- 进度系统
    ["Progress"] = "进度", ["Achievement"] = "成就", ["Badge"] = "徽章", ["Trophy"] = "奖杯",
    ["Medal"] = "奖牌", ["Rank"] = "等级", ["Tier"] = "阶层", ["Stage"] = "阶段",
    ["Phase"] = "阶段", ["Round"] = "回合", ["Match"] = "比赛", ["Game"] = "游戏",
    
    -- 常用短语
    ["Press Any Key"] = "按任意键", ["Click to Continue"] = "点击继续", ["Loading Screen"] = "加载画面",
    ["Main Menu"] = "主菜单", ["Pause Menu"] = "暂停菜单", ["Options Menu"] = "选项菜单",
    ["Game Settings"] = "游戏设置", ["Control Settings"] = "控制设置", ["Audio Settings"] = "音频设置",
    ["Video Settings"] = "视频设置", ["Graphics Settings"] = "图形设置", ["Display Settings"] = "显示设置",
    ["Network Settings"] = "网络设置", ["Account Settings"] = "账户设置", ["Privacy Settings"] = "隐私设置",
    
    -- 游戏状态
    ["Victory"] = "胜利", ["Defeat"] = "失败", ["Draw"] = "平局", ["Win"] = "获胜",
    ["Lose"] = "失败", ["Tie"] = "平局", ["Result"] = "结果", ["Scoreboard"] = "记分牌",
    ["Ranking"] = "排名", ["Leader"] = "领先者", ["Champion"] = "冠军", ["Winner"] = "获胜者",
    
    -- 时间周期
    ["Second"] = "秒", ["Minute"] = "分钟", ["Hour"] = "小时", ["Day"] = "天",
    ["Week"] = "周", ["Month"] = "月", ["Year"] = "年", ["Today"] = "今天",
    ["Yesterday"] = "昨天", ["Tomorrow"] = "明天", ["Now"] = "现在", ["Later"] = "稍后",
    
    -- 方向位置
    ["Left"] = "左", ["Right"] = "右", ["Up"] = "上", ["Down"] = "下",
    ["Forward"] = "前", ["Backward"] = "后", ["North"] = "北", ["South"] = "南",
    ["East"] = "东", ["West"] = "西", ["Center"] = "中心", ["Middle"] = "中间",
    
    -- 数量程度
    ["All"] = "全部", ["Some"] = "一些", ["None"] = "无", ["Few"] = "少数",
    ["Many"] = "许多", ["More"] = "更多", ["Less"] = "更少", ["Most"] = "最多",
    ["Least"] = "最少", ["Maximum"] = "最大", ["Minimum"] = "最小", ["Average"] = "平均",
    
    -- 作弊相关
    ["Bypass"] = "绕过", ["Anti-Cheat"] = "反作弊", ["Undetectable"] = "无法检测", ["Stealth"] = "隐身",
    ["Safe"] = "安全", ["Risk"] = "风险", ["Detection"] = "检测", ["Protection"] = "保护",
    ["Hack"] = "黑客", ["Exploit"] = "漏洞", ["Glitch"] = "故障", ["Feature"] = "功能",
    ["Advantage"] = "优势", ["Disadvantage"] = "劣势",

    -- 以下为新增3000+词汇的完整版本
    ["Aesthetic Lighting"] = "美观照明", ["Ambient"] = "环境光", ["Angle Increment"] = "角度增量", ["Anti AFK"] = "防挂机",
    ["Anti Void"] = "防虚空", ["Auto Bandage"] = "自动使用绷带", ["Auto Campfire"] = "自动生成篝火", ["Auto Chest [BETA]"] = "自动宝箱【测试版】",
    ["Auto Chop Tree Type"] = "自动砍树类型", ["Auto Chop Trees"] = "自动砍树", ["Auto Chop Trees Range"] = "自动砍树范围", ["Auto Collect"] = "自动收集",
    ["Auto Collect Coin Stacks"] = "自动收集硬币堆", ["Auto Crock Pot"] = "自动炖锅", ["Auto Eat"] = "自动进食", ["Auto Eat Food"] = "自动吃食物",
    ["Auto Fill Campfire"] = "自动填充篝火", ["Auto Open Seed Boxes"] = "自动打开种子箱", ["Auto Pickup Flowers"] = "自动拾取花朵", ["Auto Plant Saplings"] = "自动种植树苗",
    ["Auto TP to Camp at Night"] = "夜间自动传送至营地", ["Auto TP to Warm Place"] = "自动传送至温暖处", ["Automation"] = "自动化", ["Background Color"] = "背景颜色",
    ["Bandage, MedKit"] = "绷带、医疗包", ["Bolt, Tyre, Sheet Metal, Old Radio, Broken Fan, Broken Microwave, Washing Machine, Old Car Engine, UFO Scrap, UFO Component, UFO Junk, Cultist Gem, Gem of the Forest"] = "螺栓、轮胎、金属板、旧收音机、损坏的风扇、损坏的微波炉、洗衣机、旧汽车发动机、不明飞行物碎片、不明飞行物部件、不明飞行物垃圾、邪教徒宝石、森林宝石",
    ["Bring Cooldown"] = "携带冷却时间", ["Bring Food & Healing"] = "携带食物与治疗物品", ["Bring Food To Cook Pot"] = "携带食物至烹饪锅", ["Bring Fuel [BETA]"] = "携带燃料【测试版】",
    ["Bring Gears"] = "携带齿轮", ["Bring Guns & Armor"] = "携带枪支与盔甲", ["Bring Height"] = "携带高度", ["Bring Location"] = "携带位置",
    ["Bring Logs [BETA]"] = "携带原木【测试版】", ["Bring Others"] = "携带他人", ["Bring Settings"] = "携带设置", ["Bring Stuff"] = "携带物品",
    ["Build Log Walls in Circle"] = "环形建造原木墙", ["Build Radius"] = "建造半径", ["Carrot, Apple, Cake"] = "胡萝卜、苹果、蛋糕",
    ["Carrot, Mackerel, Salmon, Berry, Ribs, Stew, Steak Dinner, Morsel, Steak, Corn, Cooked Morsel, Cooked Steak, Bandage, MedKit, Chilli, Apple, Cake"] = "胡萝卜、鲭鱼、三文鱼、浆果、排骨、炖菜、牛排晚餐、小块肉、牛排、玉米、煮熟的小块肉、煮熟的牛排、绷带、医疗包、辣椒、苹果、蛋糕",
    ["Characters"] = "角色", ["Characters ESP"] = "角色ESP", ["Characters Items"] = "角色物品", ["CharactersEspColor"] = "角色ESP颜色",
    ["Chest Dropdown"] = "宝箱下拉菜单", ["Chest TP [BETA]"] = "宝箱传送【测试版】", ["Child TP"] = "儿童传送", ["Children"] = "儿童",
    ["Children ESP"] = "儿童ESP", ["Children Items"] = "儿童物品", ["ChildrenEspColor"] = "儿童ESP颜色", ["Chop Status Visualiser"] = "砍伐状态可视化器",
    ["Coal, Fuel Canister, Oil Barrel, Biofuel"] = "煤炭、燃料罐、油桶、生物燃料", ["Collect All Gold Stacks"] = "收集所有金币堆", ["Config"] = "配置", ["Coordinates"] = "坐标",
    ["Corpse, Sapling, Feather, Alien, Log, Chair, Coal, Fuel Canister, Oil Barrel, Biofuel"] = "尸体、树苗、羽毛、外星人、原木、椅子、煤炭、燃料罐、油桶、生物燃料",
    ["Credits"] = "制作人员", ["Diamond"] = "钻石", ["Do you want to close this window? You will not be able to open it again."] = "你确定要关闭此窗口吗？关闭后将无法再次打开。",
    ["ESP Settings"] = "ESP设置", ["Eat When Hunger Below"] = "饥饿值低于以下数值时进食", ["Enable Highlight"] = "启用高亮显示", ["Enable Hitbox Expansion"] = "启用碰撞箱扩大",
    ["Enable Lighting Theme"] = "启用照明主题", ["Entity Godmode"] = "实体无敌模式", ["FOV"] = "视野范围", ["Faster Bring [BETA]"] = "快速携带【测试版】",
    ["Feather, Old Rod, Flower, Coin Stack, Giant Sack, Good Sack, Seed Box, Chainsaw, Old Flashlight, Strong Flashlight, Bunny Foot, Wolf Pelt, Bear Pelt, Arctic Fox Pelt, Alpha Wolf Pelt, Polar Bear Pelt, Bear Corpse, Gem of the Forest Fragment, Diamond, Defense Blueprint"] = "羽毛、旧鱼竿、花朵、硬币堆、大袋子、优质袋子、种子箱、电锯、旧手电筒、强力手电筒、兔子脚、狼皮、熊皮、北极狐皮、阿尔法狼皮、北极熊皮、熊尸、森林宝石碎片、钻石、防御蓝图",
    ["Fill Transparency"] = "填充透明度", ["Fishing"] = "钓鱼", ["Fishing ESP"] = "钓鱼ESP", ["Fishing Items"] = "钓鱼物品",
    ["FishingEspColor"] = "钓鱼ESP颜色", ["Fly"] = "飞行", ["Fly Speed"] = "飞行速度", ["Food & Healing"] = "食物与治疗物品",
    ["Food & Healing ESP"] = "食物与治疗物品ESP", ["Food & Healing Items"] = "食物与治疗物品列表", ["Food Choice"] = "食物选择", ["FoodHealingEspColor"] = "食物与治疗物品ESP颜色",
    ["Freeze The Thingys"] = "冻结物体", ["Freeze the movement of something :3"] = "冻结某个物体的移动 :3", ["Frog, Scorpion, FrogBlue, FrogPurple, Wolf, Bear, Bunny, Arctic Fox, Mammoth, Cultist, Crossbow Cultist, Juggernaut Cultist, Polar Bear, Alpha Wolf, Alien, Alien Elite"] = "青蛙、蝎子、蓝色青蛙、紫色青蛙、狼、熊、兔子、北极狐、猛犸象、邪教徒、十字弩邪教徒、重装邪教徒、北极熊、阿尔法狼、外星人、精英外星人",
    ["Fuel"] = "燃料", ["Fuel ESP"] = "燃料ESP", ["Fuel Items"] = "燃料物品", ["Fuel Type"] = "燃料类型",
    ["FuelEspColor"] = "燃料ESP颜色", ["Fullbright"] = "全亮度", ["Fun"] = "娱乐功能", ["Gears"] = "齿轮",
    ["Gears ESP"] = "齿轮ESP", ["Gears Items"] = "齿轮物品", ["GearsEspColor"] = "齿轮ESP颜色", ["Guns & Armor"] = "枪支与盔甲",
    ["Guns & Armor ESP"] = "枪支与盔甲ESP", ["Guns & Armor Items"] = "枪支与盔甲物品", ["GunsArmorEspColor"] = "枪支与盔甲ESP颜色", ["Heal When Below"] = "生命值低于以下数值时治疗",
    ["Hip Height Changer"] = "臀部高度调整器", ["Hitbox Expansion"] = "碰撞箱扩大", ["Hitbox Size Multiplier"] = "碰撞箱大小倍数", ["Ice Aura"] = "冰之光环",
    ["Ice Aura Range"] = "冰之光环范围", ["Inf Yield"] = "无限产量", ["Infinite Jump"] = "无限跳跃", ["Information"] = "信息",
    ["Instant Catch Fish"] = "瞬间抓鱼", ["Instant Open Chests"] = "瞬间打开宝箱", ["Join Discord Server"] = "加入Discord服务器", ["Keybind to open ui"] = "打开用户界面的快捷键",
    ["Kill Aura"] = "杀戮光环", ["Kill Aura Range"] = "杀戮光环范围", ["Language Choice"] = "语言选择", ["Laser Sword, Raygun, Ice Axe, Ice Sword, Chainsaw, Strong Axe, Spear, Good Axe, Leather Body, Iron Body, Riot Shield"] = "激光剑、射线枪、冰斧、冰剑、电锯、强力斧头、长矛、优质斧头、皮革护甲、铁质护甲、防暴盾牌",
    ["Laser Sword, Raygun, Ice Axe, Ice Sword, Chainsaw, Strong Axe, Spear, Good Axe, Revolver, Rifle, Tactical Shotgun, Revolver Ammo, Rifle Ammo, Alien Armour, Frog Boots, Leather Body, Iron Body, Thorn Body, Riot Shield"] = "激光剑、射线枪、冰斧、冰剑、电锯、强力斧头、长矛、优质斧头、左轮手枪、步枪、战术霰弹枪、左轮手枪弹药、步枪弹药、外星盔甲、青蛙靴子、皮革护甲、铁质护甲、荆棘护甲、防暴盾牌",
    ["Lavender"] = "薰衣草色", ["Library Choice"] = "库选择", ["Lighting Theme"] = "照明主题", ["Linoria - ui library"] = "Linoria - 用户界面库",
    ["Load"] = "加载", ["Loads elements from config"] = "从配置中加载元素", ["Local Player"] = "本地玩家", ["Lost Child, Lost Child2, Lost Child3, Lost Child4"] = "迷路儿童、迷路儿童2、迷路儿童3、迷路儿童4",
    ["Low GFX"] = "低画质", ["Main"] = "主界面", ["Main ESP"] = "主ESP", ["Make sure to join our discord server for updates!"] = "请务必加入我们的Discord服务器以获取更新！",
    ["Max Per Item"] = "每件物品最大数量", ["MedKit included"] = "包含医疗包", ["Misc"] = "杂项", ["Movement"] = "移动",
    ["No Bring Amount Limit"] = "无携带数量限制", ["Noclip"] = "穿墙模式", ["Obsidian - ui library"] = "Obsidian - 用户界面库", ["Old Rod, Fishing Hut, Water Hole, Water Hole Big, Water Hole1"] = "旧鱼竿、钓鱼小屋、水坑、大水坑、水坑1",
    ["Other"] = "其他", ["Other TP"] = "其他传送", ["Others"] = "其他玩家", ["Others ESP"] = "其他玩家ESP",
    ["Others Items"] = "其他玩家物品", ["OthersEspColor"] = "其他玩家ESP颜色", ["Outline Color"] = "轮廓颜色", ["Outline Transparency"] = "轮廓透明度",
    ["Performance"] = "性能", ["Pickup All Flowers"] = "拾取所有花朵", ["Placeholder Text Color"] = "占位文本颜色", ["Plant Saplings in Circle"] = "环形种植树苗",
    ["Plant Stuff"] = "种植物品", ["Plant/Build Limit"] = "种植/建造限制", ["PlayerEspColor"] = "玩家ESP颜色", ["Please notify me if you need credits (erchodev#0 on discord)"] = "如需标注制作人员，请告知我（Discord：erchodev#0）",
    ["Purple"] = "紫色", ["Refresh Chest List"] = "刷新宝箱列表", ["Refresh Children List"] = "刷新儿童列表", ["Remove Fog"] = "移除雾气",
    ["Remove Sky"] = "移除天空", ["Reset Camera [Might Break your camera!]"] = "重置相机【可能导致相机故障！】", ["Reveal Map"] = "显示全图", ["Rich Shader"] = "丰富着色器",
    ["RightShift"] = "右Shift键", ["Save"] = "保存", ["Saves elements to config"] = "将元素保存到配置中", ["Security"] = "安全",
    ["Select Child"] = "选择儿童", ["Select Structure"] = "选择建筑", ["Select Theme"] = "选择主题", ["Self"] = "自身",
    ["Shader Color"] = "着色器颜色", ["Show Coordinates"] = "显示坐标", ["Show Distance"] = "显示距离", ["Small Tree, Snowy Small Tree"] = "小树、雪地小树",
    ["Start Fueling when (Fire HP)"] = "篝火生命值低于以下数值时开始添加燃料", ["Structure TP"] = "建筑传送", ["TP Walk"] = "传送行走", ["TP Walk Speed"] = "传送行走速度",
    ["TP to Camp"] = "传送至营地", ["Teleport"] = "传送", ["Teleport All BIG Trees"] = "传送至所有大树", ["Teleport All Chests"] = "传送至所有宝箱",
    ["Teleport All Children [BETA]"] = "传送至所有儿童【测试版】", ["Teleport All Trees"] = "传送至所有树木", ["Teleport Entities"] = "传送实体", ["Teleport The Entities"] = "传送指定实体",
    ["Teleport To Chest"] = "传送至宝箱", ["Teleport To Child"] = "传送至儿童", ["Teleport To Selected Structure"] = "传送至所选建筑", ["Teleport to Anvil"] = "传送至铁砧",
    ["Teleport to Caravan"] = "传送至大篷车", ["Teleport to Cultist Generator Base"] = "传送至邪教徒发电机基地", ["Teleport to Fairy"] = "传送至仙子处", ["Teleport to Fishing Hut"] = "传送至钓鱼小屋",
    ["Teleport to Stronghold"] = "传送至要塞", ["Teleport to Stronghold Diamond Chest"] = "传送至要塞钻石宝箱", ["Text Color"] = "文本颜色", ["Text Size"] = "文本大小",
    ["Theme Name"] = "主题名称", ["Toggle Window Transparency"] = "切换窗口透明度", ["Tree Farm"] = "树木农场", ["UnFreeze The Thingys"] = "解冻物体",
    ["Unload"] = "卸载", ["Update Discord Info"] = "更新Discord信息", ["Update Theme"] = "更新主题", ["Use Freecam for Bring Items"] = "使用自由视角携带物品",
    ["Useful Stuff"] = "实用物品", ["Visuals"] = "视觉效果", ["Voidware"] = "虚空软件", ["Voidware Keybind"] = "虚空软件快捷键",
    ["Voidware [Official] #50k 🎉"] = "虚空软件【官方版】#50k 🎉", ["Walk Speed"] = "行走速度", ["Welcome to Voidware!"] = "欢迎使用虚空软件！", ["Wind"] = "风",
    ["Wind - ui library"] = "Wind - 用户界面库", ["discord.gg/voidware"] = "discord.gg/voidware", ["en"] = "英语", ["en 🇺🇸"] = "英语 🇺🇸",
    ["erchodev#0 - script dev"] = "erchodev#0 - 脚本开发者", ["mdsbrnmsb"] = "mdsbrnmsb", ["mspaint v2"] = "画图软件v2",

    -- 游戏特定词汇
    ["Custom Dash Cooldown"] = "自定义冲刺冷却时间", ["0.05s/0.2s"] = "0.05秒/0.2秒", ["Config name"] = "配置名称", ["V1.9"] = "版本1.9",
    ["What Place Tool Do You Want?"] = "你想要什么放置工具？", ["Universal Scripts"] = "通用脚本", ["Voltra (Sonic)"] = "沃尔特拉（索尼克）", ["True DownSlam"] = "真实下砸",
    ["Crazy Spin"] = "疯狂旋转", ["The Garbage Ghost (Universal)"] = "垃圾幽灵（通用）", ["Loop View"] = "循环视角", ["Fly V3"] = "飞行V3",
    ["Tech"] = "技巧", ["Touch Fling"] = "触碰抛射", ["Benches"] = "长椅", ["APOPHENIA (Metal Bat)"] = "空想性错视（金属球棒）",
    ["Suiryu Animations"] = "水龙动画", ["Arcaura (Garou)"] = "阿尔考拉（饿狼）", ["Orbit Player"] = "环绕玩家", ["Auto Dodge Players"] = "自动躲避玩家",
    ["Auto Techs"] = "自动技巧", ["The Strongest Battle Grounds"] = "最强战场", ["OP"] = "强力（OverPower）", ["Minos Prime (Garou)"] = "米诺斯Prime（饿狼）",
    ["VexonHub"] = "维克斯中枢", ["Smoke"] = "烟雾", ["Lag-Ping"] = "延迟-Ping值", ["Fixcam"] = "固定镜头",
    ["Player Actions"] = "玩家动作", ["Door 1"] = "门1", ["AimLock (Character)"] = "锁定瞄准（角色）", ["Low Graphics"] = "低画质",
    ["Auto Farm Nearest"] = "自动刷取最近目标", ["Auto Twisted Tech"] = "自动扭曲技巧", ["Easy Kill Player panel"] = "简易击杀玩家面板", ["Copy Link"] = "复制链接",
    ["Select Player"] = "选择玩家", ["Counter Up"] = "计数器上升", ["TP Tool (Anim)"] = "传送工具（动画）", ["TP Dummy"] = "传送假人",
    ["Run Tool"] = "奔跑工具", ["TP Tool (Normal)"] = "传送工具（普通）", ["Speed (V Key On/Off)"] = "速度（V键开关）", ["Invis Block Tool (Buggy)"] = "隐形阻挡工具（有漏洞）",
    ["Animations"] = "动画", ["Teleport to Player"] = "传送到玩家", ["Auto Block V10"] = "自动格挡V10", ["Oreo Dash Script"] = "奥利奥冲刺脚本",
    ["Fling Aura"] = "抛射光环", ["Anti Death Counter"] = "防死亡计数器", ["No Stun"] = "无眩晕", ["JJS Gojo (Saitama)"] = "JJS五条悟（琦玉）",
    ["Where Do You Want It To Auto Place To?"] = "你想让它自动放置到哪里？", ["No Animation"] = "无动画", ["9"] = "9", ["Fling Power Value"] = "抛射力度值",
    ["Cyber Psycho (Garou)"] = "赛博疯子（饿狼）", ["Void"] = "虚空", ["Notify On Death"] = "死亡时通知", ["Antis"] = "反制类",
    ["No Dash Cool Down"] = "无冲刺冷却", ["Keyboard"] = "键盘", ["TrashCan Tool"] = "垃圾桶工具", ["Place Tools"] = "放置工具",
    ["Random"] = "随机", ["Auto Supa Stream"] = "自动超级水流", ["Anti-AFK"] = "防挂机", ["StarGlicher (Universal)"] = "星星闪烁（通用）",
    ["Toji 2 (Atomic Samurai)"] = "东堂2（原子武士）", ["Auto Get Emotes"] = "自动获取表情", ["Copy Discord Link (join for more info)"] = "复制Discord链接（加入获取更多信息）",
    ["Error fetching Discord Info"] = "获取Discord信息失败", ["f3x"] = "f3x（建筑工具）", ["Farm"] = "刷取", ["Moveset"] = "招式组合",
    ["Pixel"] = "像素", ["Reset"] = "重置", ["Click Fling"] = "点击抛射", ["Ichigo Kurosaki (Saitama)"] = "黑崎一护（琦玉）",
    ["AimLock (Camera)"] = "锁定瞄准（镜头）", ["Autos"] = "自动类", ["Strange Attacks (All moves fall from above)"] = "诡异攻击（所有招式从上方落下）", ["Suriyu (Garou)"] = "水龙（饿狼）",
    ["Hide Parts"] = "隐藏部件", ["Kenjihin (Saitama)"] = "健二郎（琦玉）", ["Loop Fling"] = "循环抛射", ["Play Animation"] = "播放动画",
    ["Mahito (Saitama)"] = "真人（琦玉）", ["Jump"] = "跳跃", ["Tools"] = "工具", ["Unable to load Discord information. Check your internet connection."] = "无法加载Discord信息，请检查网络连接。",
    ["Atomic Slash Up"] = "原子上斩", ["Auto Give Kills"] = "自动获取击杀数", ["Baldy Dummy"] = "光头假人", ["Auto Farm Lowest Health"] = "自动刷取最低生命值目标",
    ["#000000"] = "#000000（黑色十六进制代码）", ["#191919"] = "#191919（深灰色十六进制代码）", ["#282828"] = "#282828（深灰色十六进制代码）", ["#a2a2a2"] = "#a2a2a2（浅灰色十六进制代码）",
    ["#ffffff"] = "#ffffff（白色十六进制代码）", ["-1/-0.1"] = "-1/-0.1（数值比例）", ["0, 0, 0"] = "0, 0, 0（RGB颜色代码，黑色）", ["0/150"] = "0/150（数值比例）",
    ["0/2"] = "0/2（数值比例）", ["0201uta"] = "0201uta（标识代码）", ["100%"] = "100%（百分之百）", ["1234567893153"] = "1234567893153（数字编号）",
    ["125%"] = "125%（百分之一百二十五）", ["1474807"] = "1474807（数字编号）", ["150%"] = "150%（百分之一百五十）", ["162, 162, 162"] = "162, 162, 162（RGB颜色代码，浅灰色）",
    ["175%"] = "175%（百分之一百七十五）", ["2.5/6"] = "2.5/6（数值比例）", ["200%"] = "200%（百分之二百）", ["25, 25, 25"] = "25, 25, 25（RGB颜色代码，深灰色）",
    ["255, 255, 255"] = "255, 255, 255（RGB颜色代码，白色）", ["2D"] = "2D（二维/标识代码）", ["2x Vote Count"] = "2倍投票数", ["3/10"] = "3/10（数值比例）",
    ["30"] = "30（数字）", ["40, 40, 40"] = "40, 40, 40（RGB颜色代码，深灰色）", ["50"] = "50（数字）", ["50%"] = "50%（百分之五十）",
    ["75%"] = "75%（百分之七十五）", ["80"] = "80（数字）", ["85"] = "85（数字）", ["90"] = "90（数字）",
    ["95"] = "95（数字）", ["9p6vbrde"] = "9p6vbrde（标识代码）", ["AX-SCRIPTS"] = "AX-SCRIPTS（脚本名称）", ["Aa20120402"] = "Aa20120402（标识代码）",
    ["Aimlock Mode"] = "瞄准锁定模式", ["Always Can Revive"] = "始终可复活", ["Anti Fall"] = "防坠落", ["Anti die after cutscene"] = "过场动画后防死亡",
    ["Ashilywan"] = "Ashilywan（名称/标识）", ["Attach Hider"] = "附着隐藏者", ["Attach Target"] = "附着目标", ["Auto Choke"] = "自动窒息",
    ["Auto Dalgona (all execs)"] = "自动椪糖（所有执行程序）", ["Auto Dalgona (without hookfunction)"] = "自动椪糖（无挂钩函数）", ["Auto Equip Tool"] = "自动装备工具", ["Auto Equip Weapons"] = "自动装备武器",
    ["Auto Knife"] = "自动出刀", ["Auto New Round"] = "自动新回合", ["Auto Next Game"] = "自动下一局游戏", ["Auto QTEs"] = "自动快速反应事件",
    ["Auto Return Lobby"] = "自动返回大厅", ["Auto-Win"] = "自动获胜", ["BBot"] = "BBot（名称）", ["Bato11157"] = "Bato11157（名称/标识）",
    ["Biggest Threat"] = "最大威胁", ["Boosts"] = "增益效果", ["Box Type"] = "方框类型", ["Bring Guards"] = "召唤守卫",
    ["BuilderSans"] = "BuilderSans（字体名）", ["Catppuccin"] = "Catppuccin（主题名）", ["Combat"] = "战斗", ["Content Creator"] = "内容创作者",
    ["Corner Box Esp"] = "角落方框显示（ESP）", ["Custom Player Tag"] = "自定义玩家标签", ["Custom Player Tag (NOT FE)"] = "自定义玩家标签（非前沿）", ["DDD"] = "DDD（内部功能）",
    ["DPI"] = "DPI缩放", ["Damage Boost (NOT FE)"] = "伤害增益（非前沿）", ["Disable Dash Cooldown"] = "禁用冲刺冷却", ["Disable Double Jump Cooldown"] = "禁用二段跳冷却",
    ["Disable Effects"] = "禁用效果", ["Disable Injury"] = "禁用受伤", ["Disable Ragdoll"] = "禁用布娃娃效果", ["Disable Rope (Anti Death)"] = "禁用绳索（防死亡）",
    ["Disable Spikes"] = "禁用尖刺", ["Disable Stun"] = "禁用眩晕", ["ESP Elements"] = "显示元素（ESP）", ["Emote Pages"] = "表情页面",
    ["Emotes"] = "表情动作", ["Enable Aimlock"] = "启用瞄准锁定", ["Enable VIP"] = "启用VIP", ["Equip Power"] = "装备能力",
    ["Equip Title"] = "装备头衔", ["Exclude Opposing Team"] = "排除对手队伍", ["Exclude Own Team"] = "排除己方队伍", ["Extras"] = "额外功能",
    ["Exxl_hhx"] = "Exxl_hhx（名称/标识）", ["Face Target"] = "面向目标", ["Fast Sprint"] = "快速冲刺", ["Faster Sprint (5 TO UNLOCK DASH)"] = "更快冲刺（达到5级解锁冲刺）",
    ["Finish Glass Bridge"] = "完成玻璃桥", ["Finish Jump Rope"] = "完成跳绳", ["Finish Red Light, Green Light"] = "完成红灯绿灯", ["Float Above Fight Arena"] = "漂浮在战斗场地上方",
    ["Follow Movement Type"] = "跟随移动类型", ["Fork, Bottle, Pole, Kn..."] = "叉子、瓶子、杆子、刀...", ["Frontman"] = "前线人员/主持人", ["G0rb4nArr0w"] = "G0rb4nArr0w（名称/标识）",
    ["Game Administrator"] = "游戏管理员", ["Game Animator"] = "游戏动画师", ["Game Artist"] = "游戏美术师", ["Game Builder"] = "游戏构建者",
    ["Game Contributor"] = "游戏贡献者", ["Game Developer"] = "游戏开发者", ["Game Modeller"] = "游戏建模师", ["Game Moderator"] = "游戏 moderator（调解员/管理员）",
    ["Game SFX Designer"] = "游戏音效设计师", ["Game VIP"] = "游戏VIP", ["Gamepasses (NOT FE)"] = "游戏通行证（非前沿）", ["Get All"] = "获取全部",
    ["Get Lighter"] = "获取打火机", ["Gfhyyhh2"] = "Gfhyyhh2（名称/标识）", ["Glass Manufacturer Vision"] = "玻璃制造商视角", ["Gotham"] = "Gotham（字体名）",
    ["Gruvbox"] = "Gruvbox（主题名）", ["Guards Hitbox + ESP"] = "守卫碰撞箱+显示（ESP）", ["Guards Hitbox Size"] = "守卫碰撞箱大小", ["Help the Injured"] = "帮助受伤者",
    ["Hgdefijrfmj"] = "Hgdefijrfmj（名称/标识）", ["Hide N' Seek"] = "捉迷藏", ["Hide Nametag"] = "隐藏名称标签", ["Him"] = "他（指代特定角色）",
    ["Honeycomb Artist"] = "蜂巢艺术家", ["Ikuto2305"] = "Ikuto2305（名称/标识）", ["Instant Climb"] = "瞬间攀爬", ["Interact Reach"] = "交互距离",
    ["Jura"] = "Jura（字体名）", ["KOROS975"] = "KOROS975（名称/标识）", ["Keep Playing"] = "继续游戏", ["Last Dinner"] = "最后的晚餐",
    ["LidqSB"] = "LidqSB（名称/标识）", ["Lights Out"] = "熄灯", ["Lixinrt"] = "Lixinrt（名称/标识）", ["Lntmnthis"] = "Lntmnthis（名称/标识）",
    ["Lobby"] = "大厅", ["LookingAt"] = "正看向（目标）", ["MAKOT0926"] = "MAKOT0926（名称/标识）", ["Manipulator"] = "操纵者",
    ["Material"] = "Material（主题名）", ["Miscs"] = "杂项功能", ["Modded Gun"] = "改装枪支", ["Monokai"] = "Monokai（主题名）",
    ["Movement Type"] = "移动类型", ["Mspaint"] = "画图（软件名，Microsoft Paint）", ["NIZINOKAIV"] = "NIZINOKAIV（名称/标识）", ["Nord"] = "Nord（主题名）",
    ["Normal"] = "正常", ["Oceanic Next"] = "Oceanic Next（主题名）", ["Okayu4868"] = "Okayu4868（名称/标识）", ["PARKOUR ARTIST"] = "跑酷艺术家",
    ["PHANTOM STEP"] = "幻影步", ["Peabert"] = "Peabert（名称/标识）", ["Peabert1 | lvl 5"] = "Peabert1|5级", ["Peabert2 | lvl 5"] = "Peabert2|5级",
    ["Peabert3 | lvl 10"] = "Peabert3|10级", ["Peabert4 | lvl 10"] = "Peabert4|10级", ["Peabert5 | lvl 15"] = "Peabert5|15级", ["Peabert6 | lvl 15"] = "Peabert6|15级",
    ["Perfect"] = "完美", ["Pickup Bandages"] = "拾取绷带", ["Pickup Keys"] = "拾取钥匙", ["Play/Pause Emote"] = "播放/暂停表情",
    ["Player (NOT FE)"] = "玩家（非前沿）", ["Player Info"] = "玩家信息", ["Press 'V' to lock onto the closest enemy\nPress ' to change keybind (PC only)"] = "按'V'键锁定最近的敌人\n按'键更改按键绑定（仅电脑端）",
    ["QTE Mode"] = "快速反应事件模式", ["RREDTTYFSB"] = "RREDTTYFSB（名称/标识）", ["Red Light, Green Light"] = "红灯绿灯", ["Reveal Safe & Fake Glass"] = "显示安全与虚假玻璃",
    ["Rich Millionaire"] = "富有的百万富翁", ["RobotoMono"] = "RobotoMono（字体名）", ["Roboto"] = "Roboto（字体名）", ["RohanC_Cao4"] = "RohanC_Cao4（名称/标识）",
    ["Rope Pull Mode"] = "拉绳模式", ["SFX Designer"] = "音效设计师", ["Sackboy"] = "麻布仔（游戏角色名）", ["Safe Zone"] = "安全区",
    ["Safe Zone (Last Dinner)"] = "安全区（最后的晚餐）", ["Select Injured Player"] = "选择受伤玩家", ["Select Peabert"] = "选择Peabert", ["Select Players"] = "选择玩家",
    ["Select Power"] = "选择能力", ["Select Target Player"] = "选择目标玩家", ["Select Title"] = "选择头衔", ["Select a player to view info"] = "选择一名玩家查看信息",
    ["Set a custom tag"] = "设置自定义标签", ["Show Doors (Cir/Tri/Sqr)"] = "显示门（圆形/三角形/正方形）", ["Show Dropped Keys (Purple)"] = "显示掉落的钥匙（紫色）", ["Show Exit Doors (Yellow)"] = "显示出口门（黄色）",
    ["Show Players"] = "显示玩家", ["Show Players (Red/Blue)"] = "显示玩家（红色/蓝色）", ["Show Spikes (Black)"] = "显示尖刺（黑色）", ["Show Staircases (Brown)"] = "显示楼梯（棕色）",
    ["Sky Squid Game"] = "天空鱿鱼游戏", ["Smile70087"] = "Smile70087（名称/标识）", ["Solarized"] = "Solarized（主题名）", ["SourceSans"] = "SourceSans（字体名）",
    ["Spectate"] = "观战", ["Squid Game"] = "鱿鱼游戏", ["Squidder"] = "鱿鱼玩家（衍生词）", ["Staff Detector"] = "工作人员探测器",
    ["Stop Playing"] = "停止游戏", ["S级"] = "S级", ["TP"] = "传送（Teleport缩写）", ["Tanos"] = "塔诺斯（名称，可能指代角色）",
    ["Teahouse172"] = "Teahouse172（名称/标识）", ["Teleport to Hider"] = "传送到隐藏者处", ["Teleport to Random Player"] = "传送到随机玩家处", ["The Chosen One"] = "天选之人",
    ["The Glass Maker"] = "玻璃制造者", ["The Perfect Lifeform"] = "完美生命体", ["The Recruiter"] = "招募者", ["The Strongest"] = "最强者",
    ["Throw Pole"] = "投掷杆子", ["Tracer"] = "追踪线/追踪者", ["Troll"] = "捣乱/恶作剧", ["Troll the Injured"] = "捉弄受伤者",
    ["Tug of War"] = "拔河", ["Tween"] = "补间动画/过渡效果", ["Ubuntu"] = "Ubuntu（字体名）", ["Ugfhjjrt"] = "Ugfhjjrt（名称/标识）",
    ["Use this one only if you died after the cutscene:"] = "仅当过场动画后死亡时使用此功能：", ["Voice Actor"] = "配音演员", ["Wehfhhfjhx"] = "Wehfhhfjhx（名称/标识）", ["Won Boost (NOT FE)"] = "胜利增益（非前沿）",
    ["X"] = "X轴偏移", ["Z"] = "Z轴偏移", ["Z"] = "Z键", ["[ ] Attach Hider (Toggle)"] = "[ ] 附着隐藏者（切换）",
    ["[ ] Attach Target (Toggle)"] = "[ ] 附着目标（切换）", ["[ ] Auto Balance (Toggle)"] = "[ ] 自动平衡（切换）", ["[ ] Auto Dodge (Toggle)"] = "[ ] 自动闪避（切换）",
    ["[ ] Auto Knife (Toggle)"] = "[ ] 自动出刀（切换）", ["[ ] Face Target (Toggle)"] = "[ ] 面向目标（切换）", ["[ ] Fly (Toggle)"] = "[ ] 飞行（切换）", ["[ ] Kill Aura (Toggle)"] = "[ ] 杀戮光环（切换）",
    ["[ ] Noclip (Toggle)"] = "[ ] 穿墙（切换，No Clipping缩写）", ["[ ] Safe Zone (Last Dinner) (Toggle)"] = "[ ] 安全区（最后的晚餐）（切换）", ["[ ] Safe Zone (Toggle)"] = "[ ] 安全区（切换）", ["aaaaabbbbb433"] = "aaaaabbbbb433（标识代码）",
    ["asd2331456789"] = "asd2331456789（标识代码）", ["askatiti"] = "askatiti（名称/标识）", ["aysya216"] = "aysya216（名称/标识）", ["bmylzdmydlpfmvyocmw"] = "bmylzdmydlpfmvyocmw（标识代码）",
    ["choupikabe"] = "choupikabe（名称/标识）", ["dgjhf968"] = "dgjhf968（标识代码）", ["ella_fear"] = "ella_fear（名称/标识）", ["fghcvb253"] = "fghcvb253（标识代码）",
    ["gggggg190902"] = "gggggg190902（标识代码）", ["gjpmgtm"] = "gjpmgtm（标识代码）", ["guyuan93"] = "guyuan93（名称/标识）", ["hiyu_0128"] = "hiyu_0128（名称/标识）",
    ["hjygfgg0"] = "hjygfgg0（标识代码）", ["hz1djq"] = "hz1djq（标识代码）", ["ikun123625"] = "ikun123625（名称/标识）", ["iskcieicbwocfe"] = "iskcieicbwocfe（标识代码）",
    ["kaeda271"] = "kaeda271（名称/标识）", ["keimi0210"] = "keimi0210（名称/标识）", ["khyla3992"] = "khyla3992（名称/标识）", ["lan56762"] = "lan56762（名称/标识）",
    ["lxl0120"] = "lxl0120（名称/标识）", ["myunarah"] = "myunarah（名称/标识）", ["nagi122819"] = "nagi122819（名称/标识）", ["pgbdp1"] = "pgbdp1（标识代码）",
    ["quan3987401"] = "quan3987401（名称/标识）", ["qwerr333211"] = "qwerr333211（标识代码）", ["qwqeurjd"] = "qwqeurjd（标识代码）", ["real911creation"] = "real911creation（名称/标识）",
    ["render120214"] = "render120214（标识代码）", ["sagawaoo2"] = "sagawaoo2（名称/标识）", ["shiyi1016"] = "shiyi1016（名称/标识）", ["smll0808"] = "smll0808（名称/标识）",
    ["sqhfma"] = "sqhfma（标识代码）", ["sunggon904"] = "sunggon904（名称/标识）", ["tngus130603"] = "tngus130603（名称/标识）", ["ujgkkou"] = "ujgkkou（标识代码）",
    ["wjopdqdcioqw"] = "wjopdqdcioqw（标识代码）", ["xhffyguyg"] = "xhffyguyg（标识代码）", ["ygchchx444"] = "ygchchx444（标识代码）", ["yuito0215t"] = "yuito0215t（名称/标识）",
    ["yuto52326"] = "yuto52326（名称/标识）", ["yzsd4"] = "yzsd4（标识代码）",

    -- 更多游戏词汇
    ["Auto Kyoto Script"] = "自动京都脚本", ["Fling Player"] = "抛射玩家", ["Remote Spy"] = "远程监视", ["Tornado Dash Script"] = "龙卷风冲刺脚本",
    ["BackDash Script (MOBILE)"] = "后跳脚本（移动端）", ["Special Animations"] = "特殊动画", ["Fake Downslam"] = "假下砸", ["Flowing + Grasp"] = "流水+抓取",
    ["Gojo 2 (Saitama)"] = "五条悟2（琦玉）", ["TP Frozen Lock"] = "传送冻结锁定", ["Big SafeZone"] = "大型安全区", ["View Player (3 sec)"] = "查看玩家（3秒）",
    ["Teleport Panel"] = "传送面板", ["Atomic Slash"] = "原子斩", ["ServerHop"] = "切换服务器", ["Auto Hit"] = "自动命中",
    ["Supa Dash Script"] = "超级冲刺脚本", ["Speed Boost Value"] = "速度提升值", ["Spawn Fe Stone Effects"] = "生成Fe石头特效", ["Sonic Animations"] = "索尼克动画",
    ["Auto Whirlwind Dunk"] = "自动旋风扣篮", ["Yuji/Sukuna (Saitama)"] = "虎杖悠仁/宿傩（琦玉）", ["Fighting"] = "战斗", ["Anim Logger"] = "动画日志器",
    ["MetalBat Animations"] = "金属球棒动画", ["Anti Invisibility"] = "反隐形", ["Play/Stop"] = "播放/停止", ["Use Anim Ids To Play Anim"] = "使用动画ID播放动画",
    ["Characther Movesets"] = "角色招式组合（原拼写有误，正确为Character）", ["Destroy Spawned Stones (By ItsLouisPlayz)"] = "摧毁生成的石头（作者：ItsLouisPlayz）", ["Anti Lag"] = "防延迟", ["Join our discord for more info and stuff"] = "加入我们的Discord获取更多信息和内容",
    ["AimLock Cam"] = "锁定瞄准镜头", ["Anti Fly Bypass"] = "防飞行绕过", ["Buy limited Emotes (You can buy limited emotes that have been removed from the game with robux)"] = "购买限定表情（可使用Robux购买已从游戏移除的限定表情）", ["Loop Teleport"] = "循环传送",
    ["M1 Click Reach"] = "M1点击范围", ["Trash-Can Man (Universal)"] = "垃圾桶人（通用）", ["200"] = "200", ["100"] = "100",
    ["Instant Twisted Tech"] = "即时扭曲技巧", ["Counter"] = "计数器", ["Chainsaw Man (Garou)"] = "电锯人（饿狼）", ["Trees"] = "树木",
    ["Auto Void/Place"] = "自动虚空/放置", ["Auto Safe Zone"] = "自动安全区", ["VFX Logger"] = "视觉特效日志器", ["Crazy Dance"] = "疯狂舞蹈",
    ["Genos Animations"] = "杰诺斯动画", ["Toji (Sonic)"] = "东堂（索尼克）", ["Tatsumaki Animations"] = "龙卷动画", ["nil"] = "空值",
    ["TP Stuff"] = "传送物品", ["Jump Boost Value"] = "跳跃提升值", ["Dex Explorer"] = "德克斯探索器", ["TrashCan Kill Farmer"] = "垃圾桶击杀刷取者",
    ["Tp Back Old Pos"] = "传送回旧位置", ["Enter Player Name To Select Target"] = "输入玩家名称选择目标", ["Upper + Grasp"] = "上勾+抓取", ["M1 Reset Script"] = "M1重置脚本",
    ["Teleport Places"] = "传送地点", ["Anti Fling"] = "防抛射", ["Okarun (Garou)"] = "冈伦（饿狼）", ["Middle Of Map"] = "地图中央",
    ["AimLock Character"] = "锁定瞄准角色", ["Montain"] = "山脉（原拼写有误，正确为Mountain）", ["Little SafeZone"] = "小型安全区", ["Door 2"] = "门2",
    ["Invisiblity"] = "隐形（原拼写有误，正确为Invisibility）", ["Costum Touch Fling Power"] = "自定义触碰抛射力度（原拼写有误，正确为Custom）", ["Sukuna (Atomic Samurai)"] = "宿傩（原子武士）", ["Atomic Base"] = "原子基地",
    ["Places"] = "地点", ["Atomic Base Up"] = "原子基地上方", ["Grass"] = "草地", ["Garou Animations"] = "饿狼动画",
    ["Goku V2 (Garou)"] = "悟空V2（饿狼）", ["JK (Saitama)"] = "JK（琦玉）", ["Atomic Samurai Animations"] = "原子武士动画", ["Gojo 3 (Saitama)"] = "五条悟3（琦玉）",
    ["Select Place"] = "选择地点", ["Hakari (Saitama)"] = "灰里（琦玉）", ["KJ (Garou)"] = "KJ（饿狼）", ["Super Run Tool"] = "超级奔跑工具",
    ["Roast Dead Players"] = "调侃死亡玩家", ["Loop Dash Script"] = "循环冲刺脚本", ["Gojo 1 (Saitama)"] = "五条悟1（琦玉）", ["Player Selection"] = "玩家选择",
    ["Gojo (Garou)"] = "五条悟（饿狼）", ["Fling All (Buggy?)"] = "抛射全部（有漏洞？）", ["Sukuna (Garou)"] = "宿傩（饿狼）", ["jdbdjdbhsh"] = "乱码（无实际含义）",
    ["Toji (Atomic Samurai)"] = "东堂（原子武士）", ["Backdash Script (PC)"] = "后跳脚本（电脑端）", ["Darkness"] = "黑暗", ["Rejoin"] = "重新加入",
    ["Saitama Animations"] = "琦玉动画", ["Grape Dummy :>"] = "葡萄假人 :>", ["Discord"] = "Discord（聊天软件）", ["Jerk Of Tool"] = "工具抽搐",
    ["Copy Discord Link"] = "复制Discord链接", ["Prison"] = "监狱", ["Auto Supa Uppercut"] = "自动超级上勾拳", ["Tech Scripts"] = "技巧脚本",
    ["Autowin"] = "自动获胜", ["Food Type"] = "食物类型", ["[Y] SafePart TP Keybind (Toggle)"] = "[Y] 安全区域传送快捷键（切换）", ["Spread"] = "扩散度",
    ["Fire Rate"] = "射速", ["Custom Title Color"] = "自定义标题颜色", ["Always Run"] = "始终奔跑", ["v2.4 - Made by TexRBLX"] = "版本2.4 - 由TexRBLX制作",
    ["Auto Power-Hold"] = "自动蓄力", ["Open Keybind Menu"] = "打开快捷键菜单", ["Fling All Whitelist"] = "全部抛射白名单", ["Enable Offsets"] = "启用偏移",
    ["Input Activation Distance"] = "输入激活距离", ["V2.0.5"] = "版本2.0.5", ["V1.9.1"] = "版本1.9.1", ["Key Select"] = "按键选择",
    ["Custom Slide Strength"] = "自定义滑铲强度", ["Select Material"] = "选择材质", ["#f44786"] = "#f44786（颜色代码）", ["Rebel"] = "反抗者",
    ["PEABERT"] = "皮伯特（名称）", ["Input Safe Part Height"] = "输入安全区域高度", ["Ink Game"] = "墨水游戏", ["Anti-Fling"] = "防抛射",
    ["125/2000"] = "125/2000", ["[V] Auto Power-Hold Keybind (Toggle)"] = "[V] 自动蓄力快捷键（切换）", ["Health Text"] = "生命值文本", ["Killing Glass Color"] = "致命玻璃颜色",
    ["0"] = "0", ["Auto Hide And Seek"] = "自动捉迷藏", ["Enable Kill Aura"] = "启用杀戮光环", ["PVP"] = "玩家对战",
    ["Player Information"] = "玩家信息", ["Games"] = "游戏", ["100/500"] = "100/500", ["0.05s/0.5s"] = "0.05秒/0.5秒",
    ["Weapon"] = "武器", ["V2.3.1"] = "版本2.3.1", ["Auto Jump Rope"] = "自动跳绳", ["Auto Climb"] = "自动攀爬",
    ["CFrame Fly Speed"] = "坐标飞行速度", ["1.5/5"] = "1.5/5", ["Teleport Distance"] = "传送距离", ["Anti-Stun"] = "防眩晕",
    ["Hide Name"] = "隐藏名称", ["Anti-Injury"] = "防受伤", ["V2.1.1"] = "版本2.1.1", ["Teleport Location"] = "传送位置",
    ["Power-Hold TP"] = "蓄力传送", ["Default value"] = "默认值", ["Config list"] = "配置列表", ["Tug Of War"] = "拔河",
    ["Glass Maker: Yes"] = "玻璃制造器：是", ["Select Vote"] = "选择投票", ["Auto QTE"] = "自动快速反应事件", ["#0f0f0f"] = "#0f0f0f（颜色代码）",
    ["Safety Net Offset"] = "安全网偏移", ["Safe Part Height"] = "安全区域高度", ["Aim Assist"] = "瞄准辅助", ["No Cooldown Slide"] = "无冷却滑铲",
    ["Custom Saturation"] = "自定义饱和度", ["Highlight Target"] = "高亮目标", ["2/10"] = "2/10", ["0/20"] = "0/20",
    ["Added back gun mods, added FPS Boost and hide name, and fps should be better now (ACTUALLY)"] = "恢复枪支模组，新增帧率提升和隐藏名称功能，现在帧率应该真的变好了", ["Auto Attack"] = "自动攻击", ["Glass Highlight"] = "玻璃高亮", ["117, 76, 236"] = "117, 76, 236（RGB颜色）",
    ["Teleport Method"] = "传送方式", ["0 seconds/3 seconds"] = "0秒/3秒", ["Input Speed"] = "输入速度", ["Notification Side"] = "通知位置",
    ["You can join my server to leave suggestions & bug reports."] = "你可以加入我的服务器提交建议和bug报告", ["FPS Boost"] = "帧率提升", ["Dash Cooldown"] = "冲刺冷却时间", ["Optimized script for future features."] = "为未来功能优化脚本",
    ["0/1"] = "0/1", ["Smoothness"] = "平滑度", ["60/1000"] = "60/1000", ["Added more options to UI Settings, you can now open up keybind menu + change menu keybind."] = "为界面设置添加更多选项，现在可打开快捷键菜单并修改菜单快捷键",
    ["Spike Kill"] = "尖刺击杀", ["114/1000"] = "114/1000", ["Bypassed AC (AGAIN), and fixed the script not being able to be loaded more than once."] = "再次绕过反作弊，修复脚本无法多次加载的问题", ["[G] Freeze Keybind (Toggle)"] = "[G] 冻结快捷键（切换）",
    ["Jump Rope"] = "跳绳", ["Disable Jump Fatigue"] = "禁用跳跃疲劳", ["Velocity Fly Speed"] = "速度飞行速度", ["Removed Silent Aim and RLGL God-mode temporarily, as they are now detected. (this ac dev pmo)"] = "暂时移除无声瞄准和RLGL无敌模式，因现已被检测（反作弊开发者真讨厌）",
    ["Watermark"] = "水印", ["1000/5000"] = "1000/5000", ["God Mode"] = "无敌模式", ["Enable Dodge"] = "启用闪避",
    ["UI is obsidian, Library made by deivid."] = "界面为黑曜石风格，库由deivid制作", ["Credits & Server"] = "鸣谢与服务器", ["[X] Face Closest Keybind (Toggle)"] = "[X] 面向最近目标快捷键（切换）", ["Dalgona"] = "달고나（糖饼游戏）",
    ["Auto-Dodge"] = "自动闪避", ["Anti-Ragdoll"] = "防 ragdoll 物理效果", ["Target Part"] = "目标部位", ["Hip Height"] = "臀部高度",
    ["Added Remove Spikes for HS and No Fall for glass bridge (shoutout to Kendu303 for giving me the code for nofall), fixed crack godmode, and most fps lag issues should be mitigated."] = "为捉迷藏添加移除尖刺功能，为玻璃桥添加防坠落功能（感谢Kendu303提供防坠落代码），修复裂缝无敌模式，大部分帧率卡顿问题应已缓解", ["Join discord for changelog, massive update cannot list here."] = "加入Discord查看更新日志，重大更新无法在此列出", ["Range"] = "范围", ["12hr/24hr"] = "12小时制/24小时制",
    ["Custom Cursor"] = "自定义光标", ["WARNING: Only use after picking up a gun!"] = "警告：仅在拿起枪支后使用！", ["Gun Mods (Rebel)"] = "枪支模组（反抗者）", ["Material Color"] = "材质颜色",
    ["Some features take inspiration from jorsan's old open source script for this game."] = "部分功能灵感来自jorsan为该游戏制作的旧开源脚本", ["V1.6"] = "版本1.6", ["20 studs/500 studs"] = "20单位/500单位（游戏距离单位）", ["Menu"] = "菜单",
    ["0/30"] = "0/30", ["Rope Pull Interval"] = "拉绳间隔", ["Red Light Green Light"] = "红灯绿灯", ["Hide and Seek"] = "捉迷藏",
    ["Enable Silent Aim"] = "启用无声瞄准", ["10 studs/500 studs"] = "10单位/500单位（游戏距离单位）", ["#754cec"] = "#754cec（颜色代码）", ["Fly"] = "飞行",
    ["Dash & Abilities"] = "冲刺与技能", ["250, 0, 0"] = "250, 0, 0（RGB颜色）", ["Health TP Value"] = "生命值传送值", ["[T] Teleport Keybind (Toggle)"] = "[T] 传送快捷键（切换）",
    ["0.1/0.1"] = "0.1/0.1", ["[N] Noclip Keybind (Toggle)"] = "[N] 穿墙快捷键（切换）", ["Anti-Fall (Safety Net)"] = "防坠落（安全网）", ["Enable Phantom Dash Ability"] = "启用幻影冲刺技能",
    ["V2.3"] = "版本2.3", ["Power: PHANTOM STEP"] = "技能：幻影步", ["Fixed alot of bugs and made the teleporter better for lights out."] = "修复大量漏洞，优化熄灯场景下的传送器", ["V1.5"] = "版本1.5",
    ["Time"] = "时间", ["10000/50000"] = "10000/50000", ["30/10000"] = "30/10000", ["Select Gun"] = "选择枪支",
    ["Fullbright"] = "全亮度", ["Fling All"] = "全部抛射", ["Changes"] = "变更", ["Health Bar"] = "生命值条",
    ["Method"] = "方法", ["Waypoint Select"] = "路径点选择", ["244, 71, 134"] = "244, 71, 134（RGB颜色）", ["Sky Squid Games"] = "天空鱿鱼游戏",
    ["Added Teleport to Key and Teleport to Exit Door for hide and seek, Face Closest Player (AIMLOCK) to PVP, Delete Rope to Jump Rope, Bring Guards to Rebel, and an Unload button."] = "为捉迷藏添加传送到钥匙和传送到出口门功能，为玩家对战添加面向最近玩家（瞄准锁定）功能，为跳绳添加删除绳子功能，为反抗者添加召唤守卫功能，以及卸载按钮", ["-5 studs/-5 studs"] = "-5单位/-5单位（游戏距离单位）", ["Auto Dodge"] = "自动闪避", ["0.5/1"] = "0.5/1",
    ["Saturation Tint"] = "饱和度色调", ["Instant Interact"] = "即时交互", ["V2.2"] = "版本2.2", ["Force Time"] = "强制时间",
    ["Auto Win"] = "自动获胜", ["Freeze Self"] = "冻结自身", ["Speed Boost"] = "速度提升", ["Input JP"] = "输入跳跃力",
    ["Target Player"] = "目标玩家", ["Pickup Dropped Bandages"] = "拾取掉落的绷带", ["Highlight Color"] = "高亮颜色", ["Jump Power"] = "跳跃力",
    ["Whitelist Players"] = "玩家白名单", ["Prioritized Tools"] = "优先工具", ["Crack God-Mode"] = "裂缝无敌模式", ["V1.0.1"] = "版本1.0.1",
    ["Body Modifier"] = "身体修改器", ["Input Range"] = "输入范围", ["No Fall (Hook + TP)"] = "防坠落（钩子+传送）", ["Fixed aimlock sometimes not working, and added create new safe part button."] = "修复瞄准锁定有时失效的问题，添加创建新安全区域按钮",
    ["Player Mods"] = "玩家模组", ["Teleport Interval"] = "传送间隔", ["No Cooldown Double Jump"] = "无冷却二段跳", ["Infinite Phantom Dash"] = "无限幻影冲刺",
    ["Safe Part Teleport"] = "安全区域传送", ["Backwards Sprint"] = "反向冲刺", ["V2.1"] = "版本2.1", ["1 seconds/5 seconds"] = "1秒/5秒",
    ["V1.1.0"] = "版本1.1.0", ["Select Emote"] = "选择表情动作", ["Input Hip Height"] = "输入臀部高度", ["Auto Glass Bridge"] = "自动玻璃桥",
    ["No Fall (Troll)"] = "防坠落（恶作剧）", ["0.01/1"] = "0.01/1", ["V1.8"] = "版本1.8", ["Fixed Auto Balance pressing once instead of twice."] = "修复自动平衡只需按一次而非两次的问题",
    ["50/500"] = "50/500", ["50/200"] = "50/200", ["Offset Z"] = "Z轴偏移", ["15, 15, 15"] = "15, 15, 15（RGB颜色）",
    ["Whitelist"] = "白名单", ["Mobile Slide Button"] = "移动端滑铲按钮", ["Auto Kill Players"] = "自动击杀玩家", ["Input Health TP Value"] = "输入生命值传送值",
    ["Select Mode"] = "选择模式", ["Anti-Fall (Hook + TP)"] = "防坠落（钩子+传送）", ["UI Settings"] = "界面设置", ["Attach To Player"] = "附着到玩家",
    ["Custom themes"] = "自定义主题", ["Auto Tug Of War"] = "自动拔河", ["DPI Scale"] = "DPI缩放", ["Custom Title"] = "自定义标题",
    ["V2.4"] = "版本2.4", ["Enable Dash"] = "启用冲刺", ["25, 25, 25"] = "25, 25, 25（RGB颜色）", ["Configuration"] = "配置",
    ["Inventory: MEDIC, SHARP SHOOTER, TRICKSTER, SUPER STRENGTH, PHANTOM STEP, BLACKFLASH, HERCULES, PLAYER 120, BASEBALL STAR, PARKOUR ARTIST, WEAPON SMUGGLER, PLAYER 100, BULLDOZER"] = " inventory：医疗兵、神枪手、魔术师、超强力量、幻影步、黑闪、赫拉克勒斯、120号玩家、棒球明星、跑酷达人、武器走私者、100号玩家、推土机", ["Offset X"] = "X轴偏移", ["Auto Lights Out"] = "自动熄灯", ["Give Lighter"] = "给予打火机",
    ["0, 255, 0"] = "0, 255, 0（RGB颜色）", ["V2"] = "版本2", ["Face Closest Player"] = "面向最近玩家", ["Fly Method"] = "飞行方式",
    ["Emote Player"] = "表情动作玩家", ["Ink Game - TexRBLX | 59 fps | 125 ms | build: public build"] = "墨水游戏 - TexRBLX | 59帧/秒 | 125毫秒 | 版本：公开版本", ["Player Attach"] = "玩家附着", ["Auto Vote"] = "自动投票",
    ["Won: 333,883,954"] = "获胜次数：333,883,954", ["Auto Skip Dialogue"] = "自动跳过对话", ["This script was made by TexRBLX"] = "此脚本由TexRBLX制作", ["#ff0000"] = "#ff0000（颜色代码）",
    ["Theme list"] = "主题列表", ["Current autoload config: none"] = "当前自动加载配置：无", ["Priority List"] = "优先级列表", ["Player Tag"] = "玩家标签",
    ["Ignore Ragdolled"] = "忽略 ragdoll 状态玩家", ["#00ff00"] = "#00ff00（颜色代码）", ["#fa0000"] = "#fa0000（颜色代码）", ["Keybinds"] = "快捷键",
    ["120/1000"] = "120/1000", ["Auto Get Food"] = "自动获取食物", ["255, 0, 0"] = "255, 0, 0（RGB颜色）", ["Dodgeable Moves"] = "可闪避动作",
    ["Main Dash Power"] = "主冲刺力", ["Name"] = "名称", ["Menu Keybind"] = "菜单快捷键", ["Bring Guards Loop"] = "循环召唤守卫",
    ["Select Whitelisted Players"] = "选择白名单玩家", ["Auto Queue"] = "自动排队", ["[BETA] Auto Squid Game"] = "[测试版] 自动鱿鱼游戏", ["Enable Parkour Artist"] = "启用跑酷达人",
    ["Anti Cheat"] = "反作弊", ["Infinite Stamina"] = "无限耐力", ["Custom Dash Power"] = "自定义冲刺力", ["[F] Fly Keybind (Toggle)"] = "[F] 飞行快捷键（切换）",
    ["Require Right-Click"] = "需要右键点击", ["Auto Kill Spin Speed"] = "自动击杀旋转速度", ["Select Color"] = "选择颜色", ["Added back silent aim and rlgl godmode, forget the last change."] = "恢复无声瞄准和RLGL无敌模式，忽略上一次变更",
    ["Custom Suit Color"] = "自定义服装颜色", ["Offset Y"] = "Y轴偏移", ["TP When Health Under"] = "生命值低于时传送", ["0%/100%"] = "0%/100%",
    ["Glass Bridge"] = "玻璃桥", ["0, 63, 191"] = "0, 63, 191（RGB颜色）", ["[Minus] GodMode RLGL Keybind (Toggle)"] = "[减号] RLGL无敌模式快捷键（切换）", ["Bullets Per Fire"] = "每次射击子弹数",
    ["[BETA] Auto Sky Squid Game"] = "[测试版] 自动天空鱿鱼游戏", ["Auto Balance"] = "自动平衡", ["1/100"] = "1/100", ["Boosts: Faster Sprint: 5, Damage Boost: 5, Won Boost: 5"] = "增益：更快冲刺：5，伤害提升：5，获胜增益：5",
    ["[Z] Aim Assist Keybind (Toggle)"] = "[Z] 瞄准辅助快捷键（切换）", ["Trail Color"] = "轨迹颜色", ["[R] Killaura Keybind (Toggle)"] = "[R] 杀戮光环快捷键（切换）", ["Target Hiders"] = "目标隐藏者",
    ["Bypassed new anti-cheat, temporarily removed gun mods as it is now detected."] = "绕过新反作弊，因枪支模组现已被检测而暂时移除", ["Saturation Density"] = "饱和度密度", ["Create New Part Each Time"] = "每次创建新区域", ["0/5"] = "0/5",
    ["120px/1000px"] = "120像素/1000像素", ["Shaders are inspired by BBot."] = "着色器灵感来自BBot", ["Shaders/Ambience"] = "着色器/氛围", ["Target Priority"] = "目标优先级",
    ["Extra Prediction"] = "额外预测", ["Fling Strength"] = "抛射强度", ["Waypoints"] = "路径点", ["FOV Radius"] = "视野半径",
    ["Good Glass Color"] = "安全玻璃颜色", ["[BETA] Auto Mingle"] = "[测试版] 自动社交", ["Safe Part"] = "安全区域", ["Initial Dash Power"] = "初始冲刺力",
    ["Auto Dalgona"] = "自动糖饼游戏", ["Ambience"] = "氛围", ["V2.0.6"] = "版本2.0.6", ["Auto Pull Rope"] = "自动拉绳",
    ["Play Sound"] = "播放声音", ["#0040bf"] = "#0040bf（颜色代码）", ["Auto Kill Radius"] = "自动击杀半径", ["Custom theme name"] = "自定义主题名称",
    ["Rainbow Highlight"] = "彩虹高亮", ["Font Face"] = "字体样式", ["Auto RLGL"] = "自动RLGL", ["[H] Inf Jump Keybind (Toggle)"] = "[H] 无限跳跃快捷键（切换）",
    ["Mingle"] = "社交", ["Changelog"] = "更新日志", ["Max Bullets"] = "最大子弹数", ["[BETA] Auto Last Dinner"] = "[测试版] 自动最后的晚餐",
    ["Fixed aimlock now (I think?) and also fixed auto balance for mobile."] = "现在应该修复了瞄准锁定（我猜？），同时修复了移动端自动平衡", ["Choose Closest Player"] = "选择最近玩家",

    -- 更多词汇
    ["The spikes Wont kill you if you fall"] = "如果你掉下去，尖刺不会杀死你", ["AntiFling"] = "防抛射", ["Help Player LOOP TILL OFF"] = "帮助玩家（循环直至关闭）", ["Gets Rid Of The Rope And Creates Platform"] = "移除绳子并创建平台",
    ["TP to End (Jump Rope)"] = "传送到终点（跳绳）", ["FLING ALL HAS RISK FOR BAN"] = "全部抛射有被封禁风险", ["Pretty Safe Kill Aura Almost Impossible To Die"] = "相当安全的杀戮光环，几乎不可能死亡", ["NOTE THE ANTIPUSH\nNOT ALWAYS WORK"] = "注意：防推功能并非总能生效",
    ["Rebel Aimbot"] = "反抗者瞄准机器人", ["Delete the spikes"] = "删除尖刺", ["KILL AURA (EXTREMLY SAFE)"] = "杀戮光环（极其安全）", ["Jump Rope/Glass Bridge"] = "跳绳/玻璃桥",
    ["Random Features"] = "随机功能", ["Final"] = "最终", ["Fling All Players (INSANE OP)"] = "抛射所有玩家（极度强力）", ["Select emotes to use"] = "选择要使用的表情动作",
    ["Remove Injury"] = "移除伤害", ["Tug of War Auto (NEW)"] = "自动拔河（新增）", ["Bring Back People Start (TROLL)"] = "将玩家拉回起点（恶作剧）", ["WalkSpeed Increase (CHOOSE BELOW)"] = "移动速度提升（选择下方选项）",
    ["TP TO ALL PEABERT AND CLICK on the things automatically"] = "自动传送到所有皮伯特并点击对应物品", ["ABOUT THE MINGLE AUTOWIN"] = "关于社交自动获胜", ["Play Selected Emotes"] = "播放所选表情动作", ["Not Get Pushed When Someone Pushes"] = "有人推你时不会被推动",
    ["INSTA GRAB Poles"] = "瞬间抓取杆子", ["Troll Players Glass Bridge"] = "恶作剧玩家（玻璃桥）", ["Fly (BETA)"] = "飞行（测试版）", ["Teleport 100 Blocks Up"] = "向上传送100格",
    ["Okay so the toogle above when you turn it on it dosent Like 100% always make you win but basically if the door is ever 1/1 it will automatically tp you to a room and lock the door and if it dosen't work you gotta manually close the door and if its more then 1 player in a room it will automatically tp you to a group of players like basically your gonna be near players so you can get into a room together so its still kinda luck based"] = "好的，上面那个开关打开后，并非100%总能让你获胜，但基本上如果门显示1/1，它会自动把你传送到一个房间并锁门；如果没生效，你得手动关门。如果一个房间里不止一个玩家，它会自动把你传送到一群玩家附近，这样你就能和其他人一起进房间，所以这还是有点看运气的", ["Teleport to End"] = "传送到终点", ["Stop Emoting"] = "停止表情动作", ["Teleport 40 Blocks Down"] = "向下传送40格",
    ["TP to End (Glass Bridge)"] = "传送到终点（玻璃桥）", ["NOTE THIS IS TESTING\nBUT ITS TO AUTOPLAY"] = "注意：此功能正在测试中，但其用途是自动游玩", ["BE CARFUL USING THIS\nCOULD RISK IN BAN"] = "使用此功能请谨慎，可能有被封禁风险", ["Red Light Green Light Godmode"] = "红灯绿灯无敌模式", ["Free Lighter"] = "免费打火机",
    ["Auto Mingle Choke"] = "自动社交窒息", ["Unlock Dash Free"] = "免费解锁冲刺", ["discord.gg/ringta"] = "discord.gg/ringta（链接）", ["Auto Win Mingle"] = "社交自动获胜",
    ["Equip Phantom Power Free"] = "免费装备幻影力量", ["IT WILL AUTO TP AND GRAB POLES WHEN FREE"] = "有空位时会自动传送并抓取杆子", ["SKY SQUID GAME GODMODE (BETA)"] = "天空鱿鱼游戏无敌模式（测试版）", ["Auto Play (AFK Everything)"] = "自动游玩（一切均可挂机）",
    ["Teleport to Random Hider"] = "传送到随机隐藏者", ["Teleport to Selected Player"] = "传送到所选玩家", ["Auto Complete Dalgona"] = "自动完成糖饼游戏", ["Refresh Player List"] = "刷新玩家列表",
    ["Auto Kill NPC Guards"] = "自动击杀NPC守卫", ["End Fling All Players Early"] = "提前结束全部玩家抛射", ["Auto Presses the Skip Button for you"] = "为你自动按下跳过按钮", ["Auto Collect Bandage"] = "自动收集绷带",
    ["RINGTA"] = "林塔（名称）", ["16"] = "16", ["TP TO ALL PEABERT (BETA)"] = "传送到所有皮伯特（测试版）", ["Reset WalkSpeed to Normal"] = "将移动速度重置为正常",
    ["RedLight"] = "红灯", ["Delete The Rope"] = "删除绳子", ["THE THINGS BELOW IS\nFOR GLASS BRIDGE"] = "下方内容用于玻璃桥", ["WalkSpeed Amount"] = "移动速度数值",
    ["Tug Of War"] = "拔河", ["Hide And Seek"] = "捉迷藏", ["ANTIPUSH (BETA)"] = "防推（测试版）", ["KILL HIDERS (BETA)"] = "击杀隐藏者（测试版）",
    ["Teleports up if LOW"] = "如果位置过低则向上传送", ["Open RINGTA SCRIPTS"] = "打开林塔脚本", ["YOU HAVE TO MANUALLY CLICK TO DO DAMAGE"] = "你必须手动点击才能造成伤害",

    -- 更多游戏词汇
    ["[+] Beaks 04/19/2025"] = "[+] 鸟喙 2025年4月19日", ["[+] Anime Adventures 01/14/2025"] = "[+] 动漫冒险 2025年1月14日", ["Copy Script Loader"] = "复制脚本加载器", ["- SCROLL DOWN ! -"] = "- 向下滚动！-",
    ["[+] Fisch 11/16/2024"] = "[+] 菲什 2024年11月16日", ["Queue On Teleport (Execute Native On Teleport AKA Auto-Execute On Teleport)"] = "传送时排队（传送时执行原生指令，又称传送时自动执行）", ["Key"] = "密钥", ["Copy Key Url : Get Key (Linkvertise)"] = "复制密钥链接：获取密钥（Linkvertise平台）",
    ["Join Our Discord Server"] = "加入我们的Discord服务器", ["Copy Key Url : Get Key (Lootlabs)"] = "复制密钥链接：获取密钥（Lootlabs平台）", ["Loader"] = "加载器",

    -- 钓鱼游戏词汇
    ["Colossal Ink Bait"] = "巨型墨汁诱饵", ["Chocolate"] = "巧克力", ["GlimmerSuit Boots"] = "微光套装靴子", ["Surfboard Ray"] = "冲浪板鳐鱼",
    ["Pufferflute"] = "河豚笛", ["Hydra Haddock"] = "九头蛇黑线鳕", ["Mother Nature"] = "大自然母亲", ["Stardust"] = "星尘",
    ["Napoleonfish"] = "苏眉鱼", ["If all matches then favorite"] = "若全部匹配则设为收藏", ["Sea Bass"] = "海鲈", ["Studphin"] = " studs海豚（游戏专属名称，保留原词）",
    ["Bloop Cosmetic Crate"] = "布鲁普外观 crate（crate指宝箱，保留原词）", ["If all matches then stop"] = "若全部匹配则停止", ["Cinderstring"] = "火烬线", ["Typhoon Tuna"] = "台风金枪鱼",
    ["ikbalxx123452"] = "伊克巴尔xx123452（用户名，保留原词）", ["Baby Pond Emperor"] = "池塘帝王幼崽", ["Enchant"] = "附魔", ["Smokescreen Totem"] = "烟幕图腾",
    ["Hide All Characters"] = "隐藏所有角色", ["Lobster"] = "龙虾", ["Leedsichthys"] = "利兹鱼（古生物名称，保留原词）", ["Starfish"] = "海星",
    ["Lobster Rod"] = "龙虾钓竿", ["Controlled"] = "受控的", ["Molten Minnow"] = "熔岩米诺鱼", ["Insight"] = "洞察",
    ["Atomic Nuke"] = "原子核弹", ["Mained Lionfish"] = "主用狮子鱼（游戏术语，保留"Mained"体现使用偏好）", ["Value to Offer"] = "出价金额", ["RainbowCluster"] = "彩虹集群",
    ["Magnet Rod"] = "磁铁钓竿", ["Swordfish"] = "剑鱼", ["Ancient Orca"] = "远古虎鲸", ["LEGO"] = "乐高（品牌名，保留原词）",
    ["Beached Pearl"] = "搁浅珍珠", ["plmokn12211"] = "普洛莫克恩12211（用户名，保留原词）", ["Colossal Saccopharynx"] = "巨型囊咽鱼", ["Offer to Player"] = "向玩家出价",
    ["Spirit"] = "灵魂", ["Glimmerfin Suit Lvl 2"] = "微光鳍套装2级", ["1"] = "1（数字，保留原词）", ["Amulet"] = "护身符",
    ["Atlantean Guardian"] = "亚特兰蒂斯守护者", ["Clickbait Caster"] = "标题党抛竿器", ["Polaris Serenade"] = "北极星小夜曲", ["Unbreakable"] = "无坚不摧的",
    ["Paper Fan Rod"] = "纸扇钓竿", ["Lobster Roll"] = "龙虾卷", ["Abyssborn Monstrosity"] = "深渊诞生的怪物", ["Discover All Locations"] = "发现所有地点",
    ["Demon-Slayer"] = "恶魔杀手", ["Bluefin Tuna"] = "蓝鳍金枪鱼", ["Long Pike"] = "长梭鱼", ["Friendly Rod"] = "友好钓竿",
    ["Moosewood"] = "驼鹿木", ["Spectral Serpent"] = "幽灵海蛇", ["Parrotfish"] = "鹦嘴鱼", ["Foamrunner"] = "泡沫奔跑者",
    ["Stingray"] = "黄貂鱼", ["Blue Langanose"] = "蓝色兰加诺斯鱼（游戏专属名称，保留原词）", ["Bluesteel Egg"] = "蓝钢蛋", ["Until Size"] = "直到尺寸达到",
    ["Giant Lamprey"] = "巨型七鳃鳗", ["Twilight Tentaclefish"] = "黄昏触手鱼", ["Olmdeer"] = "奥尔姆鹿（游戏专属名称，保留原词）", ["Greedy"] = "贪婪的",
    ["Carrot Eel"] = "胡萝卜鳗鱼", ["Pine Zephyrfish"] = "松树微风鱼", ["Opalescent Catfish"] = "乳白鲶鱼", ["Golden Smallmouth Bass"] = "黄金小嘴鲈",
    ["Apex Leviathan"] = "顶点利维坦（顶级海怪）", ["Musical Crab"] = "音乐螃蟹", ["Prismize"] = "棱镜化（游戏术语，保留原词）", ["Blighted"] = "受枯萎影响的",
    ["Handwritten Note"] = "手写笔记", ["Frostling Goby"] = "小雪精灵虾虎鱼", ["String"] = "线", ["View Smasher"] = "视图粉碎者",
    ["King Oyster"] = "杏鲍菇", ["Glacial Fragment"] = "冰川碎片", ["Reset Settings"] = "重置设置", ["Meteor"] = "流星",
    ["Studster"] = " studs小子（游戏专属名称，保留原词）", ["Free Spirit Rod"] = "自由灵魂钓竿", ["Hexed"] = "被施了 hex 的（hex指巫术，保留原词）", ["Finish Reel"] = "完成收线",
    ["<b>Farm</b>"] = "<b>农场</b>", ["Magma Leviathan"] = "岩浆利维坦", ["Lagoon Leech"] = "泻湖水蛭", ["Golden Coin"] = "金币",
    ["Haunted Rod"] = "闹鬼钓竿", ["Mustard"] = "芥末", ["Cobia"] = "军曹鱼", ["Lucky"] = "幸运的",
    ["Gale Snapper"] = "狂风笛鲷", ["Tentacle Eel"] = "触手鳗鱼", ["O'Mango Goldgrin"] = "奥芒果·金 grin（grin指咧嘴笑，保留原词）", ["Ghoulfish"] = "食尸鬼鱼",
    ["Mosasaurus"] = "沧龙（古生物名称，保留原词）", ["Favorites"] = "收藏夹", ["Bloomtail"] = "绽放尾鱼", ["Shamrock Rod"] = "三叶草钓竿",
    ["Dweller Catfish"] = "栖息者鲶鱼", ["Clown Brickfish"] = "小丑砖块鱼", ["Blue"] = "蓝色", ["Western Rock Lobster"] = "西部岩龙虾",
    ["Studded"] = "镶有 studs 的（studs为游戏内货币单位，保留原词）", ["Icy Daggerfish"] = "冰匕首鱼", ["Golden Seahorse"] = "黄金海马", ["Boarfish"] = "豚鱼",
    ["Auto Open [Crate]"] = "自动打开[宝箱]", ["Eldritch Horror"] = "远古恐惧（克苏鲁题材术语，保留原词）", ["Aurous"] = "金色的", ["Frostscale Fangtooth"] = "霜鳞尖牙鱼",
    ["Gloombiter"] = "幽暗咬鱼", ["Seacow"] = "海牛", ["Snowback Char"] = "雪背红点鲑", ["Destiny Rod"] = "命运钓竿",
    ["Rex Umbrarum"] = "暗影之王（拉丁语，保留原词）", ["Midas"] = "迈达斯（点石成金的神话人物，保留原词）", ["Coney Grouper"] = "兔齿石斑鱼", ["Amberjack"] = "琥珀鱼",
    ["Beluga"] = "白鲸", ["Glimmerfin Suit Lvl 1"] = "微光鳍套装1级", ["Yellowfin Tuna"] = "黄鳍金枪鱼", ["Advanced Glider"] = "高级滑翔翼",
    ["Worm"] = "蠕虫", ["Astralhook"] = "星界钩", ["Red Marlins"] = "红马林鱼", ["Use Totem"] = "使用图腾",
    ["Sapphire Stargazer"] = "蓝宝石瞻星鱼", ["Shellphone"] = "贝壳电话", ["Faberge Egg"] = "法贝热蛋（著名彩蛋，保留原词）", ["Mace"] = "钉头锤",
    ["Flippers"] = "脚蹼", ["Singularity"] = "奇点", ["Bluefish"] = "蓝鱼", ["Crystal Carp"] = "水晶鲤鱼",
    ["Enter"] = "进入", ["Purchase"] = "购买", ["Blinking Egg"] = "闪烁的蛋", ["Adventurer's Rod"] = "冒险者钓竿",
    ["Plumrick O'Luck"] = "普拉姆里克·奥拉克（游戏角色名，保留原词）", ["Colossal Ink"] = "巨型墨汁", ["Mirage Toadfish"] = "幻影蟾鱼", ["Ghosts"] = "鬼魂",
    ["Blobfish School"] = "水滴鱼鱼群", ["Ice Crystal"] = "冰晶", ["Bluegill"] = "蓝鳃太阳鱼", ["Physpax Gun"] = "菲斯帕克斯枪（游戏专属名称，保留原词）",
    ["Mystical"] = "神秘的", ["Crowned Royal Gramma"] = "加冕皇家豆娘鱼", ["Meg's Spine"] = "梅格的脊椎", ["Brown Wood"] = "棕色木材",
    ["RegisteredNumberOfRods"] = "已注册钓竿数量", ["Summer"] = "夏天", ["Event Horizon Rod"] = "事件视界钓竿", ["Wise"] = "明智的",
    ["Zebrafishlet"] = "小斑马鱼", ["Gem Salmon"] = "宝石三文鱼", ["Mango"] = "芒果", ["Breezed"] = "受微风影响的",
    ["Umbra"] = "暗影（拉丁语，保留原词）", ["Halibut"] = "大比目鱼", ["Snowfish"] = "雪鱼", ["Warty Angler"] = "疣状琵琶鱼",
    ["Lusca"] = "卢斯卡（传说中的海怪，保留原词）", ["Brick Built Rod"] = "砖块建造钓竿", ["Dreaming Aberration"] = "梦境畸变体", ["Penguin"] = "企鹅",
    ["ameckr"] = "阿梅克（用户名，保留原词）", ["Ancient Kraken"] = "远古 Kraken（Kraken指北海巨妖，保留原词）", ["Until Enchant"] = "直到附魔", ["Kingâ€™s Blessing"] = "国王的祝福（修正字符编码问题）",
    ["Veinfin Tetra School"] = "静脉鳍脂鲤鱼群", ["Wind Elemental"] = "风元素", ["Clownfish"] = "小丑鱼", ["Mila's Magic"] = "米拉的魔法",
    ["Basalt Pike"] = "玄武岩梭鱼", ["Puritas"] = "普里塔斯（游戏专属名称，保留原词）", ["Blue Moon Totem"] = "蓝月图腾", ["Gingerbread Fish"] = "姜饼鱼",
    ["Rooted"] = "扎根的", ["Blobfish"] = "水滴鱼", ["Midas' Mates"] = "迈达斯的伙伴", ["Night Shrimp"] = "夜间虾",
    ["Ribbon Eel"] = "丝带鳗鱼", ["Clam"] = "蛤蜊", ["Sirenâ€™s Guppy"] = "塞壬的孔雀鱼（修正字符编码问题）", ["Crown Bass"] = "皇冠鲈鱼",
    ["Kraken Koi"] = "Kraken锦鲤", ["Ice"] = "冰", ["Shimmering Silverside"] = "闪烁的银边鱼", ["Golden Tentacle"] = "黄金触手",
    ["Whale Bait"] = "鲸鱼诱饵", ["Snowman"] = "雪人", ["Pale Ghost Lumpfish"] = "苍白幽灵圆鳍鱼", ["Dinosaur Skull Keystone"] = "恐龙头骨关键石",
    ["ðŸ¡"] = "🐤（小鸡表情，保留原符号）", ["Whale Egg Premium"] = "高级鲸鱼蛋", ["Check Totem"] = "检查图腾", ["Classic Polaris Serenade"] = "经典北极星小夜曲",
    ["Ashfall Pool"] = "火山灰池", ["Tidal Wave Rod"] = "潮汐波钓竿", ["Green Leaf"] = "绿叶", ["Fishing"] = "钓鱼",
    ["Aurora Rod"] = "极光钓竿", ["Obsidian Salmon"] = "黑曜石三文鱼", ["<b>Consumable</b>"] = "<b>消耗品</b>", ["Furnace Leaper"] = "熔炉跳跃鱼",
    ["Lovestorm Eel Supercharged"] = "超级充能爱风暴鳗鱼", ["Dolphin"] = "海豚", ["Sea Leviathan Pool"] = "海利维坦池", ["Haunted"] = "闹鬼的",
    ["Phoenix Rod"] = "凤凰钓竿", ["Super Flippers"] = "超级脚蹼", ["Rip_RendraZV"] = "里普·伦德拉ZV（用户名，保留原词）", ["Deep Emperor"] = "深海帝王",
    ["Soulless"] = "无灵魂的", ["Cursed Storm Totem"] = "被诅咒的风暴图腾", ["Opal"] = "蛋白石", ["Shiny"] = "闪亮的",
    ["GPS"] = "全球定位系统（保留原词）", ["Perch"] = "鲈鱼", ["Marianaâ€™s"] = "马里亚纳的（修正字符编码问题，指马里亚纳海沟）", ["Great White Shark"] = "大白鲨",
    ["Solarblaze"] = "太阳烈焰", ["Leviathan's Fang Rod"] = "利维坦尖牙钓竿", ["Jolly"] = "愉快的", ["Celestial"] = "天体的",
    ["Blarney McBreeze"] = "布拉尼·麦克布雷兹（游戏角色名，保留原词）", ["Inferno Chaser"] = "地狱追逐者", ["Use Totem at Day"] = "白天使用图腾", ["Paleontologist's Rod"] = "古生物学家钓竿",
    ["Mrs. Tentacles"] = "触手夫人", ["<b>Skin Crates</b>"] = "<b>外观宝箱</b>", ["Gale Grub"] = "狂风蛆虫", ["Snipefish"] = "鹬嘴鱼",
    ["Henry"] = "亨利（人名，保留原词）", ["<b>Fishes</b>"] = "<b>鱼类</b>", ["8-Bit Mr. Tentacles"] = "8位像素触手先生", ["Traveler's Whistle"] = "旅行者的哨子",
    ["Burnt Betta"] = "烧焦的斗鱼", ["Jellystud"] = "果冻 studs（保留原词）", ["Northstar Serpent"] = "北极星海蛇", ["Blazebelly"] = "火焰腹部鱼",
    ["Colossal Squid"] = "巨型鱿鱼", ["Superstar Rod"] = "超级明星钓竿", ["<b>Boats</b>"] = "<b>船只</b>", ["Sea Sponge"] = "海绵",
    ["Stud Turtle"] = " studs乌龟（保留原词）", ["<b>Others</b>"] = "<b>其他</b>", ["Hourglass Bait"] = "沙漏诱饵", ["Snare"] = "陷阱",
    ["Quality Bait Crate"] = "优质诱饵宝箱", ["Golden Sea Pearl"] = "黄金海珍珠", ["Oak Stripetail"] = "橡树条纹尾鱼", ["Auto Deploy Crab Cage"] = "自动部署蟹笼",
    ["Mermaidâ€™s Favor"] = "美人鱼的青睐（修正字符编码问题）", ["Blazebringer Rod"] = "火焰使者钓竿", ["Gemstone Whale Shark"] = "宝石鲸鲨", ["BlueMoon"] = "蓝月",
    ["Sea 1 Conch"] = "1号海域海螺", ["Magic Thread"] = "魔法线", ["Lingcod"] = "蛇鳕", ["Metal Panels"] = "金属板",
    ["Sparkling Totem"] = "闪耀图腾", ["Snowcap Algae Pool"] = "雪顶海藻池", ["Patriotic"] = "爱国的", ["Philosopher's Fish"] = "哲学家鱼",
    ["Giant Seadevil"] = "巨型深海琵琶鱼", ["Kittyfish"] = "小猫鱼", ["Sailfish"] = "旗鱼", ["Hide All Megalodons"] = "隐藏所有巨齿鲨",
    ["Chillshadow Chub"] = "寒冷暗影鲢鱼", ["Emberreach Lava"] = "余烬延伸熔岩", ["Cultist"] = "邪教徒", ["Countdown Perch"] = "倒计时鲈鱼",
    ["Brick Rod"] = "砖块钓竿", ["Poseidon Wrath Totem"] = "波塞冬之怒图腾", ["Shadow Egg"] = "暗影蛋", ["The Cursed Shores"] = "被诅咒的海岸",
    ["Nuke"] = "核弹", ["Lightning Minnow"] = "闪电米诺鱼", ["Cosmetic Case Legendary"] = "传奇外观箱", ["Executive Rod"] = "行政官钓竿",
    ["Voyager Rod"] = "旅行者钓竿", ["Sulfur Snapper"] = "硫磺笛鲷", ["<b>Coins</b>"] = "<b>硬币</b>", ["Auto Accept Offer"] = "自动接受出价",
    ["Gilded Pearl"] = "镀金珍珠", ["Plastic Rod"] = "塑料钓竿", ["Drown (You'll die)"] = "溺水（你会死）", ["Nates Blade"] = "内特的刀刃",
    ["Cthulu"] = "克苏鲁（神话生物，保留原词）", ["Cockatoo Squid"] = "凤头鹦鹉鱿鱼", ["Rapid Catcher"] = "快速捕捉器", ["Warty Frogfish"] = "疣状躄鱼",
    ["Ancient Kraken Pool"] = "远古Kraken池", ["Crystal Corydoras"] = "水晶兵鲶", ["Cracked Egg"] = "破碎的蛋", ["Hallucigenia"] = "怪诞虫（古生物名称，保留原词）",
    ["Mahi Mahi"] = "马希马希鱼（即鲯鳅，保留原词）", ["Onychodus"] = "爪齿鱼（古生物名称，保留原词）", ["CocoRod"] = "可可钓竿", ["Chrysalis"] = "蛹",
    ["Skipjack Tuna"] = "鲣鱼", ["Radio"] = "收音机", ["Ripple Spine"] = "涟漪脊椎", ["Eldritch Spineback"] = "远古恐惧脊背鱼",
    ["Crescent Madtom"] = "新月石猫鱼", ["Buccaneer Barracuda"] = "海盗梭鱼", ["Alien Hat"] = "外星人头盔", ["Astralhook Rod"] = "星界钩钓竿",
    ["Beachy"] = "海滩风格的", ["Embertail Eel"] = "余烬尾鳗鱼", ["Anomalous"] = "异常的", ["Megalodon"] = "巨齿鲨（古生物名称，保留原词）",
    ["Nico's Yarncaster"] = "尼科的毛线抛竿器", ["Ethereal Prism Rod"] = "空灵棱镜钓竿", ["Yellow Energy Crystal"] = "黄色能量水晶", ["Sunsquid"] = "太阳鱿鱼",
    ["Mandarinfish"] = "花斑连鳍鱼（即 mandarin鱼，保留原词）", ["Silver Egg Trophy Bobber"] = "银蛋奖杯浮标", ["Magician Narwhal"] = "魔术师独角鲸", ["Doctorfish Tang"] = "医生鱼刺尾鱼",
    ["Mango Whale"] = "芒果鲸鱼", ["Sleet"] = "冻雨", ["Yellow"] = "黄色", ["Alligator"] = "短吻鳄",
    ["Luck Boost"] = "幸运提升", ["Buddy Bond Rod"] = "伙伴羁绊钓竿", ["Skin Crate"] = "外观宝箱", ["Coral Guard"] = "珊瑚守卫",
    ["Magic Mirror"] = "魔镜", ["The Kraken Pool"] = "Kraken池", ["Seasons Rod"] = "季节钓竿", ["Aurelian"] = "金色的",
    ["Crawlurion"] = "爬行巨兽（游戏专属名称，保留原词）", ["Resourceful Rod"] = "足智多谋钓竿", ["Darkened"] = "变暗的", ["Desolate"] = "荒凉的",
    ["Column Crawler"] = "圆柱爬行虫", ["Ancient Wood"] = "远古木材", ["Magma Pike"] = "岩浆梭鱼", ["Precision Rod"] = "精准钓竿",
    ["Solar Fragment"] = "太阳碎片", ["Icy Goldfish"] = "冰金鱼", ["Until Weight Under (kg)"] = "直到重量低于（千克）", ["Auto Bestiary"] = "自动怪物图鉴",
    ["Surreal"] = "超现实的", ["Fix HUD UI (Fixes UI Disappearing)"] = "修复HUD界面（解决界面消失问题）", ["Log"] = "日志", ["Champions Rod"] = "冠军钓竿",
    ["Gorgon Grouper"] = "美杜莎石斑鱼", ["Relic Rod"] = "遗迹钓竿", ["Glossy"] = "有光泽的", ["<b>Inventory</b>"] = "<b>背包</b>",
    ["Spider Crab"] = "蜘蛛蟹", ["Turkey"] = "火鸡", ["Deep Crownfish"] = "深海皇冠鱼", ["Emerald Angelfish"] = "祖母绿天使鱼",
    ["Carrot Turtle"] = "胡萝卜乌龟", ["Iced Perch"] = "冰镇鲈鱼", ["Crestscale"] = "冠鳞鱼", ["King Jellyfish"] = "国王水母",
    ["Gazerfish"] = "凝视鱼", ["Pine Shoal"] = "松树浅滩", ["Tempest Rod"] = "暴风雨钓竿", ["Crystal Wrasse"] = "水晶隆头鱼",
    ["Borealis Snapper"] = "北极光笛鲷", ["Lagoon Lobster"] = "泻湖龙虾", ["Ice Cream"] = "冰淇淋", ["Steady"] = "稳定的",
    ["Hollow Flake Catfish"] = "空心鳞片鲶鱼", ["Emerald Elephantnose"] = "祖母绿象鼻鱼", ["Venomous"] = "有毒的", ["Abyssal"] = "深渊的",
    ["Minnowse"] = "米诺鱼群（游戏专属名称，保留原词）", ["Beginner Oxygen Tank"] = "新手氧气瓶", ["Luck Potion"] = "幸运药水", ["Taco"] = "墨西哥卷饼",
    ["Gygax Egg"] = "吉盖克斯蛋（游戏专属名称，保留原词）", ["Copy Settings"] = "复制设置", ["Shake Method"] = "摇晃方法", ["Drift Claw"] = "漂流爪子",
    ["Sunflare Tetra"] = "太阳耀斑脂鲤", ["Cursed Nuke"] = "被诅咒的核弹", ["Infant Giant Seadevil"] = "巨型深海琵琶鱼幼崽", ["Scalloped Spiny Lobster"] = "扇叶刺龙虾",
    ["Infernal"] = "地狱的", ["Dogefin"] = "狗狗币鳍鱼（结合"Doge"梗，保留原词）", ["Fallen Snowblade"] = "坠落的雪刃", ["Glitch Cap"] = "故障帽子（Glitch指程序故障，保留原词）",
    ["Gemstone"] = "宝石", ["Murkdrifter"] = "幽暗漂流者", ["Murkfin"] = "幽暗鳍鱼", ["Frog Rod"] = "青蛙钓竿",
    ["Inferno Hide"] = "地狱皮革", ["Golden Nessie"] = "黄金尼斯湖水怪（Nessie指尼斯湖水怪，保留原词）", ["Pickaxe"] = "镐头", ["Ancient Eel"] = "远古鳗鱼",
    ["Auto Reel"] = "自动收线", ["Isle of New Beginnings"] = "新开始之岛", ["Kraken Egg"] = "Kraken蛋", ["Back Fins"] = "背鳍",
    ["Check Zone Fishing"] = "检查区域钓鱼", ["Resilient"] = "有韧性的", ["Lure Speed Potion"] = "诱饵速度药水", ["Mila's Wand Of Magic"] = "米拉的魔法棒",
    ["Smallmouth Bass"] = "小嘴鲈", ["Breaker Moth"] = "破坏者飞蛾", ["Fischmas Rod"] = " Fischmas钓竿（Fischmas为"鱼节"，保留原词）", ["Auto Claim Crab Cage"] = "自动领取蟹笼",
    ["Drill"] = "钻头", ["Scarlet Ravager"] = "猩红掠夺者", ["Basic Diving Gear"] = "基础潜水装备", ["Resin"] = "树脂",
    ["Witches Ingredient"] = "女巫的材料", ["Four Eyes Fish"] = "四眼鱼", ["Magic Conch"] = "魔法海螺", ["Chillback Whitefish"] = "寒冷脊背白鱼",
    ["Mussel"] = "贻贝", ["Mythical"] = "神话的", ["Frostbane Rod"] = "霜祸钓竿", ["Training Rod"] = "训练钓竿",
    ["Limited"] = "有限的", ["Molten Ripple"] = "熔岩涟漪", ["<b>Items</b>"] = "<b>物品</b>", ["Crystal Chorus"] = "水晶合唱",
    ["Chinfish"] = "下巴鱼", ["Kraken's Herald"] = "Kraken的使者", ["Ice Jellyfish"] = "冰水母", ["Marble Maiden"] = "大理石少女",
    ["Frostfire Rod"] = "霜火钓竿", ["Skull with Crossbones Keystone"] = "骷髅十字骨关键石", ["Fixer's Rod"] = "修理者钓竿", ["Black Dragon Fish"] = "黑龙鱼",
    ["Crystal Lobster"] = "水晶龙虾", ["Use Totem at Day: Event Zone"] = "白天使用图腾：事件区域", ["Barracuda"] = "梭鱼", ["If Mutation"] = "若发生变异",
    ["Ashscale Minnow"] = "火山灰鳞米诺鱼", ["Mist Worms"] = "迷雾蠕虫", ["Rowdy McCharm"] = "吵闹的麦克查姆（游戏角色名，保留原词）", ["Equip Rod if Event Zone"] = "若在事件区域则装备钓竿",
    ["Walk on Water"] = "水上行走", ["Heart Of Zeus"] = "宙斯之心", ["Insect"] = "昆虫", ["Axolotl"] = "美西螈（保留原词）",
    ["Ancient Serpent Spine"] = "远古海蛇脊椎", ["Coral"] = "珊瑚", ["Firework Rod"] = "烟花钓竿", ["Goldbrick"] = "金砖",
    ["Megalodon Egg Premium"] = "高级巨齿鲨蛋", ["Palaeoniscum"] = "古鳕（古生物名称，保留原词）", ["Beach Ball"] = "沙滩球", ["ðŸ¦‘"] = "🦑（鱿鱼表情，保留原符号）",
    ["Carrot Pufferfish"] = "胡萝卜河豚", ["Barbed Shark"] = "带刺鲨鱼", ["Ultratech Rod"] = "超科技钓竿", ["Abundance"] = "丰富的",
    ["Deep Coral"] = "深海珊瑚", ["Frigid Taco"] = "寒冷墨西哥卷饼", ["Bream"] = "鲷鱼", ["Scurvy Rod"] = "坏血病钓竿",
    ["Oak"] = "橡树", ["Clowned Triggerfish"] = "小丑扳机鱼", ["Colossal Carp"] = "巨型鲤鱼", ["Reef Goby"] = "礁虾虎鱼",
    ["Aqua Scribe"] = "水之抄写员", ["Emberwing"] = "余烬之翼", ["Mushgrove Algae Pool"] = "蘑菇林海藻池", ["Confetti Shark"] = "彩纸鲨鱼",
    ["Glimmerfin Suit Lvl 3"] = "微光鳍套装3级", ["Papa Smurf"] = "蓝精灵爸爸（保留原词）", ["Frigid Shrimp"] = "寒冷虾", ["Ancient Fragment"] = "远古碎片",
    ["Beach Crate"] = "海滩宝箱", ["Coral Emperor"] = "珊瑚帝王", ["Azureback Haddock School"] = "蓝背黑线鳕鱼群", ["Corsair Grouper"] = "海盗石斑鱼",
    ["Seaspawn Shrimp School"] = "海生虾鱼群", ["Glider"] = "滑翔翼", ["Thunder Serpent"] = "雷霆海蛇", ["Nessie's Spine"] = "尼斯湖水怪的脊椎",
    ["Aureolin"] = "金黄色的", ["Auto Sell All"] = "全部自动出售", ["Idolfish"] = "偶像鱼（结合"Idol"梗，保留原词）", ["Reefrunner Snapper"] = "礁行者笛鲷",
    ["Eternal Frostwhale"] = "永恒霜鲸", ["Edestus"] = "剪齿鲨（古生物名称，保留原词）", ["Blue Tang"] = "蓝刺尾鱼", ["Orca Egg"] = "虎鲸蛋",
    ["oldreamv"] = "奥尔德雷姆v（用户名，保留原词）", ["Glimmer Guppy"] = "微光孔雀鱼", ["Submarine Top"] = "潜水艇顶部", ["Galactic"] = "银河的",
    ["Net Wolffish"] = "网狼鱼", ["Spine Bone"] = "脊椎骨", ["Tide Fang"] = "潮汐尖牙", ["Ginsu Shark"] = " Ginsu鲨鱼（Ginsu指锋利刀具，保留原词）",
    ["Crawling Angler"] = "爬行琵琶鱼", ["Oracle Minnow"] = "神谕米诺鱼", ["Rockstar Hermit Crab"] = "摇滚明星寄居蟹", ["Alligator Gar"] = "鳄雀鳝",
    ["Squirrelfish"] = "松鼠鱼", ["Icefang Barracuda"] = "冰牙梭鱼", ["Regular Token"] = "普通代币", ["library"] = "图书馆",
    ["Winter's Edge"] = "冬日之刃", ["Timeless Threading"] = "永恒线迹", ["Great Rod of Oscar"] = "奥斯卡的伟大钓竿", ["Sea Urchin"] = "海胆",
    ["Lightened"] = "变轻的", ["If any matches then stop"] = "若有任何匹配则停止", ["Luminescent Minnow"] = "发光米诺鱼", ["Exotic"] = " exotic的（指外来的、奇异的，保留原词）",
    ["Magnifying Glass"] = "放大镜", ["Treble Bass"] = "三倍低音（音乐术语，保留原词）", ["Summit Rod"] = "巅峰钓竿", ["Echo Koi"] = "回声锦鲤",
    ["If Fish"] = "若为鱼类", ["Brickhorse"] = "砖块马", ["Minty"] = "薄荷味的", ["Brine Shrimp"] = "卤虫",
    ["Overclocked"] = "超频的", ["Abyssal Goliath"] = "深渊巨人", ["Steady Rod"] = "稳定钓竿", ["Emperor Jellyfish"] = "帝王水母",
    ["Ember Snapper"] = "余烬笛鲷", ["Wisp"] = "小精灵", ["Gem Dolphin"] = "宝石海豚", ["Deep Behemoth"] = "深海巨兽",
    ["Auto Equip Bait"] = "自动装备诱饵", ["Moon Idol Sea 1"] = "1号海域月亮偶像", ["Hellfire Haddock"] = "地狱火黑线鳕", ["Phantom Leech"] = "幽灵水蛭",
    ["Big"] = "大的", ["Gilded Arch"] = "镀金拱门", ["If Rarity"] = "若按稀有度", ["Cookie"] = "饼干",
    ["Rainbow Cluster Rod"] = "彩虹集群钓竿", ["Auric Rod"] = "金色钓竿", ["Flamangler"] = "火焰angler（angler指琵琶鱼，保留原词）", ["Floppy"] = "松软的",
    ["Flying Fish"] = "飞鱼", ["Fangborn Gar"] = "尖牙雀鳝", ["Amount to Offer"] = "出价数量", ["Waveborne"] = "浪生的",
    ["Twilight Glowfish"] = "黄昏发光鱼", ["Quantum"] = "量子的", ["Mango Smoothie"] = "芒果冰沙", ["Bloodscript Eel"] = "血契鳗鱼",
    ["Charybdis"] = "卡律布狄斯（神话中的漩涡女妖，保留原词）", ["Equip Bait Event Zone"] = "事件区域装备诱饵", ["Anomalocaris"] = "奇虾（古生物名称，保留原词）", ["Pike"] = "梭鱼",
    ["Pond Emperor"] = "池塘帝王", ["Frigid Antlers"] = "寒冷鹿角", ["Sinister"] = "邪恶的", ["Sea Mine"] = "水雷",
    ["Deep-sea Hatchetfish"] = "深海斧头鱼", ["Skrunkly"] = "斯克鲁克利（游戏专属名称，保留原词）", ["Sockeye Salmon"] = "红鲑", ["Basalt"] = "玄武岩",
    ["Pearl"] = "珍珠", ["Void Angler"] = "虚空琵琶鱼", ["Until Weight Over (kg)"] = "直到重量超过（千克）", ["Suckermouth Catfish"] = "吸口鲶鱼",
    ["Squid"] = "鱿鱼", ["Serene"] = "宁静的", ["Voidglow Ghostfish"] = "虚空发光幽灵鱼", ["Rod Of The Eternal King"] = "永恒之王钓竿",
    ["Miku's Melody"] = "初音未来的旋律（Miku指初音未来，保留原词）", ["Hide Level & Coins"] = "隐藏等级和硬币", ["Phantom Brine"] = "幽灵盐水", ["Sunny O'Coin"] = "桑尼·奥 coin（coin指硬币，保留原词）",
    ["Oyster toadfish"] = "牡蛎蟾鱼", ["Slain Maw"] = "被斩杀的巨口", ["The Twig"] = "小树枝", ["Krampus's Rod"] = "坎卜斯钓竿（Krampus指圣诞恶魔，保留原词）",
    ["Skip Cutscenes"] = "跳过过场动画", ["Galleon Goliath"] = "西班牙大帆船巨人",
}

-- 智能汉化函数
local function smartTranslate()
    local translatedCount = 0
    
    -- 扫描所有GUI元素
    local function scanGui(guiParent)
        for _, gui in pairs(guiParent:GetDescendants()) do
            if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then
                local text = gui.Text
                if text and text ~= "" then
                    -- 跳过纯数字、空文本和过长的文本
                    if not text:match("^%s*$") and not text:match("^[0-9%.%s,:/]+$") and #text < 100 then
                        local originalText = text
                        local translatedText = text
                        
                        -- 使用词典翻译（先完全匹配，再部分匹配）
                        for eng, chn in pairs(superDictionary) do
                            -- 完全匹配
                            if text == eng then
                                translatedText = chn
                                break
                            -- 单词边界匹配
                            elseif text:find("%f[%a]" .. eng .. "%f[%A]") then
                                translatedText = text:gsub("%f[%a]" .. eng .. "%f[%A]", chn)
                            -- 包含匹配（作为最后手段）
                            elseif text:find(eng) and #eng > 3 then
                                translatedText = text:gsub(eng, chn)
                            end
                        end
                        
                        -- 如果文本被翻译，则更新
                        if translatedText ~= originalText then
                            pcall(function()
                                gui.Text = translatedText
                                translatedCount = translatedCount + 1
                            end)
                        end
                    end
                end
            end
        end
    end
    
    -- 扫描所有GUI容器
    pcall(scanGui, game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
    pcall(scanGui, game:GetService("CoreGui"))
    pcall(scanGui, game:GetService("StarterGui"))
    pcall(scanGui, game:GetService("Lighting"))
    
    return translatedCount
end

-- 一键汉化按钮
HHTab:CreateButton({
    Name = "🚀 一键超级汉化",
    Callback = function()
        Rayfield:Notify({
            Title = "超级汉化",
            Content = "正在扫描和翻译界面文本...",
            Duration = 3,
            Image = 4483362458,
        })
        
        local count = smartTranslate()
        
        Rayfield:Notify({
            Title = "汉化完成",
            Content = "成功翻译了 " .. count .. " 个文本！\n词典包含 " .. #superDictionary .. " 个词汇",
            Duration = 6,
            Image = 4483362458,
        })
    end,
})

-- 深度汉化按钮
HHTab:CreateButton({
    Name = "🔍 深度扫描汉化",
    Callback = function()
        Rayfield:Notify({
            Title = "深度汉化",
            Content = "正在进行深度扫描和翻译...",
            Duration = 3,
            Image = 4483362458,
        })
        
        local totalCount = 0
        
        -- 多次扫描以确保覆盖
        for i = 1, 3 do
            local count = smartTranslate()
            totalCount = totalCount + count
            task.wait(0.3)
        end
        
        Rayfield:Notify({
            Title = "深度汉化完成",
            Content = "总共翻译了 " .. totalCount .. " 个文本！",
            Duration = 5,
            Image = 4483362458,
        })
    end,
})

-- 自动汉化开关
local autoTranslateEnabled = false
local autoTranslateConnection
HHTab:CreateToggle({
    Name = "🔄 自动汉化模式",
    CurrentValue = false,
    Flag = "AutoTranslateToggle",
    Callback = function(Value)
        autoTranslateEnabled = Value
        if Value then
            Rayfield:Notify({
                Title = "自动汉化",
                Content = "自动汉化模式已开启，将持续监控新界面",
                Duration = 3,
                Image = 4483362458,
            })
            
            -- 监听新添加的UI元素
            autoTranslateConnection = game.DescendantAdded:Connect(function(descendant)
                if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
                    task.wait(0.2)
                    local text = descendant.Text
                    if text and text ~= "" then
                        for eng, chn in pairs(superDictionary) do
                            if text == eng then
                                pcall(function()
                                    descendant.Text = chn
                                end)
                                break
                            elseif text:find("%f[%a]" .. eng .. "%f[%A]") then
                                pcall(function()
                                    descendant.Text = text:gsub("%f[%a]" .. eng .. "%f[%A]", chn)
                                end)
                                break
                            end
                        end
                    end
                end
            end)
        else
            if autoTranslateConnection then
                autoTranslateConnection:Disconnect()
                autoTranslateConnection = nil
            end
            Rayfield:Notify({
                Title = "自动汉化",
                Content = "自动汉化模式已关闭",
                Duration = 3,
                Image = 4483362458,
            })
        end
    end,
})

-- 刷新汉化按钮
HHTab:CreateButton({
    Name = "🔄 刷新界面汉化",
    Callback = function()
        local count = smartTranslate()
        Rayfield:Notify({
            Title = "刷新完成",
            Content = "重新翻译了 " .. count .. " 个文本",
            Duration = 3,
            Image = 4483362458,
        })
    end,
})

-- 汉化统计
HHTab:CreateButton({
    Name = "📊 显示汉化统计",
    Callback = function()
        local textCount = 0
        local englishCount = 0
        
        -- 统计界面文本
        local function countTexts(guiParent)
            for _, gui in pairs(guiParent:GetDescendants()) do
                if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then
                    local text = gui.Text
                    if text and text ~= "" then
                        textCount = textCount + 1
                        -- 简单判断是否为英文（包含字母）
                        if text:match("[A-Za-z]") then
                            englishCount = englishCount + 1
                        end
                    end
                end
            end
        end
        
        pcall(countTexts, game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
        pcall(countTexts, game:GetService("CoreGui"))
        pcall(countTexts, game:GetService("StarterGui"))
        
        Rayfield:Notify({
            Title = "汉化统计",
            Content = "总文本数: " .. textCount .. "\n英文文本: " .. englishCount .. "\n词典词汇: " .. #superDictionary,
            Duration = 8,
            Image = 4483362458,
        })
    end,
})

-- 词典管理
HHTab:CreateButton({
    Name = "📚 显示词典信息",
    Callback = function()
        Rayfield:Notify({
            Title = "词典信息",
            Content = "总词汇量: " .. #superDictionary .. "\n覆盖范围: 全面\n支持游戏: 绝大多数",
            Duration = 6,
            Image = 4483362458,
        })
    end,
})

-- 初始自动汉化
spawn(function()
    task.wait(3) -- 等待游戏界面加载
    local count = smartTranslate()
    if count > 0 then
        Rayfield:Notify({
            Title = "自动汉化完成",
            Content = "初始汉化翻译了 " .. count .. " 个文本",
            Duration = 4,
            Image = 4483362458,
        })
    end
end)

print("皮空超级汉化器 - 加载完成！词汇量: " .. #superDictionary)