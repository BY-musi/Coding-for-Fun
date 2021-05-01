from sprites import *


class PlaneGame(object):
    """主游戏类"""

    def __init__(self):
        print("游戏正在初始化...")
        # 创建游戏主窗口
        self.screen = pygame.display.set_mode(SCREEN_RECT.size)
        # 创建游戏时钟
        self.clock = pygame.time.Clock()
        # 调用私有方法，创建精灵和精灵组
        self.__create_sprites()

    def __create_sprites(self):
        """用于创建精灵和精灵组"""
        pass

    def start_game(self):
        """启动游戏"""
        # 游戏主循环


pygame.init()  # 导入并初始化所有Pygame模块

#plane = pygame.Rect(0, 0, 100, 100)
#print("飞机所在的位置: (%d, %d), 飞机的大小: (%d, %d)"
#        % (plane.x, plane.y, plane.width, plane.height))

# 创建游戏主窗口 窗口大小 (480, 700)
window = pygame.display.set_mode((480, 700))

# 加载图片到内存
background = pygame.image.load("./images/background.png")
me1 = pygame.image.load("./images/me1.png")
me2 = pygame.image.load("./images/me2.png")

# 创建敌机精灵和精灵组
enemy_plane1 = GameSprite("./images/enemy1.png", speed=3)
enemy_plane2 = GameSprite("./images/enemy2.png", speed=2)
enemy_plane3 = GameSprite("./images/enemy3_n1.png")
enemy_group = pygame.sprite.Group(enemy_plane1, enemy_plane2, enemy_plane3)


# 创建一个矩形区域对象，设置初始位置
hero_plane = pygame.Rect(189, 574, 102, 126)

# 设置一个时钟
clock = pygame.time.Clock()

while True:
    # 通过交替变换me1.png 和 me2.png 
    # 绘制背景和飞机
    window.blit(background, (0, 0))
    window.blit(me2, hero_plane)
    # 绘制所有敌机精灵
    enemy_group.draw(window)
    enemy_group.update()
    # 刷新显示
    pygame.display.update()
    clock.tick(60)

#    window.blit(background, (0, 0))
#    window.blit(me1, hero_plane)
#    # 刷新显示
#    pygame.display.update()
#    clock.tick(5)

#    if hero_plane.y + hero_plane.height <= 0:
#        hero_plane.y = 700
#    else:
#        hero_plane.y -= 1
    
    # clock.tick(240) # 设置时钟的频率

## 系统休眠 5 秒
#time.sleep(3)

pygame.quit() # 卸载所有pygame模块
