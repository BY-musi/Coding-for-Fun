from sprites import *
from bullets import *

class Hero(GameSprite):
    """英雄飞机类，继承自GameSprite"""
    def __init__(self):
        # 设置速度为0
        super().__init__("./images/me1.png", speed=0)
        # 位于游戏主窗口的中央
        self.rect.centerx = SCREEN_RECT.centerx
        self.rect.bottom = SCREEN_RECT.height - 10
        # 创建子弹精灵组
        self.bullet_group = pygame.sprite.Group()

    def update(self):
        # 英雄飞机在水平方向移动且不能移动出边界
        if self.rect.x < 0:
            self.rect.x = 0
        elif self.rect.right > SCREEN_RECT.width:
            self.rect.right = SCREEN_RECT.width
        else:
            self.rect.x += self.speed

    def fire(self):
        """英雄飞机发射子弹"""
        for i in (0, 1, 2):
            # 创建子弹精灵
            bullet = Bullet()
            # 设定子弹精灵的位置，应该在英雄飞机的正上方发射
            bullet.rect.y = self.rect.y - 2 * i * bullet.rect.height
            bullet.rect.centerx = self.rect.centerx
            # 子弹精灵加入精灵组
            self.bullet_group.add(bullet)
