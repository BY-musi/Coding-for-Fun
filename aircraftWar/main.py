from sprites import *
from enemy import *
from background import *
from heroplane import *
from bullets import *


class PlaneGame(object):
    """主游戏类"""

    def __init__(self):
        print("游戏正在初始化...")
        # 创建游戏主窗口
        self.screen = pygame.display.set_mode(SCREEN_RECT.size)
        pygame.display.set_caption("飞机大战")
        # 切换图片
        self.switch_image = True
        # 创建游戏时钟
        self.clock = pygame.time.Clock()
        # 调用私有方法，创建精灵和精灵组
        self.__create_sprites()
        # 设置定时器时间----每隔1秒创建一架敌机
        pygame.time.set_timer(CREATE_ENEMY_EVENT, 1000)
        # 设置定时器事件----每隔0.5秒发射一次子弹
        pygame.time.set_timer(HERO_FIRE_EVENT, 500)

    def __create_sprites(self):
        """用于创建精灵和精灵组"""
        # 创建背景精灵
        background1 = BackGround()
        background2 = BackGround(is_alt=True)
        # 创建英雄飞机精灵、
        self.hero_plane = Hero()
        # 创建背景精灵组
        self.background_group = pygame.sprite.Group(background1, background2)
        # 创建英雄飞机精灵组
        self.hero_group = pygame.sprite.Group(self.hero_plane)
        # 创建敌机精灵组，用于管理敌机精灵
        self.enemy_group = pygame.sprite.Group()

    def __check_collide(self):
        """碰撞检测"""
        # 子弹与敌机之间的碰撞检测
        pygame.sprite.groupcollide(self.enemy_group, self.hero_plane.bullet_group, True, True)
        # 英雄飞机和敌机之间的碰撞检测
        enemy_list = pygame.sprite.spritecollide(self.hero_plane, self.enemy_group, True)
        # 如果发生了碰撞，游戏结束
        if len(enemy_list) > 0:
            self.hero_plane.kill()
            self.__game_over()

    def __event_handler(self):
        """事件监听"""
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                PlaneGame.__game_over()
            elif event.type == CREATE_ENEMY_EVENT:
                # 创建敌机精灵同时加入精灵组
                self.enemy_group.add(Enemy())
            elif event.type == HERO_FIRE_EVENT:
                self.hero_plane.fire()

        # 按键判断
        keys_pressed = pygame.key.get_pressed()
        if keys_pressed[pygame.K_RIGHT]:
            self.hero_plane.speed = 2
        elif keys_pressed[pygame.K_LEFT]:
            self.hero_plane.speed = -2
        else:
            # 当没有按下左右方向键时，速度应该设置为0
            self.hero_plane.speed = 0

    def __update_sprites(self):
        """画面更新"""
        self.background_group.update()
        self.background_group.draw(self.screen)
        self.hero_group.update()
        self.hero_group.draw(self.screen)
        self.enemy_group.update()
        self.enemy_group.draw(self.screen)

        self.hero_plane.bullet_group.update()
        self.hero_plane.bullet_group.draw(self.screen)

    def start_game(self):
        """启动游戏"""
        # 游戏主循环
        while True:
            # 设置刷新频率为60
            self.clock.tick(60)
            # 事件监听
            self.__event_handler()
            # 碰撞检测
            self.__check_collide()
            # 画面更新
            self.__update_sprites()
            # 游戏主窗口刷新显示
            pygame.display.update()

    @staticmethod
    def __game_over():
        """结束游戏"""
        print("游戏结束...")
        pygame.quit()
        exit()


if __name__ == "__main__":
    # 初始化pygame
    pygame.init()
    # 创建游戏对象
    game = PlaneGame()
    # 启动游戏
    game.start_game()

