from sprites import *

class BackGround(GameSprite):
    """背景类，继承自GameSprite"""

    def __init__(self, is_alt=False):
        # 调用父类方法创建精灵对象
        super().__init__("./images/background.png")
        # 判断是否为背景图像2，若是则改变初始坐标位置
        if is_alt:
            self.rect.y = -SCREEN_RECT.height

    def update(self):
        # 调用父类方法 ---- 向下移动
        super().update()
        if self.rect.y >= SCREEN_RECT.height:
            self.rect.y = -SCREEN_RECT.height
