from sprites import *

class Enemy(GameSprite):
    """敌机精灵类，继承自GameSprite"""

    def __init__(self):
        # 随机抽取敌机
        number = random.randint(1, 3)
        if number == 1:
            # 调用父类方法创建精灵对象
            super().__init__("./images/enemy1.png")
        elif number == 2:
            # 调用父类方法创建精灵对象
            super().__init__("./images/enemy2.png")
        elif number == 3:
            super().__init__("./images/enemy3_n1.png")

        # 随机抽取出场位置
        self.rect.x = random.randrange(0, (SCREEN_RECT.width - self.rect.width), self.rect.width)
        # 随机抽取出场速度
        self.speed = random.randint(1, 3)
        # 初始位置应该在游戏主窗口的上方
        self.rect.y = -self.rect.height

    def update(self):
        # 调用父类的方法----向下移动
        super().update()
        # 判断是否飞出屏幕，是则移出精灵组，释放内存
        if self.rect.y >= SCREEN_RECT.height:
            self.kill()
