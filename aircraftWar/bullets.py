from sprites import *

class Bullet(GameSprite):
    """子弹类，继承自GameSprite"""
    def __init__(self):
        super().__init__("./images/bullet1.png", speed=-8)

    def update(self):
        # 调用父类方法----向下移动
        super().update()
        # 判断子弹是否飞出屏幕，是则释放
        if self.rect.bottom <= 0:
            self.kill()
